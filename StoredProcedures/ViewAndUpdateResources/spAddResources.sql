
DROP PROCEDURE spAddResources

CREATE PROCEDURE spAddResources
	@username varchar(20),
	@title varchar(50),
	@location varchar(50),
	@acquisitionDate Date,
	@removalDate Date,
	@distributor varchar(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN
        -- Check if the user has a role like 'employee'
        IF EXISTS (SELECT 1 FROM USERS WHERE username = @username AND role LIKE '%employee%')
        BEGIN
			INSERT INTO Resources values
			(@title, @location, @acquisitionDate, @removalDate, @distributor);
        END
        ELSE
        BEGIN
            SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
END;
go

exec spAddResources
	@username = 'usernameAmelie',
	@title = 'Gozilla',
	@location = 'Pacific Rim',
	@acquisitionDate = '23-Nov-2015',
	@removalDate = '23-Nov-2025',
	@distributor = 'Columbia'

select * from users;

select * from Resources;
