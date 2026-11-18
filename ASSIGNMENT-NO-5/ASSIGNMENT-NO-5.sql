CREATE DATABASE IF NOT EXISTS CustomerProductOrderDB;
USE CustomerProductOrderDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName, City, JoinDate) VALUES
(1, 'Rahul Sharma', 'Mumbai', '2025-01-15'),
(2, 'Amit', 'Pune', '2026-02-10'),
(3, 'Priya Patel', 'Mumbai', '2025-01-15'),
(4, 'Neha Singh', 'Delhi', '2026-03-05'),
(5, 'Vikram Rao', 'Bengaluru', '2025-09-12'),
(6, 'Rohan Mehta', 'Pune', '2024-11-20');

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101, 'Laptop', 'Electronics', 55000.00),
(102, 'Novel', 'Books', 500.00),
(103, 'Headphones', 'Electronics', 2500.00),
(104, 'Notebook', 'Books', 500.00),
(105, 'Mouse', 'Electronics', 500.00),
(106, 'Tablet', 'Electronics', 25000.00),
(107, 'Monitor', 'Electronics', 55000.00);

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(501, 1, 101, 2, '2026-01-10'),
(502, 1, 102, 3, '2026-02-14'),
(503, 2, 103, 6, '2026-04-05'),
(504, 3, 104, 2, '2025-12-20'),
(505, 4, 101, 1, '2026-05-15'),
(506, 2, 105, 3, '2026-06-01'),
(507, 3, 102, 6, '2026-07-11'),
(508, 6, 107, 4, '2025-11-25');	

SELECT DISTINCT c.CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT DISTINCT p.ProductName FROM Products p INNER JOIN Orders o ON p.ProductID = o.ProductID;

SELECT DISTINCT c.CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID INNER JOIN Products p ON o.ProductID = p.ProductID WHERE p.Category = 'Electronics';

SELECT o.OrderID, o.Quantity FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID WHERE c.City = 'Mumbai';
	
SELECT * FROM Products WHERE Price IN (SELECT Price FROM Products WHERE Category = 'Books' );

SELECT DISTINCT c.CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID WHERE o.Quantity > 5;

SELECT DISTINCT p.ProductName FROM Products p INNER JOIN Orders o ON p.ProductID = o.ProductID INNER JOIN Customers c ON o.CustomerID = c.CustomerID WHERE c.CustomerName = 'Rahul Sharma';

SELECT DISTINCT c.CustomerName FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID WHERE YEAR(o.OrderDate) = 2026;

SELECT * FROM Products WHERE Category = ( SELECT Category FROM Products WHERE ProductName = 'Laptop' );

SELECT CustomerName FROM Customers WHERE City = ( SELECT City FROM Customers WHERE CustomerName = 'Amit' );

SELECT * FROM Products WHERE Price = ( SELECT Price FROM Products WHERE ProductName = 'Laptop' );

SELECT * FROM Customers WHERE JoinDate = ( SELECT JoinDate FROM Customers WHERE CustomerName = 'Rahul Sharma' );

SELECT * FROM Products WHERE Category = ( SELECT Category FROM Products WHERE ProductID = 102 );

SELECT * FROM Orders WHERE Quantity = ( SELECT Quantity FROM Orders WHERE OrderID = 501 );

SELECT * FROM Orders WHERE CustomerID IN ( SELECT CustomerID FROM Customers WHERE City = ( SELECT City FROM Customers WHERE CustomerID = 3 ) );