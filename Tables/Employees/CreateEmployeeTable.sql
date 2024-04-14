-- Creating Employee table

CREATE TABLE Employee (
employeeID int not null identity(1, 1),
basePay decimal (19, 4),
hourlyRate decimal (19, 4),
yearsWorked int,
monthlyHours decimal (19, 4),
salary decimal (19,4)
constraint Employee_pk1 primary key (employeeID)
);

-- Some data for the Employee table

INSERT INTO Employee (hourlyRate, monthlyHours)
VALUES(22.50, 150),
(25.50, 130),
(36.00, 140);
