CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

CREATE TABLE Client_Master (
    Client_no VARCHAR(6) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Address1 VARCHAR(30),
    Address2 VARCHAR(30),
    City VARCHAR(15),
    Pincode DECIMAL(8,0),
    State VARCHAR(15),
    Bal_due DECIMAL(10,2),
    CHECK (Client_no LIKE 'C%')
);

CREATE TABLE Product_Master (
    Product_no VARCHAR(6) PRIMARY KEY,
    Description VARCHAR(15) NOT NULL,
    Profit_percent DECIMAL(4,2) NOT NULL,
    Unit_measure VARCHAR(10) NOT NULL,
    Qty_on_hand DECIMAL(8,0) NOT NULL,
    Reorder_lvl DECIMAL(8,0) NOT NULL,
    Sell_price DECIMAL(8,2) NOT NULL,
    Cost_price DECIMAL(8,2) NOT NULL,
    CHECK (Product_no LIKE 'P%'),
    CHECK (Sell_price <> 0),
    CHECK (Cost_price <> 0)
);

CREATE TABLE Salesman_Master (
    Salesman_no VARCHAR(6) PRIMARY KEY,
    Salesman_name VARCHAR(20) NOT NULL,
    Address1 VARCHAR(30),
    Address2 VARCHAR(30),
    City VARCHAR(20),
    Pincode DECIMAL(8,0),
    State VARCHAR(20),
    Sal_amt DECIMAL(8,2) NOT NULL,
    Tgt_to_get DECIMAL(6,2) NOT NULL,
    Ytd_sales DECIMAL(6,2) NOT NULL,
    Remarks VARCHAR(60),
    CHECK (Salesman_no LIKE 'S%'),
    CHECK (Sal_amt <> 0),
    CHECK (Tgt_to_get <> 0)
);

INSERT INTO Client_Master (Client_no, Name, City, Pincode, State, Bal_due) VALUES
('C00001', 'Ivan Bayross', 'Bombay', 400054, 'Maharashtra', 15000),
('C00002', 'Vandana Saitwal', 'Madras', 780001, 'Tamil Nadu', 0),
('C00003', 'Pramada Jaguste', 'Bombay', 400057, 'Maharashtra', 5000),
('C00004', 'Basu Navindgi', 'Bombay', 400056, 'Maharashtra', 0),
('C00005', 'Ravi Sreedharan', 'Delhi', 100001, 'Maharashtra', 2000),
('C00006', 'Rukmini', 'Bombay', 400050, 'Maharashtra', 0);

INSERT INTO Product_Master (Product_no, Description, Profit_percent, Unit_measure, Qty_on_hand, Reorder_lvl, Sell_price, Cost_price) VALUES
('P00001', '1.44 Floppies', 5, 'Piece', 100, 20, 525, 500),
('P03453', 'Monitors', 6, 'Piece', 10, 3, 12000, 11280),
('P06734', 'Mouse', 5, 'Piece', 20, 5, 1050, 1000),
('P07865', '1.22 Floppies', 5, 'Piece', 100, 20, 525, 500),
('P07868', 'Keyboards', 2, 'Piece', 10, 3, 315, 305),
('P07885', 'CD Drive', 2.5, 'Piece', 10, 3, 5250, 5100),
('P07965', '540 HDD', 4, 'Piece', 10, 3, 8400, 8000),
('P07975', '1.44 Drive', 5, 'Piece', 10, 3, 1050, 1000),
('P08865', '1.22 Drive', 5, 'Piece', 2, 3, 1050, 1000);

INSERT INTO Salesman_Master (Salesman_no, Salesman_name, Address1, Address2, City,Pincode, State, Sal_amt, Tgt_to_get, Ytd_sales, Remarks) VALUES
('S00001', 'Kiran', 'A/14', 'Worli', 'Bombay',400002, 'Maharashtra', 3000, 100, 50, 'Good'),
('S00002', 'Manish', '65', 'Nariman', 'Bombay',400001, 'Maharashtra', 3000, 200, 100, 'Good'),
('S00003', 'Ravi', 'P-7', 'Bandra', 'Bombay',400032, 'Maharashtra', 3000, 200, 100, 'Good'),
('S00004', 'Ashish', 'A/5', 'Juhu', 'Bombay',400044, 'Maharashtra', 3500, 200, 150, 'Good');

SELECT Name FROM Client_Master;

SELECT * FROM Client_Master;

SELECT Name, City FROM Client_Master;

SELECT Description FROM Product_Master;

SELECT * FROM Client_Master WHERE City = 'Bombay';

SELECT Salesman_name FROM Salesman_Master WHERE Sal_amt = 3000;

UPDATE Client_Master SET City = 'Bombay' WHERE Client_no = 'C00005';

UPDATE Client_Master SET Bal_due = 1000 WHERE Client_no = 'C00001';

SET SQL_SAFE_UPDATES = 0;
UPDATE Product_Master SET Cost_price = 950.00 WHERE Description = '1.22 Floppies';

UPDATE Salesman_Master SET City = 'Mumbai';

DELETE FROM Salesman_Master WHERE Sal_amt = 3500;

DELETE FROM Product_Master WHERE Qty_on_hand = 100;

DELETE FROM Client_Master WHERE State = 'Tamil Nadu';

ALTER TABLE Client_Master ADD Telephone DECIMAL(10,0);

ALTER TABLE Product_Master MODIFY Sell_price DECIMAL(10,2) NOT NULL;

DROP TABLE Client_Master;

RENAME TABLE Salesman_Master TO sman_mast;

SELECT * FROM Client_Master WHERE City IN ('Mumbai', 'Delhi', 'Pune');

UPDATE sman_mast SET City = 'Mumbai';

DELETE FROM Product_Master WHERE Sell_price > 5000 AND Sell_price < 7000;