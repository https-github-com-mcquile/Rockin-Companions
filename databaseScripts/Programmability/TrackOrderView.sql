Use RockShopDB
GO
    
CREATE VIEW vTrackOrder
AS
SELECT 
    o.OrderID,
    o.CustomerID,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    o.EmployeeID,
    e.CellNumber AS EmployeeCellNumber,
    e.IdentityNumber,
    os.Description AS OrderStatusDescription,
    o.PlacedDate
FROM 
    Orders o
INNER JOIN 
    Customers c ON o.CustomerID = c.CustomerID
INNER JOIN 
    Employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN 
    OrderStatus os ON o.OrderStatusID = os.OrderStatusID;

GO
