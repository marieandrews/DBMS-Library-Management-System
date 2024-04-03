CREATE PROCEDURE LOGOUT
    @EMAIL VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE USERS SET ISLOGGEDIN = 0 WHERE EMAIL = @EMAIL;
    SELECT 'LOGOUT SUCCESSFUL' AS MESSAGE, 1 AS ISSUCCESS;
END;
GO

EXEC LOGOUT @EMAIL = 'VISHNU222@GMAIL.COM';

SELECT * FROM USERS;

--DROP PROCEDURE LOGOUT;