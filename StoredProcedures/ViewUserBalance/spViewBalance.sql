Drop procedure spViewBalance;

CREATE PROCEDURE spViewBalance
	@Username NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM USERS WHERE Username = @Username)
	BEGIN
		SELECT balance as Current_Balance, 1 AS ISSUCCESS from Users where Username = @Username;
	END
	ELSE
	BEGIN
		SELECT 'Invalid username!' AS MESSAGE, 0 AS ISSUCCESS;
	END
END;
go

EXEC spViewBalance
    @Username = 'usernameVishnu'

select * from users;