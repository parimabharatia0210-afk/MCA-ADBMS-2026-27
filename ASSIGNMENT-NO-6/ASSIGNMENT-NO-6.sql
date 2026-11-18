----- 1. Aggregate Functions

-- Average Function
SELECT AVG(Price) "average price" FROM Products;

-- Minimum Function
SELECT MIN(Quantity) "minimum order" FROM Orders;

-- Maximum Function
SELECT MAX(Quantity) "max order quantity" FROM Orders;

-- Count Function
SELECT COUNT(CustomerID) "No. of customers" FROM Customers;

-- Count(*) Function
SELECT COUNT(*) "Total customers" FROM Customers;

-- Sum Function
SELECT SUM(Price) "Total cost" FROM Products;



----- 2. Scalar Functions

-- (i) Numeric Functions
-- ABS Function
SELECT ABS(-15) "Absolute value" FROM DUAL;

-- POWER Function
SELECT POWER(3,2) "Power Exponential" FROM DUAL;

-- ROUND Function
SELECT ROUND(15.29,1) "Round-off" FROM DUAL;

-- SQRT Function
SELECT SQRT(81) "Square Root" FROM DUAL;

-- GREATEST Function
SELECT GREATEST(9,10,27,2) "Largest No" FROM DUAL;

-- LEAST Function
SELECT LEAST(11,0,4,2,27) "Smallest" FROM DUAL;

-- MOD Function
SELECT MOD(15,7) "Modulus" FROM DUAL;

-- TRUNCATE Function
SELECT TRUNCATE(125.815,1) "Truncate" FROM DUAL;

-- FLOOR Function
SELECT FLOOR(24.8) "Floor" FROM DUAL;

-- CEIL Function
SELECT CEIL(24.8) "Ceil" FROM DUAL;


-- (ii) String Functions
-- LOWER Function
SELECT LOWER('PARIMA') "Lower case" FROM DUAL;

-- UPPER Function
SELECT UPPER('parima') "upper-case" FROM DUAL;

-- INITCAP equivalent (MySQL has no INITCAP, built manually)
SELECT CONCAT(UPPER(LEFT('parima',1)), LOWER(SUBSTRING('parima',2))) "Title case" FROM DUAL;

-- SUBSTR Function
SELECT SUBSTR('SECURE',2,4) "substring" FROM DUAL;

-- ASCII Function
SELECT ASCII('A') "Ascii value" FROM DUAL;

-- INSTR Function
SELECT INSTR('Hello world','o') "location of character" FROM DUAL;

-- TRANSLATE Function
SELECT REPLACE(REPLACE('Hello','e','i'),'l','p') "replace character" FROM DUAL;

-- LENGTH Function
SELECT LENGTH('Accomplishment') "length of string" FROM DUAL;

-- LTRIM Function
SELECT TRIM(LEADING 'C' FROM 'COLLEGE') "Trim from left" FROM DUAL;

-- RTRIM Function
SELECT TRIM(TRAILING 'E' FROM 'COLLEGE') "Trim Text from right" FROM DUAL;

-- LPAD Function
SELECT LPAD('123',5,'0') "left Padding" FROM DUAL;

-- RPAD Function
SELECT RPAD('IMED',8,'*') "Right padding" FROM DUAL;


-- (iii) Date Functions
-- ADD_MONTHS equivalent
SELECT DATE_ADD(NOW(), INTERVAL 4 MONTH) "Months" FROM DUAL;

-- LAST_DAY Function
SELECT LAST_DAY(NOW()) "Last Day of month" FROM DUAL;

-- MONTHS_BETWEEN equivalent
SELECT TIMESTAMPDIFF(MONTH, '2026-09-19', '2026-11-12') "Months in Between" FROM DUAL;

-- NEXT_DAY equivalent (next Monday)
SELECT DATE_ADD(NOW(), INTERVAL (7 - WEEKDAY(NOW())) DAY) "Next day" FROM DUAL;

-- TO_CHAR equivalent
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') "Date" FROM DUAL;

-- TO_DATE equivalent
SELECT STR_TO_DATE('01/11/2025','%d/%m/%Y') "Date format" FROM DUAL;