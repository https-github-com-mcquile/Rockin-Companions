USE master
IF EXISTS(select * from sys.databases where name='RockShopDB')
DROP DATABASE RockShopDB

CREATE DATABASE RockShopDB;
GO

USE RockShopDB;
GO


CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressName] [varchar] (120),
	[Location] [geography] NULL,
	CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
	(
		[AddressID] ASC
	)
);
GO


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


CREATE TABLE [dbo].[CustomersAddresses](
	[CustomersAddressesID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PersonalisedHomeAddress] [varchar] (120) NOT NULL,
	CONSTRAINT [PK_CustomersAddresses] PRIMARY KEY CLUSTERED 
	(
		[CustomersAddressesID] ASC
	),
);
GO


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

CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar] (120) NOT NULL,
	CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
	(
		[OrderStatusID] ASC
	)
);
GO

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[PlacedDate] [datetime]  NOT NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
	(
		[OrderID] ASC
	)
);
GO

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

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO


CREATE TABLE [dbo].[InventoryType](
	[InventoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar] (120) NULL,

	CONSTRAINT [PK_InventoryType] PRIMARY KEY CLUSTERED 
	(
		[InventoryTypeID] ASC
	)
);
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryTypeID] [int] NOT NULL,
	[Title] [varchar] (20) NULL,
	[Description] [varchar] (120) NULL,
	[Price] [smallmoney]  NOT NULL,
	[ActiveTimestamp] [datetime] NOT NULL, 

	CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
	(
		[InventoryID] ASC
	)
);
GO

ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD CONSTRAINT [FK_Inventory_InventoryType] FOREIGN KEY([InventoryTypeID])
REFERENCES [dbo].[InventoryType] ([InventoryTypeID])
GO

ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_InventoryType]
GO
 
CREATE TABLE [dbo].[OrderLines](
	[OrderLinesID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL, 
	CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
	(
		[OrderLinesID] ASC
	)
);
GO


ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders]
GO

ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD CONSTRAINT [FK_OrderLines_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO

ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_OrderStatus]
GO

CREATE TABLE [dbo].[VAT](
	[VATID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[ActiveTimestamp] [datetime] NOT NULL, 
	CONSTRAINT [PK_VAT] PRIMARY KEY CLUSTERED 
	(
		[VATID] ASC
	)
);
GO