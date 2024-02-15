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