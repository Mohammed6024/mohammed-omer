
# Student Registration System

## 1. Project Overview

**Student Name:** Mohammed Omar  
**Student ID:** 202512370  
**Project Name:** Student Registration System  
**Database Management System:** PostgreSQL

This project demonstrates how to create and manage a relational database using SQL. It stores information about students, courses, and course registrations.

## 2. Database Design

**Database Name:**
`mohammed_202512370_student_registration_system`

### Table 1: students

Stores information about students.

| Column | Data Type | Description |
|---|---|---|
| student_id | INTEGER | Primary key, automatically generated |
| full_name | VARCHAR(100) | Student's full name |
| email | VARCHAR(100) | Unique student email |
| study_program | VARCHAR(50) | Student's study program |
| phone_number | VARCHAR(20) | Student's phone number |

### Table 2: courses

Stores information about courses.

| Column | Data Type | Description |
|---|---|---|
| course_id | INTEGER | Primary key, automatically generated |
| course_name | VARCHAR(150) | Course name |
| course_code | VARCHAR(20) | Unique course code |

### Table 3: registrations

Connects students to the courses they register for.

| Column | Data Type | Description |
|---|---|---|
| registration_id | INTEGER | Primary key, automatically generated |
| student_id | INTEGER | Foreign key referencing students |
| course_id | INTEGER | Foreign key referencing courses |
| registration_date | DATE | Date of registration |

## 3. Relationships

- Each student has a unique student ID.
- Each course has a unique course ID.
- The registrations table connects students and courses.
- The student_id foreign key references students(student_id).
- The course_id foreign key references courses(course_id).

These relationships help maintain data consistency and reduce unnecessary duplication.

## 4. Entity-Relationship Diagram (ERD)

The ERD was generated using pgAdmin 4.

![Entity Relationship Diagram](erd.png)

## 5. SQL Practical Tasks

### Q1: SELECT — Data Retrieval

- Q1.1: Retrieve selected student columns.
- Q1.2: Retrieve students using a WHERE condition.
- Q1.3: Sort student records using ORDER BY.

### Q2: JOIN — Related Data

- Q2.1: INNER JOIN retrieves matching records.
- Q2.2: LEFT JOIN includes all students, even those without registrations.
- Q2.3: Multi-table JOIN combines student, course, and registration information.

### Q3: UPDATE — Modify Data

- Q3.1: Update one student's email.
- Q3.2: Update the study program of multiple students.
- Q3.3: Update a course name using a condition.

### Q4: ALTER TABLE — Modify Structure

- Q4.1: Rename major to study_program.
- Q4.2: Change the course_name data type to VARCHAR(150).
- Q4.3: Add the phone_number column.

### Q5: INSERT — Add Data

- Q5.1: Insert one new student.
- Q5.2: Insert multiple courses.
- Q5.3: Insert a registration linked to an existing student and course.

All SQL statements are documented in `assignment_iii.sql`.

## 6. Execution Evidence

Screenshots of actual query results and structural changes should be added here to demonstrate that each SQL task was executed successfully.

## 7. Conclusion

This project improved my understanding of relational database design, primary keys, foreign keys, data insertion, data retrieval, JOIN operations, UPDATE statements, and ALTER TABLE operations.

It also demonstrated how database constraints help maintain data integrity.
