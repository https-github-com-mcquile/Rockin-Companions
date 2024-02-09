USE RockShopDB

INSERT INTO [dbo].[Addresses] ([AddressName], [Location])
VALUES 
    ('Home', geography::Point(47.1234, -122.3456, 4326)),
    ('Work', geography::Point(47.5678, -122.7890, 4326)),
    ('Work', geography::Point(47.9012, -122.1234, 4326)),
    ('Work', NULL),
    ('House', geography::Point(47.3456, -122.6789, 4326)),
    ('Work', geography::Point(47.8901, -122.5678, 4326)),
    ('Home', geography::Point(47.2345, -122.4567, 4326)),
    ('Home', NULL),
    ('House', geography::Point(47.6789, -122.9012, 4326)),
    ('Work', geography::Point(47.5432, -122.7890, 4326)),
    ('House', geography::Point(47.0123, -122.6789, 4326)),
    ('Work', geography::Point(47.9012, -122.5678, 4326)),
    ('House', geography::Point(47.7890, -122.4567, 4326)),
    ('Home', geography::Point(47.3456, -122.3456, 4326)),
    ('Home', geography::Point(47.6789, -122.2345, 4326)),
    ('Home', geography::Point(47.9012, -122.1234, 4326)),
    ('Home', geography::Point(47.1234, -122.0123, 4326)),
    ('Work', geography::Point(47.4567, -122.9012, 4326)),
    ('Work', geography::Point(47.7890, -122.7890, 4326)),
    ('Home', geography::Point(47.2345, -122.6789, 4326));
GO

INSERT INTO [dbo].[InventoryType] ([Description])
VALUES 
    ('Type 1'),
    ('Type 2'),
    ('Type 3'),
    ('Type 4'),
    ('Type 5'),
    ('Type 6'),
    ('Type 7'),
    ('Type 8'),
    ('Type 9'),
    ('Type 10'),
    ('Type 11'),
    ('Type 12'),
    ('Type 13'),
    ('Type 14'),
    ('Type 15'),
    ('Type 16'),
    ('Type 17'),
    ('Type 18'),
    ('Type 19'),
    ('Type 20');
GO

INSERT INTO [dbo].[OrderStatus] ([Description])
VALUES 
    ('Pending'),
    ('Processing'),
    ('Shipped'),
    ('Delivered');
GO

INSERT INTO [dbo].[Customers] ([FirstName], [LastName], [Email], [CellNumber])
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', '1357924680'),
    ('Emily', 'Brown', 'emily.brown@example.com', '2468013579'),
    ('David', 'Martinez', 'david.martinez@example.com', '3692581470'),
    ('Jennifer', 'Jones', 'jennifer.jones@example.com', '1592637480'),
    ('Christopher', 'Davis', 'christopher.davis@example.com', '7531902468'),
    ('Jessica', 'Miller', 'jessica.miller@example.com', '9876543210'),
    ('Daniel', 'Wilson', 'daniel.wilson@example.com', '4561237890'),
    ('Sarah', 'Taylor', 'sarah.taylor@example.com', '6549873210'),
    ('Matthew', 'Anderson', 'matthew.anderson@example.com', '1472583690'),
    ('Lauren', 'Thomas', 'lauren.thomas@example.com', '3216549870'),
    ('Andrew', 'Hernandez', 'andrew.hernandez@example.com', '8529637410'),
    ('Elizabeth', 'Young', 'elizabeth.young@example.com', '3691472580'),
    ('Ryan', 'King', 'ryan.king@example.com', '9517538246'),
    ('Megan', 'Lee', 'megan.lee@example.com', '4561237890'),
    ('James', 'White', 'james.white@example.com', '7894561230'),
    ('Ashley', 'Hall', 'ashley.hall@example.com', '8529637410'),
    ('Justin', 'Adams', 'justin.adams@example.com', '7531592640'),
    ('Amanda', 'Nelson', 'amanda.nelson@example.com', '3216549870');
