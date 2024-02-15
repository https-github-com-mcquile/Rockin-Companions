CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NULL,
	[CellNumber] [char] (10) NOT NULL,
	[IdentityNumber] [char] (13) NOT NULL,
	[TimeOfRegistration] [datetime] NOT NULL
	CONSTRAINT DF_Employees_TimeOfRegistration
	DEFAULT GETDATE(),
	CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
	(
		[EmployeeID] ASC
	)
);
GO