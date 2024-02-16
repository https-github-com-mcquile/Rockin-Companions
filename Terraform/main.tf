provider "aws" {
  region = "eu-west-1" # Change to your preferred AWS region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "main_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1a"
}

resource "aws_subnet" "main_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-1b"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}


resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main_a.id
  route_table_id = aws_route_table.r.id
}

resource "aws_db_instance" "mssql" {
  allocated_storage    = 20
  storage_type         = "gp3"
  engine               = "sqlserver-ex"
  instance_class       = "db.t3.micro"  # Updated to micro instance
  username             = "admin"
  password             = "your_secure_password"  # Consider using a secrets manager
  db_subnet_group_name = aws_db_subnet_group.main.name
  publicly_accessible  = true
  skip_final_snapshot  = true
  multi_az             = false
  vpc_security_group_ids = [aws_security_group.mssql_sg.id]
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.main_a.id, aws_subnet.main_b.id]
}

resource "aws_security_group" "mssql_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


