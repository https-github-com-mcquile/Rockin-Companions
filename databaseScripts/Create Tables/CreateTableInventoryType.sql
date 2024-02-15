CREATE TABLE [dbo].[InventoryType](
	[InventoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar] (120) NULL,

	CONSTRAINT [PK_InventoryType] PRIMARY KEY CLUSTERED 
	(
		[InventoryTypeID] ASC
	)
);
GO