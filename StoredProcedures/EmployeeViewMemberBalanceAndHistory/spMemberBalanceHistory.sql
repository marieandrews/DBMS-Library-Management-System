-- Stored procedure to allow employees to view members' current balances and checkout histories

CREATE PROCEDURE spMemberBalanceHistory
    @Username NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN
        -- Check if the user has a role like 'employee'
        IF EXISTS (SELECT 1 FROM USERS WHERE Username = @Username AND role LIKE '%employee%')
        BEGIN
		SELECT u.username, 
				u.balance,
				o.timeStamp,
				r.title,
				od.dueDate
		INTO #tempMemberBalanceHistorytb
		FROM Users u
		INNER JOIN Orders o ON u.uuid = o.id
		INNER JOIN OrderDetails od ON o.orderID = od.orderID
		INNER JOIN Resources r ON od.resourceID = r.resourceID

		SELECT * FROM #tempMemberBalanceHistorytb;

        END
        ELSE
        BEGIN
            SELECT 'INVALID USERNAME OR USER ROLE HAS NO ACCESS' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
END;
go

exec spMemberBalanceHistory @username = 'usernameAmelie'