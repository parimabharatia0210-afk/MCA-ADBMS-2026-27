CREATE DATABASE IF NOT EXISTS College;
USE College;

CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Age INT CHECK (Age > 15),
    Course VARCHAR(30) NOT NULL,
    City VARCHAR(30) DEFAULT 'Pune',	
    Email VARCHAR(50) UNIQUE,
    Mobile_No VARCHAR(10) UNIQUE NOT NULL,
    Admission_Date DATE NOT NULL,
    Fees DECIMAL(10,2) CHECK (Fees > 20000)
);

INSERT INTO STUDENT
    (Student_ID, Student_Name, Gender, Age, Course, City, Email, Mobile_No, Admission_Date, Fees)
VALUES
    (1, 'Aarav Sharma', 'Male', 21, 'MCA', 'Pune', 'aarav@gmail.com', '9876543210', '2025-07-10', 55000.00),
    (2, 'Priya Patel', 'Female', 19, 'MCA', 'Mumbai', 'priya@gmail.com', '9876543211', '2025-07-12', 45000.00),
    (3, 'Rahul Mehta', 'Male', 23, 'MBA', 'Pune', NULL, '9876543212', '2025-07-15', 65000.00),
    (4, 'Sneha Joshi', 'Female', 17, 'MCA', 'Delhi', 'sneha@gmail.com', '9876543213', '2025-07-18', 35000.00),
    (5, 'Vikram Singh', 'Male', 22, 'BCA', 'Mumbai', 'vikram@gmail.com', '9876543214', '2025-07-20', 30000.00);
    
SELECT * FROM STUDENT;

SELECT Student_Name, Course, City FROM STUDENT;

SELECT * FROM STUDENT WHERE Age > 20;

SELECT * FROM STUDENT WHERE City = 'Pune';

SELECT * FROM STUDENT WHERE Fees > 50000;

SELECT * FROM STUDENT WHERE Age BETWEEN 18 AND 22;

SELECT * FROM STUDENT WHERE City IN ('Pune', 'Mumbai');

SELECT * FROM STUDENT WHERE Course = 'MCA';

SELECT * FROM STUDENT WHERE Fees < 40000;

UPDATE STUDENT SET City = 'Delhi' WHERE Student_ID = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE STUDENT SET Fees = Fees + 10000 WHERE City = 'Pune';

DELETE FROM STUDENT WHERE Student_ID = 2;

DELETE FROM STUDENT WHERE Age < 18;

SELECT * FROM STUDENT ORDER BY Student_Name ASC;

SELECT * FROM STUDENT ORDER BY Fees DESC;

SELECT DISTINCT City FROM STUDENT;

SELECT * FROM STUDENT WHERE Email IS NULL;

ALTER TABLE STUDENT ADD COLUMN Percentage DECIMAL(5,2);
UPDATE STUDENT SET Percentage = 85.50 WHERE Student_ID = 1;
UPDATE STUDENT SET Percentage = 90.00 WHERE Student_ID = 3;
UPDATE STUDENT SET Percentage = 72.40 WHERE Student_ID = 5;