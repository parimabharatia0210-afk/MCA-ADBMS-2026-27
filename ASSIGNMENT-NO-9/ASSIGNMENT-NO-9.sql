USE college;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(30),
    Location VARCHAR(30)
);

INSERT INTO Department VALUES
(10, 'HR', 'Pune'),
(20, 'Finance', 'Mumbai'),
(30, 'IT', 'Pune'),
(40, 'Marketing', 'Delhi'),
(50, 'Sales', 'Bangalore');

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(40),
    Gender VARCHAR(10),
    Designation VARCHAR(30),
    Salary DECIMAL(10,2),
    Hire_Date DATE,
    Dept_ID INT,
    Email VARCHAR(50),
    FOREIGN KEY (Dept_ID)
        REFERENCES Department(Dept_ID)
);

INSERT INTO Employee VALUES
(101, 'Amit Sharma', 'Male', 'Manager', 75000, '2020-01-15', 10, 'amit@abc.com'),
(102, 'Priya Patil', 'Female', 'Analyst', 55000, '2021-06-10', 20, 'priya@abc.com'),
(103, 'Rahul Deshmukh', 'Male', 'Developer', 60000, '2022-03-20', 30, 'rahul@abc.com'),
(104, 'Sneha Kulkarni', 'Female', 'HR Executive', 45000, '2023-08-12', 10, 'sneha@abc.com'),
(105, 'Neha Joshi', 'Female', 'Accountant', 50000, '2021-11-05', 20, 'neha@abc.com'),
(106, 'Karan Mehta', 'Male', 'Developer', 65000, '2020-02-18', 30, 'karan@abc.com'),
(107, 'Pooja Shah', 'Female', 'Executive', 40000, '2024-04-22', 40, 'pooja@abc.com'),
(108, 'Rohit Verma', 'Male', 'Sales Manager', 70000, '2019-09-15', 50, 'rohit@abc.com'),
(109, 'Anjali Rao', 'Female', 'Developer', 62000, '2022-12-11', 30, 'anjali@abc.com'),
(110, 'Vikas Gupta', 'Male', 'Sales Executive', 42000, '2023-07-01', 50, 'vikas@abc.com');

SELECT * FROM Department;

SELECT * FROM Employee;

-- Exercise A – Views

CREATE VIEW EMP_BASIC_VIEW AS SELECT Emp_ID, Emp_Name, Designation, Salary FROM Employee;

CREATE VIEW EMP_HIGH_SALARY AS SELECT * FROM Employee WHERE Salary > 50000;

CREATE VIEW EMP_IT_VIEW AS SELECT Emp_ID, Emp_Name, Salary, Dept_ID FROM Employee WHERE Dept_ID = 30;

CREATE VIEW EMP_FEMALE_VIEW AS SELECT * FROM Employee WHERE Gender = 'Female';

SELECT * FROM EMP_HIGH_SALARY ORDER BY Salary DESC;

SELECT * FROM EMP_BASIC_VIEW WHERE Salary BETWEEN 40000 AND 60000;

UPDATE EMP_BASIC_VIEW SET Salary = 56000 WHERE Emp_ID = 102;

SELECT * FROM Employee WHERE Emp_ID = 102;

CREATE VIEW EMP_PUNE_VIEW AS SELECT E.Emp_ID, E.Emp_Name, E.Designation,E.Salary, E.Dept_ID, D.Dept_Name, D.Location FROM Employee E JOIN Department D ON E.Dept_ID = D.Dept_ID WHERE D.Location = 'Pune';

CREATE VIEW EMP_READONLY_VIEW AS SELECT DISTINCT Emp_ID, Emp_Name, Salary FROM Employee;

DROP VIEW EMP_FEMALE_VIEW;

SELECT * FROM Employee;

-- Exercise B – Sequences

CREATE TABLE EMP_SEQ ( Seq_Name VARCHAR(30) PRIMARY KEY, Current_Value INT NOT NULL, Increment_By INT NOT NULL, Min_Value INT NOT NULL, Max_Value INT NOT NULL );

INSERT INTO EMP_SEQ VALUES ('EMP_SEQ', 110, 1, 111, 999);

UPDATE EMP_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'EMP_SEQ' AND Current_Value + Increment_By <= Max_Value; SELECT LAST_INSERT_ID() AS NEXTVAL;

SELECT Current_Value AS CURRVAL FROM EMP_SEQ WHERE Seq_Name = 'EMP_SEQ';

UPDATE EMP_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'EMP_SEQ' AND Current_Value + Increment_By <= Max_Value;

INSERT INTO Employee (Emp_ID, Emp_Name, Gender, Designation, Salary, Hire_Date, Dept_ID, Email) VALUES (LAST_INSERT_ID(), 'Meera Kulkarni', 'Female', 'Tester', 48000, '2025-10-15', 30, 'meera@abc.co');

UPDATE EMP_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'EMP_SEQ' AND Current_Value + Increment_By <= Max_Value;

INSERT INTO Employee (Emp_ID, Emp_Name, Gender, Designation, Salary, Hire_Date, Dept_ID, Email) VALUES(LAST_INSERT_ID(), 'Arjun Patil', 'Male', 'Analyst', 52000, '2025-11-01', 20, 'arjun@abc.com');

