
CREATE PROCEDURE spUpdateResources
    @username VARCHAR(20),
	@resourceID int,
    @title VARCHAR(50),
    @location VARCHAR(50),
    @acquisitionDate DATE,
    @removalDate DATE,
    @distributor VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM USERS WHERE username = @username AND role LIKE '%employee%')
    BEGIN
        UPDATE Resources
        SET
            Title = COALESCE(@title, Title),
            Location = COALESCE(@location, Location),
            AcquisitionDate = COALESCE(@acquisitionDate, AcquisitionDate),
            RemovalDate = COALESCE(@removalDate, RemovalDate),
            Distributor = COALESCE(@distributor, Distributor)
        WHERE
            resourceID = @resourceID;
    END
    ELSE
    BEGIN
        SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;

DROP PROCEDURE spUpdateResources


exec spUpdateResources
    @username = 'userNameVishnu',
	@resourceID = 1,
    @title = 'Genshin Impact',
    @location = null,
    @acquisitionDate = null,
    @removalDate = null,
    @distributor = null

select * from resources
