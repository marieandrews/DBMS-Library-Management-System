
DROP PROCEDURE spViewResources

CREATE PROCEDURE spViewResources
AS
BEGIN
    SET NOCOUNT ON;
	SELECT * FROM Resources;
END;
go

exec spViewResources 

select * from users;