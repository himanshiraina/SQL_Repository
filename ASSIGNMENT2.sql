--Create Database SIS
CREATE DATABASE SIS;
--Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);
--Create Teacher Table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
--Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
--Create Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

--Create Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
--Insert 10 samples into Student Tables
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    (1, 'John', 'Doe', '1998-05-15', 'john@example.com', '1234567890'),
    (2, 'Jane', 'Smith', '1999-08-20', 'jane@example.com', '1987654321'),
    (3, 'Michael', 'Johnson', '2000-03-10', 'michael@example.com', '1555123456'),
    (4, 'Emily', 'Williams', '1997-11-25', 'emily@example.com', '1888777666'),
    (5, 'David', 'Brown', '1996-09-05', 'david@example.com', '1444333222'),
    (6, 'Sarah', 'Taylor', '2001-07-18', 'sarah@example.com', '1777666555'),
    (7, 'Matthew', 'Anderson', '1999-01-30', 'matthew@example.com', '1666777888'),
    (8, 'Olivia', 'Martinez', '1998-12-03', 'olivia@example.com', '1999888777'),
    (9, 'William', 'Garcia', '2002-04-12', 'william@example.com', '1222999111'),
    (10, 'Ava', 'Lopez', '2003-06-28', 'ava@example.com', '1333444222');
--Insert 10 samples into Courses Tables
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Mathematics', 4, 101),
    (2, 'English Literature', 3, 102),
    (3, 'Physics', 5, 103),
    (4, 'History', 3, 104),
    (5, 'Computer Science', 4, 105),
    (6, 'Biology', 4, 101),
    (7, 'Chemistry', 5, 102),
    (8, 'Art', 2, 103),
    (9, 'Music', 2, 104),
    (10, 'Economics', 4, 105);
--Insert 10 samples into Teacher Tables
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (101, 'Alice', 'Johnson', 'alice@example.com'),
    (102, 'Bob', 'Smith', 'bob@example.com'),
    (103, 'Charlie', 'Williams', 'charlie@example.com'),
    (104, 'Diana', 'Brown', 'diana@example.com'),
    (105, 'Eva', 'Miller', 'eva@example.com'),
    (106, 'Frank', 'Wilson', 'frank@example.com'),
    (107, 'Grace', 'Martinez', 'grace@example.com'),
    (108, 'Henry', 'Anderson', 'henry@example.com'),
    (109, 'Ivy', 'Garcia', 'ivy@example.com'),
    (110, 'Jack', 'Lee', 'jack@example.com');
--Insert 10 samples into Student Tables
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 5, '2023-01-10'),
    (2, 2, 2, '2023-02-15'),
    (3, 3, 7, '2023-03-20'),
    (4, 4, 1, '2023-04-25'),
    (5, 5, 3, '2023-05-30'),
    (6, 6, 6, '2023-06-05'),
    (7, 7, 9, '2023-07-10'),
    (8, 8, 4, '2023-08-15'),
    (9, 9, 10, '2023-09-20'),
    (10, 10, 8, '2023-10-25');
--Insert 10 samples into Payments Tables
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2023-01-05'),
    (2, 2, 350.00, '2023-02-10'),
    (3, 3, 400.00, '2023-03-15'),
    (4, 4, 550.00, '2023-04-20'),
    (5, 5, 300.00, '2023-05-25'),
    (6, 6, 450.00, '2023-06-30'),
    (7, 7, 480.00, '2023-07-05'),
    (8, 8, 600.00, '2023-08-10'),
    (9, 9, 520.00, '2023-09-15'),
    (10, 10, 370.00, '2023-10-20');
--Select all tables
SELECT * FROM Courses
SELECT * FROM Enrollments
SELECT * FROM Teacher
SELECT * FROM Students
SELECT * FROM Payments

---1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890

Select * from Students;
INSERT INTO Students (student_id,first_name, last_name, date_of_birth, email, phone_number)
VALUES (11,'Himanshi', 'Raina', '2005-08-15', 'hr@example.com', '9564567890')

---2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
select * from Enrollments;
Insert into Enrollments (enrollment_id,student_id,course_id,enrollment_date) 
Values(11,11,4,'2023-11-29')

---3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
select * from Teacher
update Teacher set email = 'glenn@gmail.com'
WHERE teacher_id =105;

---4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on student and course.
select * from Enrollments
delete from Enrollments where student_id = 8 AND course_id = 4;

---5.Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
select * from Courses
update Courses set teacher_id = 101 WHERE course_id = 2;

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity
Select * from Students
select * from Enrollments
declare @id int 
set @id=5 
delete from Students where student_id=@id ;
delete from Enrollments where student_id=@id; 

---7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
select * from Payments
update Payments SET amount = 900 WHERE payment_id = 10; 

----Joins

--1 Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
select * from Students
select * from Payments

