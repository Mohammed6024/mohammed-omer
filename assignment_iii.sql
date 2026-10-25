
-- =====================================================
-- Assignment III: SQL Table Manipulation
-- Student: Mohammed Omar
-- Student ID: 202512370
-- Project: Student Registration System
-- DBMS: PostgreSQL
-- =====================================================


-- 1. DATABASE CREATION
-- Run this statement separately if the database does not exist.
-- CREATE DATABASE mohammed_202512370_student_registration_system;


-- 2. TABLE CREATION

CREATE TABLE students (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE registrations (
    registration_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);


-- 3. INITIAL DATA INSERTION

INSERT INTO students (full_name, email, major) VALUES
('Ahmed Ali', 'ahmed@gmail.com', 'Data Science'),
('Mohamed Omar', 'mohamed@gmail.com', 'Data Science'),
('Sara Hassan', 'sara@gmail.com', 'Computer Science'),
('Ali Adam', 'ali@gmail.com', 'Software Engineering'),
('Mona Khalid', 'mona@gmail.com', 'Information Technology');

INSERT INTO courses (course_name, course_code) VALUES
('Database Systems', 'DB101'),
('Data Structures', 'DS102'),
('Operating Systems', 'OS103'),
('Web Development', 'WD104'),
('Computer Networks', 'CN105');

INSERT INTO registrations (student_id, course_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


-- 4. SELECT TASKS

-- Q1.1: Basic Data Retrieval
SELECT full_name, major
FROM students;

-- Q1.2: Conditional Data Retrieval
SELECT full_name, email
FROM students
WHERE major = 'Data Science';

-- Q1.3: Sorted Data Retrieval
SELECT full_name, major
FROM students
ORDER BY full_name ASC;


-- 5. JOIN TASKS

-- Q2.1: INNER JOIN
SELECT s.full_name, c.course_name
FROM registrations r
INNER JOIN students s ON r.student_id = s.student_id
INNER JOIN courses c ON r.course_id = c.course_id;

-- Q2.2: LEFT JOIN
SELECT s.full_name, r.course_id
FROM students s
LEFT JOIN registrations r ON s.student_id = r.student_id;

-- Q2.3: Multi-Table JOIN
SELECT s.full_name, c.course_name, r.registration_date
FROM registrations r
INNER JOIN students s ON r.student_id = s.student_id
INNER JOIN courses c ON r.course_id = c.course_id;


-- 6. UPDATE TASKS

-- Q3.1: Update One Record
UPDATE students
SET email = 'ahmed.ali@gmail.com'
WHERE full_name = 'Ahmed Ali';

SELECT * FROM students
WHERE full_name = 'Ahmed Ali';

-- Q3.2: Update Multiple Records
UPDATE students
SET major = 'Data Science and AI'
WHERE major = 'Data Science';

SELECT * FROM students
WHERE major = 'Data Science and AI';

-- Q3.3: Conditional Update
UPDATE courses
SET course_name = 'Advanced Web Development'
WHERE course_code = 'WD104'
  AND course_name = 'Web Development';

SELECT * FROM courses
WHERE course_code = 'WD104';


-- 7. ALTER TABLE TASKS

-- Q4.1: Rename a Column
ALTER TABLE students
RENAME COLUMN major TO study_program;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students'
ORDER BY ordinal_position;

-- Q4.2: Change a Column Data Type
ALTER TABLE courses
ALTER COLUMN course_name TYPE VARCHAR(150);

SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'courses'
  AND column_name = 'course_name';

-- Q4.3: Add a Column
ALTER TABLE students
ADD COLUMN phone_number VARCHAR(20);

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students'
ORDER BY ordinal_position;


-- 8. ADDITIONAL INSERT TASKS

-- Q5.1: Insert a Single Record
INSERT INTO students (full_name, email, study_program)
VALUES ('Yusuf Ibrahim', 'yusuf@gmail.com', 'Cyber Security');

SELECT * FROM students
WHERE email = 'yusuf@gmail.com';

-- Q5.2: Insert Multiple Records
INSERT INTO courses (course_name, course_code)
VALUES
('Artificial Intelligence', 'AI106'),
('Computer Security', 'CS107'),
('Cloud Computing', 'CC108');

SELECT * FROM courses
WHERE course_code IN ('AI106', 'CS107', 'CC108');

-- Q5.3: Insert a Related Record
INSERT INTO registrations (student_id, course_id)
SELECT s.student_id, c.course_id
FROM students s
CROSS JOIN courses c
WHERE s.email = 'yusuf@gmail.com'
  AND c.course_code = 'AI106';

SELECT s.full_name, c.course_name, r.registration_date
FROM registrations r
JOIN students s ON r.student_id = s.student_id
JOIN courses c ON r.course_id = c.course_id
WHERE s.email = 'yusuf@gmail.com'
  AND c.course_code = 'AI106';


-- 9. FINAL VERIFICATION

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM registrations;
