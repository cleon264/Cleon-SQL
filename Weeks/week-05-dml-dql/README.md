# Week 5 – DML, Data Integrity & DQL Fundamentals

## Objective

Week 5 continues the CourseHub database created in the previous weeks.

The goal is to populate the database, modify data safely, investigate constraint violations, and retrieve information using SQL queries.

## B1 – INSERT

One additional student and one enrollment were inserted.

I did not manually provide the primary key values such as student_id and enrollment_id.

PostgreSQL generated these ID values automatically because the columns use GENERATED ALWAYS AS IDENTITY.

I provided the programme_id, student_id and course_id foreign key values because they identify the related existing rows.

## B2 – UPDATE

Before updating an enrollment, a SELECT statement was used to preview the active enrollments.

Only one selected enrollment was changed from active to completed.

Using a specific WHERE condition prevents other enrollment records from being changed accidentally.

## B3 – DELETE

A temporary enrollment was inserted.

The row was checked using SELECT before it was deleted.

A specific WHERE condition was used so that only the intended row was removed.

Another SELECT was used afterwards to verify that the row no longer existed.

# Constraint Violations

## Test 1 – Missing Student

Attempt:

INSERT INTO enrollment
(student_id, course_id, enrollment_date, status)
VALUES
(999, 1, '2026-10-06', 'active');

Result:

PostgreSQL rejects the row because student 999 does not exist.

Constraint:

FOREIGN KEY

Business rule:

An enrollment must reference an existing student.

## Test 2 – Invalid Status

Attempt:

status = 'maybe'

Result:

PostgreSQL rejects the value.

Constraint:

CHECK constraint on enrollment status.

Business rule:

The allowed statuses are active, completed and withdrawn.

## Test 3 – Duplicate Enrollment

An attempt was made to enroll the same student in the same course twice.

Constraint:

UNIQUE(student_id, course_id)

Business rule:

A student cannot be enrolled in the same course more than once.

## Test 4 – Invalid Credits

Attempt:

credits = -5

Result:

PostgreSQL rejects the course.

Constraint:

CHECK constraint on credits.

Business rule:

Course credits must be greater than 0 and no more than 30.

## Test 5 – Missing Required Value

An attempt was made to insert a student without a surname.

PostgreSQL rejects the row.

Constraint:

NOT NULL

Business rule:

Every student must have the required student information.

# NULL

A nullable phone column was added to STUDENT.

Only some students were given phone numbers.

IS NULL was used to find students without a phone number.

IS NOT NULL was used to find students with a phone number.

COALESCE was used to display "Not provided" when the phone value was NULL.

# Reflection Questions

## 1. What is the difference between DELETE and DROP TABLE?

DELETE removes rows from a table but keeps the table itself.

DROP TABLE removes the entire table, including its structure and data.

## 2. Why should you preview rows with SELECT before an UPDATE or DELETE?

SELECT allows us to check which rows will be affected before changing or deleting them.

This reduces the risk of accidentally changing the wrong rows.

## 3. Why is NULL different from 0 or an empty string?

NULL means that a value is missing or unknown.

0 is a numeric value and an empty string is a text value.

## 4. Why do we use IS NULL instead of = NULL?

NULL represents an unknown value and cannot be compared using normal equality.

Therefore, SQL uses IS NULL to test whether a value is NULL.

## 5. What is the difference between WHERE and ORDER BY?

WHERE filters which rows are returned.

ORDER BY controls the order in which the returned rows are displayed.

## 6. What does DISTINCT change: stored data or only the result set?

DISTINCT changes only the query result.

It does not modify the data stored in the database.

## 7. Give one example where a constraint protected your database during this lab.

The foreign key constraint prevented an enrollment from being created for student_id 999 because that student did not exist.

# SQL Files

## 01_seed_data.sql

Contains the initial CourseHub sample data.

## 02_crud_and_integrity.sql

Contains INSERT, UPDATE, DELETE and constraint violation tests.

## 03_queries.sql

Contains SELECT queries, filtering, sorting, DISTINCT, NULL handling and SQL functions.

# Conclusion

Week 5 demonstrates how SQL can be used to insert, update, delete and retrieve CourseHub data.

Database constraints protect data integrity, while SELECT queries allow data to be filtered, sorted and transformed without changing the stored data.