declare @stu int
set @stu =1
SELECT s.student_id,s.first_name,s.last_name,SUM(p.amount) AS totalpayments
FROM Students AS s
JOIN Payments AS p 
on s.student_id = p.student_id
WHERE s.student_id = @stu 
GROUP BY s.student_id, s.first_name, s.last_name;

---2 Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
 select * from Courses
 select * from Enrollments

SELECT c.course_id,c.course_name,COUNT(e.student_id) AS enrolledstu
FROM Courses c  
JOIN Enrollments e 
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

---3 Write an SQL query to find the names of students who have not enrolled in any course. Use aLEFT JOIN between the "Students" table and the "Enrollments" table to identify studentswithout enrollments.
select * from Students
select * from Enrollments

SELECT s.first_name,s.last_name FROM Students s 
LEFT JOIN Enrollments e 
ON s.student_id = e.student_id 
WHERE e.student_id IS NULL;

---4 Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the Enrollments" and "Courses" tables.
SELECT s.first_name,s.last_name,c.course_name 
FROM Students s 
JOIN Enrollments e 
ON s.student_id = e.student_id 
JOIN Courses c ON e.course_id = c.course_id;

--5 Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
select * from Teacher
Select * from Courses

select t.first_name,t.last_name,c.course_name from Teacher t join Courses c on t.teacher_id=c.teacher_id

---6 Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the"Students" table with the "Enrollments" and "Courses" tables.
select * from Students
select * from Courses
select * from Enrollments

declare @co varchar(50)
set @co='Chemistry'
select s.first_name,s.Last_name,c.course_name,enrollment_date from Students s 
join Enrollments e on e.student_id=s.student_id
join Courses c on c.course_id=e.course_id
where course_name=@co

---7 Find the names of students who have not made any payments. Use a LEFT JOIN between the"Students" table and the "Payments" table and filter for students with NULL payment records.
select * from Students
select * from Payments

select s.first_name,s.last_name from Students s 
left join Payments p 
on s.student_id=p.student_id 
where p.amount is null

---8 Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULLenrollment records.
select * from Courses
select * from Enrollments

select c.course_name,c.course_id 
from Courses c 
left join Enrollments e 
on c.course_id=e.course_id 
where e.course_id is null

----9 Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
select s.student_id,s.first_name,s.last_name,count(e.enrollment_id) as counts from Enrollments e
JOIN Students s ON e.student_id = s.student_id 
group by s.student_id, s.first_name, s.last_name
having count(e.enrollment_id) > 1

---10 Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
select * from Teacher
select * from Courses

select t.teacher_id,t.first_name,t.last_name 
from Teacher t 
left join Courses c 
on t.teacher_id=c.teacher_id 
where c.teacher_id is null

----Aggregate Functions
SELECT * FROM Courses
SELECT * FROM Enrollments
SELECT * FROM Students
SELECT * FROM Teacher
SELECT * FROM Payments


--1. Write an SQL query to calculate the average number of students enrolled in each course.
SELECT course_id,course_name,(SELECT AVG(student_id) FROM Enrollments e WHERE e.course_id = c.course_id) AS average_students_enrolled
FROM Courses c

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount
SELECT student_id, amount as maxpaymentamount FROM Payments
WHERE amount = (SELECT MAX(amount) FROM Payments);

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count
select course_id, course_name from courses
where course_id=(select max(enrollment_id) from Enrollments) 

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
SELECT teacher_id,first_name,
    (
        SELECT (SUM(p.amount))
        FROM Courses c
        LEFT JOIN Enrollments e ON c.course_id = e.course_id
        LEFT JOIN Payments p ON e.student_id = p.student_id
        WHERE c.teacher_id = t.teacher_id
    ) AS total_payments
FROM Teacher t

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses
SELECT student_id, first_name, last_name
FROM Students S 
WHERE 
(SELECT COUNT(DISTINCT course_id)FROM Enrollments) = (SELECT COUNT(DISTINCT course_id )FROM Enrollments AS E WHERE S.student_id = E.student_id);

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
SELECT teacher_id, first_name, last_name FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT AVG(age) as avg_age from (
SELECT GETDATE() as CurrentDate,DATEDIFF(YY,date_of_birth,GETDATE()) AS age from Students)
as Student_ages;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
SELECT course_name,course_id from Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
SELECT student_id, course_id, (SELECT SUM(amount)FROM Payments
WHERE Payments.student_id = Enrollments.student_id
AND Enrollments.student_id = Payments.student_id) AS total_payments
FROM Enrollments;

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one
SELECT DISTINCT student_id FROM Payments
WHERE student_id IN ( SELECT student_id FROM Payments GROUP BY student_id HAVING COUNT(*) > 1);


--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT S.student_id, S.first_name, S.last_name, COALESCE(SUM(P.amount), 0) AS total_payments
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;


--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
SELECT C.course_name, COUNT(E.student_id) AS enrolled_students
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average. 
SELECT S.student_id, S.first_name, S.last_name, AVG(P.amount) AS average_payment
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;
