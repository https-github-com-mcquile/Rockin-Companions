USE master
IF EXISTS(select * from sys.databases where name='RockShopDB')
DROP DATABASE RockShopDB

CREATE DATABASE RockShopDB;
GO

USE RockShopDB;
GO

-- Create the Addresses table
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [geography] NULL,
	CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
	(
		[AddressID] ASC
	)
);
GO

-- Create the Customers table
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](120) NOT NULL,
	[LastName] [varchar](120) NULL,
	[Email] [varchar](255) NULL,
	[CellNumber] [char] (10) NOT NULL,
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
	(
		[CustomerID] ASC
	)
);
GO

-- Create the CustomersAddresses table
CREATE TABLE [dbo].[CustomersAddresses](
	[CustomersAddressesID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	CONSTRAINT [PK_CustomersAddresses] PRIMARY KEY CLUSTERED 
	(
		[CustomersAddressesID] ASC
	),
);
GO

--Add Foreign Keys For CustomersAddresses Table
ALTER TABLE [dbo].[CustomersAddresses]  WITH CHECK ADD CONSTRAINT [FK_CustomersAddresses_Addresses] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO

ALTER TABLE [dbo].[CustomersAddresses] CHECK CONSTRAINT [FK_CustomersAddresses_Addresses]
GO

ALTER TABLE [dbo].[CustomersAddresses]  WITH CHECK ADD CONSTRAINT [FK_CustomerAddresses_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[CustomersAddresses] CHECK CONSTRAINT [FK_CustomerAddresses_Customers]
GO

-- Create the Employees table
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NULL,
	[CellNumber] [char] (10) NOT NULL,
	[IdentityNumber] [char] (13) NOT NULL,
	[TimeOfRegistration] [datetime] NOT NULL,
	CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC
	)
);
GO

-- Create the Orders table
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderStatus] [char] (10) NOT NULL, --check enum
	[Date] [date]  NOT NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
	(
		[OrderID] ASC
	)
);
GO

--Add Foreign Keys For Orders Table
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO

-- Create the Inventory table (Foreign Key to OrderLines?)
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar] (20) NULL,
	[Description] [varchar] (120) NULL,
	[price] [int]  NOT NULL,
	[ActiveTimestamp] [datetime] NOT NULL, 
	[InventoryType] [char](20)  NOT NULL, --check enum
	CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
	(
		[InventoryID] ASC
	)
);
GO

-- Create the OrderLines table 
CREATE TABLE [dbo].[OrderLines](
	[OrderLinesID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderStatus] [char] (10) NOT NULL, --check enum
	CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
	(
		[OrderLinesID] ASC
	)
);
GO

--Add Foreign Keys For OrderLines Table
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders]
GO
