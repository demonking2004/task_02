
-- Create department table
CREATE TABLE deptmst (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(20) NOT NULL,
    location VARCHAR(10) DEFAULT 'Unknown'
);

-- Create employee table
CREATE TABLE empmst (
    empno INT PRIMARY KEY,
    empname VARCHAR(15) NOT NULL,
    deptno INT REFERENCES deptmst(deptno),
    salary DECIMAL(8,2) DEFAULT 0.00,
    dob DATE DEFAULT NULL,
    city VARCHAR(10) DEFAULT 'NA'
);

-- Insert sample data into deptmst
INSERT INTO deptmst (deptno, deptname, location)
VALUES 
    (1, 'HR', 'Mumbai'),
    (2, 'IT', DEFAULT),
    (3, 'Finance', NULL),
    (4, 'Marketing', 'Delhi'),
    (5, 'Admin', DEFAULT);

-- Insert sample data into empmst
INSERT INTO empmst (empno, empname, deptno, salary, dob, city)
VALUES 
    (101, 'Amit', 1, 50000.00, '1990-01-01', 'Delhi'),
    (102, 'Sneha', 2, DEFAULT, NULL, DEFAULT),
    (103, 'Ravi', 3, 45000.00, DEFAULT, 'Chennai'),
    (104, 'Kiran', 1, DEFAULT, NULL, NULL),
    (105, 'Neha', 4, 60000.00, '1985-05-10', 'Pune'),
    (106, 'Manoj', 5, DEFAULT, NULL, DEFAULT),
    (107, 'Priya', 2, 75000.00, '1992-03-22', 'Bangalore'),
    (108, 'Raj', 3, 40000.00, '1988-08-08', NULL),
    (109, 'Divya', 1, DEFAULT, DEFAULT, DEFAULT),
    (110, 'Suresh', 4, 55000.00, NULL, 'Hyderabad');

-- UPDATE statements

-- 1. Update salary of employee 'Sneha' to 55000
UPDATE empmst
SET salary = 55000.00
WHERE empname = 'Sneha';

-- 2. Update city to 'Mumbai' where city is NULL
UPDATE empmst
SET city = 'Mumbai'
WHERE city IS NULL;

-- 3. Update location of department 3 to 'Bangalore'
UPDATE deptmst
SET location = 'Bangalore'
WHERE deptno = 3;

-- 4. Increase salary by 10% for employees in department 1
UPDATE empmst
SET salary = salary * 1.10
WHERE deptno = 1;

-- DELETE statements

-- 1. Delete employees with salary = 0
DELETE FROM empmst
WHERE salary = 0.00;

-- 2. Delete departments with location 'Unknown'
DELETE FROM deptmst
WHERE location = 'Unknown';

-- 3. Delete employees without DOB
DELETE FROM empmst
WHERE dob IS NULL;

-- 4. Delete all employees in department 3
DELETE FROM empmst
WHERE deptno = 3;
