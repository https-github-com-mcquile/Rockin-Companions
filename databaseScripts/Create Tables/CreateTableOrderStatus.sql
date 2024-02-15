CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar] (120) NOT NULL,
	CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
	(
		[OrderStatusID] ASC
	)
);
GO