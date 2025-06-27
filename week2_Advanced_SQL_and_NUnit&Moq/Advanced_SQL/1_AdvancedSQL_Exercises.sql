---Exercise1

-- Top 3 using ROW_NUMBER
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS rn
    FROM Products
) ranked
WHERE rn <= 3;

-- Top 3 using RANK
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS rnk
    FROM Products
) ranked
WHERE rnk <= 3;

-- Top 3 using DENSE_RANK
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS drnk
    FROM Products
) ranked
WHERE drnk <= 3;

---EXERCISE 2

-- GROUPING SETS via UNION ALL
SELECT c.Region, NULL AS Category, SUM(od.Quantity) AS Qty FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Region
UNION ALL
SELECT NULL, p.Category, SUM(od.Quantity) FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
UNION ALL
SELECT c.Region, p.Category, SUM(od.Quantity) FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.Region, p.Category;

-- ROLLUP
SELECT c.Region, p.Category, SUM(od.Quantity) AS QtySold
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.Region, p.Category WITH ROLLUP;

--- EXERCISE 3

-- Recursive CTE Calendar
WITH RECURSIVE Calendar AS (
    SELECT DATE('2025-01-01') AS dt
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM Calendar
    WHERE dt < '2025-01-31'
)
SELECT * FROM Calendar;

-- MERGE using INSERT ON DUPLICATE KEY UPDATE
CREATE TABLE StagingProducts (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO StagingProducts VALUES
(2, 'Phone', 'Electronics', 62000),
(7, 'Watch', 'Accessories', 3000);

INSERT INTO Products (ProductID, ProductName, Category, Price)
SELECT * FROM StagingProducts
ON DUPLICATE KEY UPDATE
Price = VALUES(Price),
ProductName = VALUES(ProductName),
Category = VALUES(Category);

---EXERCISE 4

-- Pivot sales per product (January to March)
SELECT 
  p.ProductName,
  SUM(CASE WHEN MONTH(o.OrderDate) = 1 THEN od.Quantity ELSE 0 END) AS Jan,
  SUM(CASE WHEN MONTH(o.OrderDate) = 2 THEN od.Quantity ELSE 0 END) AS Feb,
  SUM(CASE WHEN MONTH(o.OrderDate) = 3 THEN od.Quantity ELSE 0 END) AS Mar
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Unpivot using subqueries instead of a physical table
SELECT ProductName, 'Jan' AS Month, Jan AS Quantity FROM (
    SELECT 
        p.ProductName,
        SUM(CASE WHEN MONTH(o.OrderDate) = 1 THEN od.Quantity ELSE 0 END) AS Jan,
        SUM(CASE WHEN MONTH(o.OrderDate) = 2 THEN od.Quantity ELSE 0 END) AS Feb,
        SUM(CASE WHEN MONTH(o.OrderDate) = 3 THEN od.Quantity ELSE 0 END) AS Mar
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.ProductName
) AS PivotedSales
UNION ALL
SELECT ProductName, 'Feb', Feb FROM (
    SELECT 
        p.ProductName,
        SUM(CASE WHEN MONTH(o.OrderDate) = 1 THEN od.Quantity ELSE 0 END) AS Jan,
        SUM(CASE WHEN MONTH(o.OrderDate) = 2 THEN od.Quantity ELSE 0 END) AS Feb,
        SUM(CASE WHEN MONTH(o.OrderDate) = 3 THEN od.Quantity ELSE 0 END) AS Mar
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.ProductName
) AS PivotedSales
UNION ALL
SELECT ProductName, 'Mar', Mar FROM (
    SELECT 
        p.ProductName,
        SUM(CASE WHEN MONTH(o.OrderDate) = 1 THEN od.Quantity ELSE 0 END) AS Jan,
        SUM(CASE WHEN MONTH(o.OrderDate) = 2 THEN od.Quantity ELSE 0 END) AS Feb,
        SUM(CASE WHEN MONTH(o.OrderDate) = 3 THEN od.Quantity ELSE 0 END) AS Mar
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.ProductName
) AS PivotedSales;

---EXERCISE 5

-- Customers with more than 3 orders
WITH OrderCount AS (
    SELECT CustomerID, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
)
SELECT c.CustomerID, c.Name, oc.TotalOrders
FROM OrderCount oc
JOIN Customers c ON c.CustomerID = oc.CustomerID
WHERE oc.TotalOrders > 3;
