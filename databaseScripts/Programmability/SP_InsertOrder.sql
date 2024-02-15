--liquibase formatted sql

--changeset Kay:1
CREATE PROCEDURE [dbo].[InsertOrder] (
    @CustomerID INT,
    @EmployeeID INT,
    @OrderStatusID INT
)
AS
BEGIN
    SET NOCOUNT ON


    BEGIN TRY
        BEGIN TRANSACTION

        INSERT INTO [dbo].[Orders] ([CustomerID], [EmployeeID], [OrderStatusID])
        VALUES (@CustomerID, @EmployeeID, @OrderStatusID)

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION

        DECLARE @ErrorMessage NVARCHAR(4000)
        DECLARE @ErrorSeverity INT
        DECLARE @ErrorState INT

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE()

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState)
    END CATCH
END;
