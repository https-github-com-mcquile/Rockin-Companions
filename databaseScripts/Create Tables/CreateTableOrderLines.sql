CREATE TABLE [dbo].[OrderLines](
	[OrderLinesID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL, 
	CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
	(
		[OrderLinesID] ASC
	),
	CONSTRAINT [FK_OrderLines_Orders] FOREIGN KEY([OrderID])
	REFERENCES [dbo].[Orders] ([OrderID]),
	CONSTRAINT [FK_OrderLines_Inventory] FOREIGN KEY([InventoryID])
	REFERENCES [dbo].[Inventory] ([InventoryID])
);
GO