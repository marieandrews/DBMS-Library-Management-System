-- Stored procedure for members and employees to reserve resources

CREATE PROCEDURE spReserveResources
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

        SELECT TOP 1 @ResourceID = b.ResourceID
        FROM Books b
        INNER JOIN Resources r ON b.ResourceID = r.ResourceID
        WHERE b.isAvailable = 1 AND r.Title = @BookTitle 
        ORDER BY r.Title 

        IF @ResourceID IS NOT NULL
        BEGIN

            INSERT INTO Orders (id, timeStamp)
            VALUES (@UserID, GETDATE())

            SELECT @OrderID = SCOPE_IDENTITY()

            SET @DueDate = DATEADD(WEEK, 2, GETDATE())


            INSERT INTO OrderDetails (orderID, resourceID, dueDate)
            VALUES (@OrderID, @ResourceID, @DueDate)

            UPDATE Books SET isAvailable = 0 WHERE resourceID = @ResourceID
        END
    END
END

EXEC spReserveResources @Username = 'usernameAmelie', @BookTitle = 'The Arabian Knights'
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

-- Insert some data into Books table to work with

INSERT INTO Books 
VALUES ('The Knights of Favonious', 'Vishnu Narayanan', '1678-42-456', 'physical book', 0, '2024-02-12', 1, 1),
('The Arabian Knights', 'Marie Andrews', '1244-78-321', 'physical book', 0, '2024-03-31', 1, 2)