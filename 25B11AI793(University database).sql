CREATE DATABASE UniversityDB;
USE UniversityDB;

-- 1. Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    HOD VARCHAR(50)
);

-- 2. Student Table
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 3. Faculty Table
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 4. Course Table
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Credits INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 5. Enrollment Table
CREATE TABLE Enrollment (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Semester INT,
    Grade VARCHAR(5),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- Insert Departments
INSERT INTO Department VALUES
(101, 'Computer Science', 'Dr. Ravi'),
(102, 'Information Technology', 'Dr. Kumar'),
(103, 'Electronics', 'Dr. Priya');

-- Insert Students
INSERT INTO Student VALUES
(1, 'Prasanna', 'Female', 'prasanna@gmail.com', 101),
(2, 'Aishwarya', 'Female', 'aishwarya@gmail.com', 102),
(3, 'Rahul', 'Male', 'rahul@gmail.com', 101),
(4, 'Sneha', 'Female', 'sneha@gmail.com', 103);

-- Insert Faculty
INSERT INTO Faculty VALUES
(201, 'Dr. Arun', 'arun@gmail.com', 101),
(202, 'Dr. Meena', 'meena@gmail.com', 102),
(203, 'Dr. Suresh', 'suresh@gmail.com', 103);

-- Insert Courses
INSERT INTO Course VALUES
(301, 'DBMS', 4, 101),
(302, 'Python', 4, 101),
(303, 'Web Technology', 3, 102),
(304, 'Digital Electronics', 4, 103);

-- Insert Enrollment
INSERT INTO Enrollment VALUES
(401, 1, 301, 2, 'A'),
(402, 1, 302, 2, 'A+'),
(403, 2, 303, 2, 'B+'),
(404, 3, 301, 2, 'A'),
(405, 4, 304, 2, 'A+');

-- Display all students
SELECT * FROM Student;

-- Display students with department names
SELECT Student.Student_Name, Department.Dept_Name
FROM Student
JOIN Department
ON Student.Dept_ID = Department.Dept_ID;

-- Display courses with department names
SELECT Course.Course_Name, Course.Credits, Department.Dept_Name
FROM Course
JOIN Department
ON Course.Dept_ID = Department.Dept_ID;

-- Display student enrollment details
SELECT Student.Student_Name, Course.Course_Name, Enrollment.Semester, Enrollment.Grade
FROM Enrollment
JOIN Student
ON Enrollment.Student_ID = Student.Student_ID
JOIN Course
ON Enrollment.Course_ID = Course.Course_ID;

-- Find students from Computer Science
SELECT Student_Name
FROM Student
WHERE Dept_ID = 101;

-- Find courses having more than 3 credits
SELECT Course_Name, Credits
FROM Course
WHERE Credits > 3;

-- Count students in each department
SELECT Dept_ID, COUNT(*) AS Total_Students
FROM Student
GROUP BY Dept_ID;

-- Update student email
UPDATE Student
SET Email = 'prasanna123@gmail.com'
WHERE Student_ID = 1;

-- Delete a student
DELETE FROM Student
WHERE Student_ID = 4;