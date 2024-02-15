USE RockShopDB;
GO

CREATE FUNCTION dbo.GetCustomersWithAddresses()
RETURNS TABLE
AS
RETURN
(
    SELECT
        Customers.CustomerID,
        Customers.FirstName,
        Customers.LastName,
        Customers.Email,
        Customers.CellNumber,
        Addresses.AddressName,
        Addresses.Location
    FROM
        Customers
    LEFT JOIN
        CustomersAddresses ON Customers.CustomerID = CustomersAddresses.CustomerID
    LEFT JOIN
        Addresses ON CustomersAddresses.AddressID = Addresses.AddressID
);