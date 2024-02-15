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