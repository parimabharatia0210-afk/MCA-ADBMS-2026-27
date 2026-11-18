CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    empno DECIMAL(4,0) PRIMARY KEY,
    ename VARCHAR(30),
    job VARCHAR(20),
    hiredate DATE,
    salary DECIMAL(8,2),
    commission DECIMAL(8,2),
    deptno DECIMAL(2,0)
);

INSERT INTO Employee (empno, ename, job, hiredate, salary, commission, deptno) VALUES
(1001, 'Rahul',      'DIRECTOR',     '2018-06-15', 9500.00, NULL,   10),
(1002, 'Priya',      'MANAGER',      '2019-03-04', 6250.75, NULL,   10),
(1003, 'Amit',       'ANALYST',      '2019-11-30', 5400.50, NULL,   10),
(1004, 'Sneha',      'TESTER',       '2020-08-19', 1800.25, NULL,   10),
(1005, 'Vikram',     'MANAGER',      '2018-09-12', 6800.00, NULL,   20),
(1006, 'Neha',       'ANALYST',      '2021-01-01', 4750.60, NULL,   20),
(1007, 'Karan',      'ANALYST',      '2021-07-19', 5100.00, NULL,   20),
(1008, 'Pooja',      'TESTER',       '2022-02-28', 1650.45, NULL,   20),
(1009, 'Rohan',      'DEVELOPER',    '2020-12-20', 2200.00, 500.00, 30),
(1010, 'Anjali',     'DEVELOPER',    '2021-05-10', 2350.75, 800.00, 30),
(1011, 'Suresh',     'DBA',          '2022-09-05', 2100.00, 0.00,   30),
(1012, '  Meera  ',  'HR EXECUTIVE', '2023-04-12', 1500.00, NULL,   30),
(1013, 'Kavya',      'ANALYST',      '2024-06-24', 4900.90, NULL,   30),
(1014, 'Arjun',      'MANAGER',      '2025-01-31', 7200.30, NULL,   30);

SELECT * FROM Employee;

-- ================= PART 1: AGGREGATE FUNCTIONS =================

SELECT SUM(salary) AS total_salary, AVG(salary) AS average_salary FROM Employee WHERE deptno = 10;

SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM Employee WHERE UPPER(job) = 'ANALYST';


SELECT COUNT(*) AS total_rows, COUNT(commission) AS employees_with_commission FROM Employee;

SELECT SUM(salary) AS total_analyst_salary FROM Employee WHERE UPPER(job) = 'ANALYST';

-- ================= PART 2: NUMERIC SCALAR FUNCTIONS =================

SELECT ename, salary, ROUND(salary, 1) AS rounded_1dp, TRUNCATE(salary, 1) AS truncated_1dp FROM Employee;

SELECT empno, ename FROM Employee WHERE MOD(empno, 2) = 1;

SELECT salary, CEIL(salary) AS ceil_value, FLOOR(salary) AS floor_value FROM Employee;

SELECT ename, salary, ABS(salary - 5000) AS abs_difference,POWER(ABS(salary - 5000), 2) AS difference_squared, SQRT(25) AS sqrt_of_25 FROM Employee;

SELECT GREATEST(15, 28, 9) AS largest, LEAST(15, 28, 9) AS smallest;

-- ================= PART 3: STRING SCALAR FUNCTIONS =================

SELECT ename, LOWER(ename) AS lower_case, UPPER(ename) AS upper_case,CONCAT(UPPER(SUBSTR(TRIM(ename), 1, 1)), LOWER(SUBSTR(TRIM(ename), 2))) AS title_case FROM Employee;

SELECT ename, job, SUBSTR(job, 1, 3) AS job_first_3, LENGTH(TRIM(ename)) AS name_length FROM Employee;

SELECT job, INSTR(job, 'A') AS position_of_A FROM Employee;

SELECT LPAD(job, 12, '*') AS padded_job, RPAD(ename, 20, '.') AS padded_name FROM Employee;

SELECT CONCAT('[', ename, ']') AS original,CONCAT('[', LTRIM(ename), ']') AS after_ltrim,CONCAT('[', RTRIM(ename), ']') AS after_rtrim,CONCAT('[', LTRIM(RTRIM(ename)), ']') AS after_both FROM Employee;

SELECT REPLACE(REPLACE(REPLACE('1sct523', '1', '7'), '2', 'a'), '3', '9') AS translated_string,ASCII('A') AS ascii_of_A;

-- ================= PART 4: DATE SCALAR FUNCTIONS =================

SELECT ename, hiredate, DATE_ADD(hiredate, INTERVAL 6 MONTH) AS probation_end FROM Employee;

SELECT ename, hiredate, LAST_DAY(hiredate) AS month_end,DATE_ADD(hiredate, INTERVAL 7 - WEEKDAY(hiredate) DAY) AS next_monday FROM Employee;

SELECT ename, hiredate,(YEAR('2025-01-01') - YEAR(hiredate)) * 12 + (MONTH('2025-01-01') - MONTH(hiredate)) + (DAY('2025-01-01') - DAY(hiredate)) / 31 AS months_between FROM Employee;

SELECT ename, DATE_FORMAT(hiredate, '%d-%M-%Y (%W)') AS formatted_hiredate FROM Employee;

SELECT * FROM Employee WHERE hiredate > STR_TO_DATE('01-JAN-2021', '%d-%b-%Y');	