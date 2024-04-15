DROP PROCEDURE IF EXISTS spUpdateVolunteer;

CREATE PROCEDURE spUpdateVolunteer
    @emp_username VARCHAR(20),
    @vol_username VARCHAR(20),
    @password VARCHAR(50),
    @name VARCHAR(50),
    @email VARCHAR(50),
    @phoneNumber VARCHAR(20),
    @address VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM USERS WHERE username = @emp_username AND role LIKE '%head-employee%')
    BEGIN
        UPDATE users
        SET
            password = COALESCE(@password, password),
            name = COALESCE(@name, name),
            email = COALESCE(@email, email),
            phoneNumber = COALESCE(@phoneNumber, phoneNumber),
            address = COALESCE(@address, address)
        WHERE
            username = @vol_username;

        SELECT 'Volunteer updated successfully' AS MESSAGE, 1 AS ISSUCCESS;
    END
    ELSE
    BEGIN
        SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;

exec spUpdateVolunteer
    @emp_username = 'usernameAmelie',
    @vol_username = 'usernamebob',
    @password = null,
    @name = 'New bob',
    @email = null,
    @phoneNumber = null,
    @address = null

select * from users;
