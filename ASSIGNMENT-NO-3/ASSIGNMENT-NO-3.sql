CREATE DATABASE IF NOT EXISTS DeptEmpProjectDB;
USE DeptEmpProjectDB;

CREATE TABLE DEPARTMENT (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Salary DECIMAL(10,2),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID)
);

CREATE TABLE PROJECT (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(50) NOT NULL,
    Budget DECIMAL(12,2),
    Duration INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES DEPARTMENT(Department_ID)
);

ALTER TABLE EMPLOYEE ADD Email VARCHAR(100);

ALTER TABLE EMPLOYEE MODIFY Employee_Name VARCHAR(100) NOT NULL;

ALTER TABLE EMPLOYEE DROP COLUMN Email;

INSERT INTO DEPARTMENT (Department_ID, Department_Name, Location)
VALUES
(101, 'Human Resources', 'First Floor'),
(102, 'Finance', 'Second Floor'),
(103, 'IT', 'Third Floor'),
(104, 'Marketing', 'Ground Floor'),
(105, 'Operations', 'Fourth Floor');

INSERT INTO EMPLOYEE (Employee_ID, Employee_Name, Gender, Salary, Department_ID)
VALUES
(1, 'Ram', 'Male', 75000.00, 101),
(2, 'Amit', 'Male', 45000.00, 102),
(3, 'Anjali', 'Female', 60000.00, 103),
(4, 'Priya', 'Female', 35000.00, 104),
(5, 'Rahul', 'Male', 18000.00, 105);

INSERT INTO PROJECT (Project_ID, Project_Name, Budget, Duration, Department_ID)
VALUES
(1, 'Employee Management System', 250000.00, 12, 101),
(2, 'Financial Analysis System', 350000.00, 10, 102),
(3, 'Web Development Project', 150000.00, 8, 103),
(4, 'Marketing Campaign', 80000.00, 6, 104),
(5, 'Operations Management', 500000.00, 15, 105);

INSERT INTO EMPLOYEE (Employee_ID, Employee_Name, Department_ID) VALUES (6, 'Akash', 101);

UPDATE DEPARTMENT SET Location = 'Ground Floor' WHERE Department_ID = 103;

SET SQL_SAFE_UPDATES = 0;
UPDATE EMPLOYEE SET Salary = Salary + 50000 WHERE Employee_Name = 'Ram';

UPDATE PROJECT SET Budget = 5000000 WHERE Project_ID = 2;

DELETE FROM EMPLOYEE WHERE Salary < 20000;

SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEE;

SELECT Employee_Name, Salary FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE Salary > 50000;

SELECT * FROM EMPLOYEE ORDER BY Employee_Name ASC;

SELECT * FROM DEPARTMENT WHERE Location = 'Ground Floor';

SELECT * FROM PROJECT;

SELECT Project_Name, Budget FROM PROJECT;

SELECT * FROM PROJECT WHERE Budget > 100000;

SELECT * FROM PROJECT ORDER BY Budget DESC;

SELECT DISTINCT Department_ID FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE Salary > 30000 AND Gender = 'Female';

SELECT * FROM EMPLOYEE WHERE Department_ID = 101 OR Department_ID = 102;

SELECT * FROM EMPLOYEE WHERE Salary <> 50000;

SELECT * FROM PROJECT WHERE Budget BETWEEN 100000 AND 500000;

SELECT * FROM EMPLOYEE WHERE Employee_Name LIKE 'A%';