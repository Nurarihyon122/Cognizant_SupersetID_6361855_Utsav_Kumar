-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
GO

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
GO

-- Insert Sample Data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
GO

-- Insert Sample Data into Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
(1, 'John', 'Doe', 1, 5000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 2, 6000.00, '2019-03-22'),
(3, 'Bob', 'Johnson', 3, 5500.00, '2021-07-01');
GO


-- Exercise 1: Create a Scalar Function
CREATE FUNCTION fn_CalculateAnnualSalary (@MonthlySalary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @MonthlySalary * 12;
END;
GO

-- Test Exercise 1
SELECT 
    EmployeeID, 
    FirstName, 
    LastName,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

-- Exercise 2: Create a Table-Valued Function
CREATE FUNCTION fn_GetEmployeesByDepartment (@DeptID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM Employees
    WHERE DepartmentID = @DeptID
);
GO

-- Test Exercise 2
SELECT * FROM dbo.fn_GetEmployeesByDepartment(2);
GO

-- Exercise 3: Create a User-Defined Function
CREATE FUNCTION fn_CalculateBonus (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.10;
END;
GO

-- Test Exercise 3
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Salary,
    dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO

-- Exercise 4: Modify the Bonus Function to 15%
ALTER FUNCTION fn_CalculateBonus (@Salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO

-- Test Exercise 4
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Salary,
    dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO

-- Exercise 5: Delete the Bonus Function
DROP FUNCTION fn_CalculateBonus;
GO

-- Verify Exercise 5 (will error if function is deleted)
-- SELECT dbo.fn_CalculateBonus(5000);
-- GO

-- Exercise 6: Execute the Annual Salary Function
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

-- Exercise 7: Return Data from Scalar Function for EmployeeID = 1
SELECT 
    FirstName, 
    LastName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 1;
GO
