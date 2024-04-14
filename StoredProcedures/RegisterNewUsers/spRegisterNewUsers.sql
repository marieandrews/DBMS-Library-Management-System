-- Stored procedure to add new users to Users table (employees only)

CREATE PROCEDURE RegisterUser
    @EMAIL_EMPLOYEE VARCHAR(50),
    @PASSWORD_EMPLOYEE VARCHAR(50),
	@USERNAME VARCHAR(20),
	@PASSWORD_NEW VARCHAR(20),
	@NAME VARCHAR(200),
	@EMAIL_NEW VARCHAR(200),
	@PHONENUMBER VARCHAR(20),
	@ADDRESS VARCHAR(100),
	@ROLE VARCHAR(50),
	@ACCOUNTSTATUS VARCHAR(50)
 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LoginResult TABLE (
        MESSAGE VARCHAR(100),
        ISSUCCESS BIT
    );

    INSERT INTO @LoginResult EXEC LOGIN @EMAIL_EMPLOYEE, @PASSWORD_EMPLOYEE;

    DECLARE @LoginSuccess BIT;
    SELECT @LoginSuccess = ISSUCCESS FROM @LoginResult;

    IF @LoginSuccess = 1
    BEGIN
        DECLARE @UserRole VARCHAR(50);

        SELECT @UserRole = Role
        FROM Users
        WHERE Email = @EMAIL_EMPLOYEE AND [Password] = @PASSWORD_EMPLOYEE;

        IF @UserRole = 'Employee'
        BEGIN
            INSERT INTO Users 
            VALUES(@USERNAME, @PASSWORD_NEW, @NAME, @EMAIL_NEW, @PHONENUMBER, @ADDRESS, @ROLE, @ACCOUNTSTATUS, 0);

            SELECT 'User inserted successfully' AS MESSAGE, 1 AS ISSUCCESS;
        END
        ELSE
        BEGIN
            SELECT 'User is not an employee' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
    ELSE
    BEGIN
        SELECT 'Login failed' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;

EXEC RegisterUser @EMAIL_EMPLOYEE = 'AMELIEPOULAIN@YAHOO.COM', @PASSWORD_EMPLOYEE = 'SECRETAGENT', @USERNAME = 'usernameMarie',
@PASSWORD_NEW = 'ozyisthebest', @NAME = 'Marie', @EMAIL_NEW = 'marie@gmail.com', @PHONENUMBER = '3864786520', @ADDRESS = '1612 36e Ave', 
@ROLE = 'Member', @ACCOUNTSTATUS = 'open';



