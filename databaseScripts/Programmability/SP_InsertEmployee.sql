--liquibase formatted sql

--changeset Michiel:1
CREATE PROCEDURE InsertEmployee (
    @Email VARCHAR(255),
    @CellNumber CHAR(10),
    @IdentityNumber CHAR(13)
)
AS
BEGIN
    SET NOCOUNT ON


    BEGIN TRY
        BEGIN TRANSACTION

        INSERT INTO Employees (Email, CellNumber, IdentityNumber)
        VALUES (@Email, @CellNumber, @IdentityNumber)

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
