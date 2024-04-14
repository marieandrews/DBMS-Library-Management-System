Drop procedure spUpdateUser;

CREATE PROCEDURE spUpdateUser
	@Username NVARCHAR(20),
    @Password NVARCHAR(20),
    @Name NVARCHAR(200),
    @Email NVARCHAR(200),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM USERS WHERE Username = @Username)
	BEGIN
		UPDATE Users
		SET Password = ISNULL(@Password, Password),
			Name = ISNULL(@Name, Name),
			Email = ISNULL(@Email, Email),
			PhoneNumber = ISNULL(@PhoneNumber, PhoneNumber)
		WHERE Username = @Username;
		SELECT 'User updated successfully!' AS MESSAGE, 1 AS ISSUCCESS;
	END
	ELSE
	BEGIN
		SELECT 'Invalid username!' AS MESSAGE, 0 AS ISSUCCESS;
	END
END;
go

EXEC spUpdateUser
    @Username = 'testuser2',
    @Password = 'ilove robotix',
    @Name = 'Krishna 333',
    @Email = 'krkpriya@gmail.com',
    @PhoneNumber = '123-456-7899';

select * from users;