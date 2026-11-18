USE college;

CREATE TABLE Sales (
    Sale_ID INT,
    Salesperson VARCHAR(30),
    Department VARCHAR(20),
    Product VARCHAR(30),
    Quantity INT,
    Amount DECIMAL(10,2)
);

INSERT INTO Sales VALUES
(101, 'Amit', 'Electronics', 'Laptop', 2, 100000),
(102, 'Neha', 'Electronics', 'Mobile', 5, 75000),
(103, 'Amit', 'Electronics', 'Printer', 2, 30000),
(104, 'Rahul', 'Furniture', 'Chair', 10, 25000),
(105, 'Neha', 'Furniture', 'Table', 5, 40000),
(106, 'Priya', 'Electronics', 'Laptop', 1, 50000),
(107, 'Rahul', 'Furniture', 'Desk', 3, 45000),
(108, 'Priya', 'Electronics', 'Mobile', 4, 60000);

SELECT Department, SUM(Amount) AS Total_Sales FROM Sales GROUP BY Department;

SELECT Department, SUM(Amount) AS Total_Sales FROM Sales GROUP BY Department HAVING SUM(Amount) > 50000;

SELECT Department, SUM(Amount) AS Total_Sales FROM Sales WHERE Amount > 80000 GROUP BY Department HAVING SUM(Amount) > 100000;

SELECT Department, COUNT(*) AS Total_Transactions FROM Sales GROUP BY Department;

SELECT Product, SUM(Quantity) AS Total_Quantity FROM Sales GROUP BY Product;

SELECT Salesperson, SUM(Amount) AS Total_Sales FROM Sales GROUP BY Salesperson;

SELECT Department, COUNT(*) AS Total_Transactions FROM Sales GROUP BY Department HAVING COUNT(*) > 2;

SELECT Salesperson, SUM(Amount) AS Total_Sales FROM Sales GROUP BY Salesperson HAVING SUM(Amount) > 100000;

SELECT Product, SUM(Quantity) AS Total_Quantity FROM Sales GROUP BY Product HAVING SUM(Quantity) > 5;

SELECT Salesperson, COUNT(*) AS Total_Transactions FROM Sales GROUP BY Salesperson HAVING COUNT(*) >= 2;

SELECT Salesperson, SUM(Amount) AS Total_Sales FROM Sales WHERE Amount > 30000 GROUP BY Salesperson HAVING SUM(Amount) > 80000;

SELECT Department, SUM(Quantity) AS Total_Quantity FROM Sales WHERE Amount = 20000 GROUP BY Department HAVING SUM(Quantity) > 5;