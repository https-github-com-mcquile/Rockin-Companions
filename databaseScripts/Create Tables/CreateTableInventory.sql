CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[InventoryTypeID] [int] NOT NULL,
	[Title] [varchar] (20) NULL,
	[Description] [varchar] (120) NULL,
	[Price] [smallmoney]  NOT NULL,
	[ActiveTimestamp] [datetime] NOT NULL 
	CONSTRAINT DF_Inventory_ActiveTimestamp
	DEFAULT GETDATE(), 
	[QuantityOnHand] [int] NOT NULL,
	CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
	(
		[InventoryID] ASC
	),
	CONSTRAINT [FK_Inventory_InventoryType] FOREIGN KEY([InventoryTypeID])
	REFERENCES [dbo].[InventoryType] ([InventoryTypeID])
);
GO