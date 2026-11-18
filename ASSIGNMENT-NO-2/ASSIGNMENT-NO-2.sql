CREATE DATABASE IF NOT EXISTS CustomerOrderDB;
USE CustomerOrderDB;

CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    City VARCHAR(30),
    Contact_No VARCHAR(15)
);

CREATE TABLE ORDERS (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Product_Name VARCHAR(50) NOT NULL,
    Quantity INT,
    Amount DECIMAL(10,2),
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

ALTER TABLE CUSTOMER ADD Email VARCHAR(100);

ALTER TABLE CUSTOMER MODIFY Customer_Name VARCHAR(100) NOT NULL;

ALTER TABLE CUSTOMER DROP COLUMN Email;

INSERT INTO CUSTOMER (Customer_ID, Customer_Name, Gender, City, Contact_No)
VALUES
(1, 'Amit Sharma', 'Male', 'Pune', '9876543210'),
(2, 'Priya Patel', 'Female', 'Mumbai', '9678467023'),
(3, 'Anjali Mehta', 'Female', 'Pune', '9876543212'),
(4, 'Rahul Singh', 'Male', 'Delhi', '9876543213'),
(5, 'Sneha Joshi', 'Female', 'Pune', '9876543214');

INSERT INTO ORDERS (Order_ID, Order_Date, Product_Name, Quantity, Amount, Customer_ID)
VALUES
(1, '2026-01-10', 'Laptop', 2, 85000.00, 2),
(2, '2026-01-12', 'Mobile Phone', 3, 45000.00, 3),
(3, '2026-01-15', 'Headphones', 350, 7500.00, 5),
(4, '2026-01-18', 'Keyboard', 5, 3500.00, 2),
(5, '2026-01-20', 'Monitor', 2, 18000.00, 3);

UPDATE CUSTOMER SET City = 'Delhi' WHERE Customer_ID = 1;

UPDATE CUSTOMER SET Contact_No = '9678467023' WHERE Customer_ID = 2;

UPDATE ORDERS SET Quantity = 350 WHERE Order_ID = 3;

DELETE FROM ORDERS WHERE Order_ID = 2;

SELECT * FROM CUSTOMER;

SELECT Customer_Name, City FROM CUSTOMER;

SELECT * FROM CUSTOMER WHERE City = 'Pune';

SELECT * FROM CUSTOMER WHERE Customer_Name LIKE 'A%';

SELECT * FROM CUSTOMER ORDER BY Customer_Name ASC;

SELECT * FROM ORDERS WHERE Amount > 5000;

SELECT Product_Name, Amount FROM ORDERS;

SELECT * FROM ORDERS ORDER BY Amount DESC;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM CUSTOMER WHERE Gender = 'Male';