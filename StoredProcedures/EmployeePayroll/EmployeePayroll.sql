-- Employee querying their personal payroll info

CREATE PROCEDURE EmployeePayroll
    @EMAIL_EMPLOYEE VARCHAR(50),
    @PASSWORD_EMPLOYEE VARCHAR(50),
	@EMPLOYEEID INT
 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @LoginResult TABLE (
        MESSAGE VARCHAR(100),
        ISSUCCESS BIT
    );

    INSERT INTO @LoginResult EXEC LOGIN @EMAIL_EMPLOYEE, @PASSWORD_EMPLOYEE;

    DECLARE @LoginSuccess BIT;
    SELECT @LoginSuccess = ISSUCCESS FROM @LoginResult;

    IF @LoginSuccess = 1
    BEGIN
        DECLARE @UserRole VARCHAR(50);

        SELECT @UserRole = Role
        FROM Users
        WHERE Email = @EMAIL_EMPLOYEE AND [Password] = @PASSWORD_EMPLOYEE;

        IF @UserRole = 'Employee'
        BEGIN

		SELECT  e.employeeID,
				e.basePay,
				e.monthlyHours,
				e.salary
		INTO #tempPayrollTB
        FROM Employee e
		WHERE e.employeeID = @EMPLOYEEID

		SELECT * FROM #tempPayrollTB t
		WHERE (t.basePay * t.monthlyHours) = salary;

		SELECT 'Here is your current payroll.' AS MESSAGE, 1 AS ISSUCCESS;
        END
        ELSE
        BEGIN
            SELECT 'User is not an employee - does not have access to this information.' AS MESSAGE, 0 AS ISSUCCESS;
        END
    END
    ELSE
    BEGIN
        SELECT 'Not logged in.' AS MESSAGE, 0 AS ISSUCCESS;
    END
END;
GO

EXEC EmployeePayroll @EMAIL_EMPLOYEE = 'AMELIEPOULAIN@YAHOO.COM', @PASSWORD_EMPLOYEE = 'SECRETAGENT', @EMPLOYEEID = 1;