CREATE TABLE [dbo].[VAT](
	[VATID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [float] NOT NULL,
	[ActiveTimestamp] [datetime] NOT NULL 
	CONSTRAINT DF_VAT_ActiveTimestamp
    DEFAULT GETDATE(), 
	CONSTRAINT [PK_VAT] PRIMARY KEY CLUSTERED 
	(
		[VATID] ASC
	)
);
GO