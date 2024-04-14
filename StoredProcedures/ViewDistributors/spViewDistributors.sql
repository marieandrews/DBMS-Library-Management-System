
DROP PROCEDURE spViewDistributors

CREATE PROCEDURE spViewDistributors
    @Username NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN
        -- Check if the user has a role like 'employee'
        IF EXISTS (SELECT 1 FROM USERS WHERE Username = @Username AND role LIKE '%employee%')
        BEGIN
            SELECT STRING_AGG(Distributor, ', ') AS Distributors, 1 as ISSUCCESS
			FROM (
				SELECT DISTINCT Distributor
				FROM Resources
			) AS Subquery;

        END
        ELSE
        BEGIN
            SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
END;
go

exec spViewDistributors @username = 'usernameAmelie'

select * from users;