--liquibase formatted sql

--changeset Michiel:1
CREATE PROCEDURE [dbo].[InsertCustomer]
    @FirstName VARCHAR(120),
    @LastName VARCHAR(120),
    @Email VARCHAR(255),
    @CellNumber CHAR(10)
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY
        BEGIN TRANSACTION

        INSERT INTO [dbo].[Customers] ([FirstName], [LastName], [Email], [CellNumber])
        VALUES (@FirstName, @LastName, @Email, @CellNumber)

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
