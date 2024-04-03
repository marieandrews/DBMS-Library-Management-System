CREATE PROCEDURE login
    @email VARCHAR(50),
    @password VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Users WHERE email = @email AND [password] = @password)
    BEGIN
        UPDATE Users SET isLoggedIn = 1 WHERE email = @Email;
        SELECT 'Login successful' AS message, 1 as isSuccess;
    END
    ELSE
    BEGIN
        SELECT 'Invalid username or password' AS message, 0 as isSuccess;
    END
END;
GO

--drop procedure login

exec login @email = 'vishnu222@gmail.com', @password = 'secretAgent';
exec login @email = 'ameliepoulain@yahoo.com', @password = 'secretAgent';

select * from users;