GO

DECLARE @Counter INT = 1
WHILE @Counter <= 20
BEGIN
    INSERT INTO [dbo].[CustomersAddresses] ([AddressID], [CustomerID], [PersonalisedHomeAddress])
    VALUES ((SELECT TOP 1 [AddressID] FROM [dbo].[Addresses] ORDER BY NEWID()), 
            (SELECT TOP 1 [CustomerID] FROM [dbo].[Customers] ORDER BY NEWID()),
            'Personalized Home Address ' + CAST(@Counter AS VARCHAR))
    SET @Counter = @Counter + 1
END
GO

DECLARE @Counter INT = 10
WHILE @Counter <= 20
BEGIN
    INSERT INTO [dbo].[Employees] ([Email], [CellNumber], [IdentityNumber], [TimeOfRegistration])
    VALUES ('employee' + CAST(@Counter AS VARCHAR(2)) + '@example.com', 
            '98765432' + CAST(@Counter AS VARCHAR(2)), 
            'IDNumber' + CAST(@Counter AS VARCHAR(2)), 
            GETDATE())
    SET @Counter = @Counter + 1
END
GO

DECLARE @Counter INT = 1
WHILE @Counter <= 20
BEGIN
    INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderStatusID], [PlacedDate])
    VALUES ((SELECT TOP 1 [CustomerID] FROM [dbo].[Customers] ORDER BY NEWID()), 
            (SELECT TOP 1 [EmployeeID] FROM [dbo].[Employees] ORDER BY NEWID()), 
            (SELECT TOP 1 [OrderStatusID] FROM [dbo].[OrderStatus] ORDER BY NEWID()), 
            GETDATE())
    SET @Counter = @Counter + 1
END
Go

INSERT INTO [dbo].[Inventory] ([InventoryTypeID], [Title], [Description], [price], [ActiveTimestamp])
VALUES 
    (1, 'Item 1', 'Description for Item 1', 771.89, GETDATE()),
	(1, 'Item 2', 'Description for Item 2', 108.92, GETDATE()),
	(1, 'Item 3', 'Description for Item 3', 578.76, GETDATE()),
	(1, 'Item 4', 'Description for Item 4', 315.55, GETDATE()),
	(2, 'Item 5', 'Description for Item 5', 633.04, GETDATE()),
	(2, 'Item 6', 'Description for Item 6', 171.68, GETDATE()),
	(2, 'Item 7', 'Description for Item 7', 635.74, GETDATE()),
	(2, 'Item 8', 'Description for Item 8', 859.27, GETDATE()),
	(2, 'Item 9', 'Description for Item 9', 119.26, GETDATE()),
	(2, 'Item 10', 'Description for Item 10', 622.12, GETDATE()),
	(3, 'Item 11', 'Description for Item 11', 670.17, GETDATE()),
	(3, 'Item 12', 'Description for Item 12', 523.81, GETDATE()),
	(3, 'Item 13', 'Description for Item 13', 727.47, GETDATE()),
	(9, 'Item 14', 'Description for Item 14', 739.94, GETDATE()),
	(9, 'Item 15', 'Description for Item 15', 696.27, GETDATE()),
	(9, 'Item 16', 'Description for Item 16', 286.38, GETDATE()),
	(9, 'Item 17', 'Description for Item 17', 653.84, GETDATE()),
	(9, 'Item 18', 'Description for Item 18', 632.83, GETDATE()),
	(9, 'Item 19', 'Description for Item 19', 261.37, GETDATE()),
	(9, 'Item 20', 'Description for Item 20', 837.69, GETDATE());
GO

INSERT INTO [dbo].[OrderLines] ([OrderID], [OrderStatusID])
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 4),
    (9, 1),
    (10, 2),
    (11, 3),
    (12, 4),
    (13, 1),
    (14, 2),
    (15, 3),
    (16, 4),
    (17, 1),
    (18, 2),
    (19, 3),
    (20, 4);

