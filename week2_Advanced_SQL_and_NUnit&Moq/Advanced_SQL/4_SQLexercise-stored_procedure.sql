
--- Create Tables
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO


--- Insert Sample Data


INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
GO

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily', 'Davis', 4, 5500.00, '2021-11-05');
GO



--- EXERCISE 1: Get Employees by Department
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @deptID INT
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate
    FROM Employees
    WHERE DepartmentID = @deptID;
END;
GO

--- Insert New Employee
CREATE PROCEDURE sp_InsertEmployee
    @fname VARCHAR(50),
    @lname VARCHAR(50),
    @deptID INT,
    @sal DECIMAL(10,2),
    @joinDt DATE
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (@fname, @lname, @deptID, @sal, @joinDt);
END;
GO

-- EXERCISE 5: Count Employees in Department
CREATE PROCEDURE sp_CountEmployeesInDepartment
    @deptID INT
AS
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @deptID;
END;
GO


--- Exercise 4: Execute Stored Procedures (Examples)


-- Get all employees in IT department
EXEC sp_GetEmployeesByDepartment @deptID = 3;
GO

-- Insert a new employee into Finance
EXEC sp_InsertEmployee @fname = 'Alice', @lname = 'Walker', @deptID = 2, @sal = 6200.00, @joinDt = '2022-06-12';
GO

-- Count total employees in HR department
EXEC sp_CountEmployeesInDepartment @deptID = 1;
GO
