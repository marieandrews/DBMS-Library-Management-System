
DROP PROCEDURE spViewVolunteers

CREATE PROCEDURE spViewVolunteers
	@username varchar(20)
AS
BEGIN
    SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM USERS WHERE username = @username and role like '%employee%')
	BEGIN
		SELECT * FROM Users WHERE role like '%volunteer%';
	END
	ELSE
	BEGIN
		SELECT 'Invalid user or user do not have access' as MESSAGE, 0 as ISSUCCESS;
	END
END;
go

exec spViewVolunteers @username = 'userNameAmelie'

select * from users;

insert into users values
('usernameBob', 'secretAgent', 'Bob Marley', 'bob@bobworld.com', '439-588-6987', 'sdfad ', 'volunteer', 'active', 1, 0.00)
