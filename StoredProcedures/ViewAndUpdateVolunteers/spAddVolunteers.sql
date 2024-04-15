
DROP PROCEDURE spAddVolunteer

CREATE PROCEDURE spAddVolunteer
	@emp_username varchar(20),
	@vol_username varchar(20),
	@password varchar(50),
	@name varchar(50),
	@email varchar(50),
	@phoneNumber varchar(20),
	@address varchar(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN
        IF EXISTS (SELECT 1 FROM USERS WHERE username = @emp_username AND role LIKE '%head-employee%')
        BEGIN
			INSERT INTO users values
			(@vol_username, @password, @name, @email, @phoneNumber, @address, 'volunteer', 'active', 0, 0.00);
			SELECT 'Volunteer added successfully' AS MESSAGE, 1 AS ISSUCCESS;
        END
        ELSE
        BEGIN
            SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
END;
go

exec spAddVolunteer
	@emp_username = 'usernameAmelie',
	@vol_username = 'usernameVol1',
	@password = 'batmanIsWeak',
	@name = 'Doremon',
	@email = 'vishnusskzm@mgail.com',
	@phoneNumber = '456 879 6582',
	@address = '12196 Rue Lachapelle'

select * from users;
