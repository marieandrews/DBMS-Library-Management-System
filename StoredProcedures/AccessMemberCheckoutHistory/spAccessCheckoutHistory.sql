--Procedure to access member checkout history

CREATE PROCEDURE GetUserOrderHistory
	@EMAIL VARCHAR(50),
    @PASSWORD VARCHAR(50)
AS
BEGIN
    DECLARE @LoginResult TABLE (
        MESSAGE VARCHAR(100),
        ISSUCCESS BIT
    );

    INSERT INTO @LoginResult EXEC LOGIN '@EMAIL', '@PASSWORD';

    DECLARE @LoginSuccess BIT;
    SELECT @LoginSuccess = ISSUCCESS FROM @LoginResult;

    IF @LoginSuccess = 1
    BEGIN

        SELECT u.Email,
               o.timeStamp AS OrderTimestamp,
               r.title AS ResourceTitle,
               od.dueDate
        FROM [Orders] o
        INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
        INNER JOIN Resources r ON od.ResourceID = r.ResourceID
        INNER JOIN Users u ON o.id = u.id
        WHERE u.ISLOGGEDIN = 1;
    END
    ELSE
    BEGIN
        PRINT 'User not logged in.';
    END
END


EXEC GetUserOrderHistory @EMAIL = 'VISHNU222@GMAIL.COM', @PASSWORD = 'SECRETAGENT';
EXEC GetUserOrderHistory @EMAIL = 'AMELIEPOULAIN@YAHOO.COM', @PASSWORD = 'SECRETAGENT';

