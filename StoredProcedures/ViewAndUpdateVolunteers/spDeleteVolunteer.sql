DROP PROCEDURE IF EXISTS spDeleteVolunteer;

CREATE PROCEDURE spDeleteVolunteer
    @emp_username VARCHAR(20),
    @vol_username VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM USERS WHERE username = @emp_username AND role LIKE '%head-employee%')
    BEGIN
        DELETE FROM users
        WHERE username = @vol_username;

        SELECT 'Volunteer deleted successfully' AS MESSAGE, 1 AS ISSUCCESS;
    END
    ELSE
    BEGIN
        SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;

exec spDeleteVolunteer
    @emp_username = 'usernameAmelie',
    @vol_username = 'usernamebob'

select * from users
