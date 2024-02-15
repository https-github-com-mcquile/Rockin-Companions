CREATE TABLE [dbo].[CustomersAddresses](
[CustomersAddressesID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PersonalisedHomeAddress] [varchar] (120) NOT NULL,
	CONSTRAINT [PK_CustomersAddresses] PRIMARY KEY CLUSTERED 
	(
		[CustomersAddressesID] ASC
	),
	CONSTRAINT [FK_CustomersAddresses_Addresses] FOREIGN KEY([AddressID])
	REFERENCES [dbo].[Addresses] ([AddressID]),
    CONSTRAINT [FK_CustomerAddresses_Customers] FOREIGN KEY([CustomerID])
	REFERENCES [dbo].[Customers] ([CustomerID])
);
GO
