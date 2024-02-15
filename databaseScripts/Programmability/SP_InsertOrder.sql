--liquibase formatted sql

--changeset Kay:1
CREATE PROCEDURE [dbo].[InsertOrder] (
    @CustomerID INT,
    @EmployeeID INT,
    @OrderStatusID INT,
    @PlacedDate DATETIME
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @PlacedDate IS NULL
        SET @PlacedDate = GETDATE();

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderStatusID], [PlacedDate])
        VALUES (@CustomerID, @EmployeeID, @OrderStatusID, @PlacedDate);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
