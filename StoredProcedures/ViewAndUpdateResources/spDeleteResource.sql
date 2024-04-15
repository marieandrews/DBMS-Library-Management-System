CREATE PROCEDURE spDeleteResource
    @username VARCHAR(20),
    @resourceID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM USERS WHERE username = @username AND role LIKE '%employee%')
    BEGIN
        DELETE FROM Resources
        WHERE ResourceID = @resourceID;
    END
    ELSE
    BEGIN
        SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;

exec spDeleteResource @username = 'userNameVishnu', @resourceID = 1;

select * from Resources
