USE college;

-- SECTION A: DDL, DML AND CONSTRAINTS

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    First_Name VARCHAR(30),
    Middle_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    B_Date DATE,
    City VARCHAR(50),
    Gender CHAR(1),
    Salary DECIMAL(12,2),
    Super_Id INT,
    Dept_No INT
);

CREATE TABLE Department (
    D_No INT PRIMARY KEY,
    D_Name VARCHAR(50) NOT NULL,
    Mgr_No INT NOT NULL,
    Mgr_Start_Date DATE
);

CREATE TABLE Works_On (
    E_No INT,
    P_No INT,
    Hours INT,
    PRIMARY KEY (E_No, P_No)
);

CREATE TABLE Dept_Location (
    D_No INT,
    D_Location VARCHAR(100),
    PRIMARY KEY (D_No, D_Location)
);

CREATE TABLE Project (
    P_No INT PRIMARY KEY,
    P_Name VARCHAR(50),
    P_Location VARCHAR(50),
    D_No INT
);

CREATE TABLE Dependent (
    E_No INT,
    Dependent_Name VARCHAR(50),
    Gender CHAR(1),
    Relation VARCHAR(30),
    PRIMARY KEY (E_No, Dependent_Name)
);

INSERT INTO Employee
(Emp_Id, First_Name, Middle_Name, Last_Name, B_Date, City, Gender, Salary, Super_Id, Dept_No)
VALUES
(1, 'Raj', 'M', 'Malhotra', '1980-08-10', 'Delhi', 'M', 650000, 1, 1),
(2, 'Ram', 'J', 'Mehta', '1985-12-15', 'Mumbai', 'M', 58000, 1, 1),
(3, 'Reena', 'K', 'Shah', '1986-01-12', 'Pune', 'F', 80000, 3, 2),
(4, 'Rohit', 'L', 'Rao', '1988-01-14', 'Pune', 'M', 60000, 3, 2),
(5, 'Ranjit', 'G', 'Patil', '1985-02-15', 'Kolhapur', 'M', 85000, 5, 3),
(6, 'Ritik', 'D', 'Singh', '1990-03-12', 'Pune', 'M', 70000, 5, 3),
(7, 'Ritu', 'A', 'Goyal', '1990-03-15', 'Nagpur', 'F', 60000, 5, 3),
(8, 'Rani', 'B', 'Singh', '1995-10-18', 'Mumbai', 'F', 75000, 8, 4),
(9, 'Ranjit', 'R', 'Desai', '1990-02-14', 'Satara', 'M', 48000, 8, 4),
(10, 'Ritika', 'T', 'Jadhav', '1995-08-12', 'Satara', 'F', 40000, 8, 4);

INSERT INTO Department
(D_No, D_Name, Mgr_No, Mgr_Start_Date)
VALUES
(1, 'Marketing', 1, '1985-12-15'),
(2, 'Accounts', 3, '1988-01-12'),
(3, 'R and D', 5, '1990-10-20'),
(4, 'Production', 8, '1998-11-20');

INSERT INTO Dept_Location (D_No, D_Location)
VALUES
(1, 'Shivajinagar Pune'),
(1, 'Kakade City, Pune'),
(2, 'Shivajinagar Pune'),
(3, 'Shivajinagar Pune'),
(4, 'Shivajinagar Pune'),
(4, 'Kakade City, Pune');

INSERT INTO Project (P_No, P_Name, P_Location, D_No)
VALUES
(1, 'Product A', 'Null Stop', 4),
(2, 'Product B', 'Pimpri', 4),
(3, 'Computerization', 'Wakad', 3),
(4, 'Reorganization', 'Hadapsar', 1);

INSERT INTO Works_On (E_No, P_No, Hours)
VALUES
(8, 1, 30),
(9, 1, 20),
(10, 1, 40),
(8, 2, 10),
(9, 2, 20),
(5, 3, 25),
(7, 3, 25),
(1, 4, 30);

INSERT INTO Dependent (E_No, Dependent_Name, Gender, Relation)
VALUES
(1, 'Kajal', 'F', 'Spouse'),
(1, 'Kiran', 'M', 'Son'),
(3, 'Radha', 'F', 'Daughter'),
(5, 'Suvarna', 'F', 'Spouse'),
(5, 'Shlok', 'M', 'Son'),
(8, 'Mohan', 'M', 'Spouse'),
(8, 'Mehek', 'F', 'Daughter'),
(10, 'Raj', 'M', 'Spouse');

ALTER TABLE Employee ADD Email VARCHAR(50);

ALTER TABLE Employee CHANGE City Emp_City VARCHAR(50);

INSERT INTO Employee
(Emp_Id, First_Name, Middle_Name, Last_Name, B_Date, Emp_City, Gender, Salary, Super_Id, Dept_No, Email)
VALUES
(11, 'Aarav', 'P', 'Shah', '1998-05-10', 'Pune', 'M', 72000, 1, 1, 'aarav.shah@college.com');

UPDATE Employee SET Salary = Salary * 1.10 WHERE Dept_No = 3 AND Emp_Id > 0;

DELETE FROM Employee WHERE Salary < 45000 AND Emp_Id > 0;

-- SECTION B: BASIC SQL QUERIES AND OPERATORS

SELECT * FROM Employee;

SELECT First_Name AS Employee_First_Name,  Last_Name AS Employee_Last_Name,Salary AS Employee_Salary FROM Employee;

SELECT DISTINCT Emp_City FROM Employee;

SELECT * FROM Employee ORDER BY First_Name ASC;

SELECT * FROM Employee WHERE Salary > 60000;

SELECT * FROM Employee WHERE Gender = 'F' AND Dept_No = 3;

SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 80000;

SELECT * FROM Employee WHERE Dept_No IN (1, 2, 3);

SELECT * FROM Employee WHERE First_Name LIKE 'R%';

SELECT * FROM Employee WHERE Dept_No NOT IN (1);

SELECT * FROM Employee WHERE Salary > 50000 AND Emp_City = 'Pune';

SELECT First_Name, Last_Name, Salary * 12 AS Annual_Salary FROM Employee;

-- SECTION C: ADVANCED SQL QUERIES AND SET OPERATORS

SELECT * FROM Employee WHERE Salary > (SELECT Salary FROM Employee WHERE First_Name = 'Raj' AND Last_Name = 'Malhotra');

SELECT * FROM Employee WHERE Salary > ALL ( SELECT Salary FROM Employee WHERE Dept_No = 2 );

SELECT * FROM Employee WHERE Salary > ANY ( SELECT Salary FROM Employee WHERE Dept_No = 3 );

SELECT * FROM Employee E WHERE EXISTS ( SELECT 1 FROM Dependent D WHERE D.E_No = E.Emp_Id );

SELECT * FROM Employee E WHERE NOT EXISTS ( SELECT 1 FROM Dependent D WHERE D.E_No = E.Emp_Id );

SELECT First_Name AS Name FROM Employee UNION SELECT Dependent_Name AS Name FROM Dependent;

SELECT First_Name AS Name FROM Employee INTERSECT SELECT Dependent_Name AS Name FROM Dependent;

SELECT First_Name AS Name FROM Employee EXCEPT SELECT Dependent_Name AS Name FROM Dependent;

-- SECTION D: JOINS AND AGGREGATE FUNCTIONS

SELECT E.First_Name, E.Last_Name,D.D_Name FROM Employee E INNER JOIN Department D ON E.Dept_No = D.D_No;

SELECT E.First_Name AS Employee_Name, S.First_Name AS Supervisor_Name FROM Employee E LEFT JOIN Employee S ON E.Super_Id = S.Emp_Id;

SELECT E.*, D.D_Name FROM Employee E LEFT OUTER JOIN Department D ON E.Dept_No = D.D_No;

SELECT E.First_Name,E.Last_Name,P.P_Name, W.Hours FROM Employee E INNER JOIN Works_On W ON E.Emp_Id = W.E_No INNER JOIN Project P ON W.P_No = P.P_No;

SELECT COUNT(*) AS Total_Employees FROM Employee;

SELECT MAX(Salary) AS Maximum_Salary, MIN(Salary) AS Minimum_Salary, AVG(Salary) AS Average_Salary FROM Employee;

SELECT Dept_No, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Dept_No;

SELECT Dept_No, COUNT(*) AS Total_Employees FROM Employee GROUP BY Dept_No HAVING COUNT(*) > 2;

-- SECTION E: BUILT-IN FUNCTIONS

SELECT UPPER(First_Name) AS Uppercase_First_Name, LOWER(Last_Name) AS Lowercase_Last_Name FROM Employee;

SELECT First_Name, LENGTH(First_Name) AS Name_Length FROM Employee;

SELECT First_Name, Last_Name, DATE_FORMAT(B_Date, '%d-%b-%Y') AS Birth_Date FROM Employee;

SELECT CURDATE() AS Current_System_Date, First_Name, Last_Name, TIMESTAMPDIFF(YEAR, B_Date, CURDATE()) AS Age FROM Employee;

-- SECTION F: INDEXES, SEQUENCES AND VIEWS

CREATE INDEX Idx_First_Name ON Employee (First_Name);

CREATE INDEX Idx_Dept_Salary ON Employee (Dept_No, Salary);

CREATE UNIQUE INDEX Idx_Email ON Employee (Email);

-- SEQUENCE

DROP TABLE IF EXISTS Seq_Dno;

CREATE TABLE Seq_Dno (
    Seq_Id INT PRIMARY KEY,
    Current_Value INT NOT NULL,
    Max_Value INT NOT NULL
);

INSERT INTO Seq_Dno VALUES (1, 0, 10);

UPDATE Seq_Dno SET Current_Value = LAST_INSERT_ID(Current_Value + 1) WHERE Seq_Id = 1;

UPDATE Seq_Dno SET Current_Value = LAST_INSERT_ID(Current_Value + 1) WHERE Seq_Id = 1;

UPDATE Seq_Dno SET Current_Value = LAST_INSERT_ID(Current_Value + 1) WHERE Seq_Id = 1;

UPDATE Seq_Dno SET Current_Value = LAST_INSERT_ID(Current_Value + 1) WHERE Seq_Id = 1;

UPDATE Seq_Dno SET Current_Value = LAST_INSERT_ID(Current_Value + 1) WHERE Seq_Id = 1;

INSERT INTO Department (D_No, D_Name, Mgr_No, Mgr_Start_Date) VALUES (LAST_INSERT_ID(), 'Human Resources', 1, '2026-11-19');

UPDATE Seq_Dno SET Max_Value = 20 WHERE Seq_Id = 1;

CREATE VIEW EMP_VIEW AS SELECT Emp_Id, First_Name, Last_Name, Salary FROM Employee;

CREATE VIEW HIGH_SALARY_VIEW AS SELECT * FROM Employee WHERE Salary > 60000;

CREATE VIEW Vw_Emp AS SELECT Emp_Id, Salary, Dept_No FROM Employee;

SELECT Emp_Id, Salary FROM Vw_Emp WHERE Dept_No = 1;

INSERT INTO EMP_VIEW (Emp_Id, First_Name, Last_Name, Salary) VALUES (12, 'Neha', 'Patil', 68000);

DROP VIEW EMP_VIEW;