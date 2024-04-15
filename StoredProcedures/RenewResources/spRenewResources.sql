-- Stored procedure to allow user to renew a resource (if user has an active order for the resource and the resource is not past due)

CREATE PROCEDURE spRenewResource
    @Username NVARCHAR(20),
    @BookTitle NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT
    DECLARE @ResourceID INT
    DECLARE @OrderID INT
    DECLARE @DueDate DATETIME

    IF EXISTS (SELECT 1 FROM Users WHERE Username = @Username AND AccountStatus = 'active')
    BEGIN

        SELECT @UserID = uuid FROM Users WHERE Username = @Username

        SELECT TOP 1 @ResourceID = b.resourceID, @OrderID = od.orderID, @DueDate = od.dueDate
        FROM OrderDetails od
        INNER JOIN Orders o ON od.orderID = o.orderID
        INNER JOIN Books b ON od.resourceID = b.resourceID
        INNER JOIN Resources r ON b.resourceID = r.resourceID
        WHERE o.id = @UserID
          AND r.title = @BookTitle
          AND od.dueDate >= GETDATE()
          AND b.isAvailable = 0 
        ORDER BY od.dueDate ASC

        IF @ResourceID IS NOT NULL
        BEGIN

            SET @DueDate = DATEADD(WEEK, 2, @DueDate)

            UPDATE OrderDetails
            SET DueDate = @DueDate
            WHERE OrderID = @OrderID

            PRINT 'Book renewed successfully!'
        END
        ELSE
        BEGIN
            PRINT 'No active order found for the specified book.'
        END
    END
    ELSE
    BEGIN
        PRINT 'User does not exist or is not active.'
    END
END

EXEC spRenewResource @Username = 'usernameAmelie', @BookTitle = 'The Arabian Knights'
