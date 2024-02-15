CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[PlacedDate] [datetime]  NOT NULL
	CONSTRAINT DF_Orders_PlacedDate
	DEFAULT GETDATE(),
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
	(
		[OrderID] ASC
	),
	CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
	REFERENCES [dbo].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
	REFERENCES [dbo].[Employees] ([EmployeeID]),
	CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusID])
	REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
);
GO