UPDATE EMP_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'EMP_SEQ' AND Current_Value + Increment_By <= Max_Value;

INSERT INTO Employee (Emp_ID, Emp_Name, Gender, Designation, Salary, Hire_Date, Dept_ID, Email) VALUES (LAST_INSERT_ID(), 'Riya Shah', 'Female', 'Developer', 58000, '2025-11-05', 30, 'riya@abc.com');

SELECT * FROM Employee ORDER BY Emp_ID;

CREATE TABLE DEPT_SEQ (Seq_Name VARCHAR(30) PRIMARY KEY,Current_Value INT NOT NULL,Increment_By INT NOT NULL );

INSERT INTO DEPT_SEQ VALUES ('DEPT_SEQ', 50, 10);

UPDATE DEPT_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'DEPT_SEQ';

INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES (LAST_INSERT_ID(), 'Research', 'Hyderabad');

SELECT Current_Value AS CURRVAL FROM DEPT_SEQ WHERE Seq_Name = 'DEPT_SEQ';

CREATE TABLE TEST_SEQ ( Seq_Name VARCHAR(30) PRIMARY KEY, Current_Value INT NOT NULL, Increment_By INT NOT NULL, Max_Value INT NOT NULL );

INSERT INTO TEST_SEQ VALUES ('TEST_SEQ', -1, 2, 15);

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT LAST_INSERT_ID() AS NEXTVAL;

UPDATE TEST_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By) WHERE Seq_Name = 'TEST_SEQ' AND Current_Value + Increment_By <= Max_Value;

SELECT ROW_COUNT() AS ROWS_UPDATED;

SELECT Current_Value AS CURRVAL FROM TEST_SEQ  WHERE Seq_Name = 'TEST_SEQ';

UPDATE EMP_SEQ SET Increment_By = 5 WHERE Seq_Name = 'EMP_SEQ';

DROP TABLE TEST_SEQ;

SHOW TABLES LIKE 'TEST_SEQ';

-- Exercise C – Indexes

CREATE INDEX IDX_EMP_NAME ON Employee(Emp_Name);

SELECT * FROM Employee WHERE Emp_Name = 'Rahul Deshmukh';

CREATE INDEX IDX_EMP_SALARY ON Employee(Salary);

SELECT * FROM Employee WHERE Salary > 60000;

CREATE INDEX IDX_EMP_DEPT_SAL ON Employee(Dept_ID, Salary);

SELECT * FROM Employee WHERE Dept_ID = 30 AND Salary > 50000;

CREATE UNIQUE INDEX IDX_EMP_EMAIL ON Employee(Email);

INSERT INTO Employee VALUES (900, 'Test Employee 1', 'Male', 'Tester', 40000, '2025-12-01', 30, 'duplicate@abc.com');

INSERT INTO Employee VALUES (901, 'Test Employee 2', 'Female', 'Analyst',45000, '2025-12-02', 20, 'duplicate@abc.com');

SHOW INDEX FROM Employee;

SELECT INDEX_NAME,TABLE_NAME,NON_UNIQUE,COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'Employee' ORDER BY INDEX_NAME, SEQ_IN_INDEX;

DROP INDEX IDX_EMP_SALARY ON Employee;

SHOW INDEX FROM Employee WHERE Key_name = 'IDX_EMP_SALARY';

-- Exercise D – Application-Based Questions

CREATE VIEW HR_EMPLOYEE_VIEW AS SELECT Emp_Name, Designation, Salary FROM Employee;

SELECT * FROM Employee WHERE Dept_ID = 30 AND Salary > 50000;

UPDATE EMP_SEQ SET Current_Value = LAST_INSERT_ID(Current_Value + Increment_By)WHERE Seq_Name = 'EMP_SEQ' AND Current_Value + Increment_By <= Max_Value;

INSERT INTO Employee(Emp_ID, Emp_Name, Gender, Designation, Salary,  Hire_Date, Dept_ID, Email)VALUES(LAST_INSERT_ID(), 'Aarav Joshi', 'Male', 'Developer',55000, '2025-12-10', 30, 'aarav@abc.com');

CREATE VIEW DEPT_EMP_SUMMARY AS SELECT D.Dept_ID, D.Dept_Name,COUNT(E.Emp_ID) AS Total_Employees, AVG(E.Salary) AS Average_Salary FROM Department D LEFT JOIN Employee E ON D.Dept_ID = E.Dept_ID GROUP BY D.Dept_ID, D.Dept_Name;

SELECT * FROM DEPT_EMP_SUMMARY;

CREATE VIEW EMP_ABOVE_AVG_SALARY AS SELECT * FROM Employee WHERE Salary > (SELECT AVG(Salary)FROM Employee );

SELECT * FROM EMP_ABOVE_AVG_SALARY;

CREATE INDEX IDX_DESIGNATION_SALARY ON Employee(Designation, Salary);

SELECT * FROM Employee WHERE Designation = 'Developer' AND Salary > 50000;