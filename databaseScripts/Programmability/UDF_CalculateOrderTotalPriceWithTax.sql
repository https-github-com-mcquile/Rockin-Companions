--liquibase formatted sql

--changeset McQuile:1
CREATE FUNCTION dbo.CalculateOrderTotalPriceWithTax(@orderID INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @totalPrice MONEY
    
    SELECT @totalPrice = SUM(i.Price)
    FROM OrderLines ol
    INNER JOIN Inventory i ON ol.InventoryID = i.InventoryID
    WHERE ol.OrderID = @orderID

    DECLARE @taxRate FLOAT
    SELECT @taxRate = Value
    FROM VAT
    WHERE ActiveTimestamp <= GETDATE()

    SET @totalPrice = @totalPrice * (1 + @taxRate)

    RETURN @totalPrice
END;
