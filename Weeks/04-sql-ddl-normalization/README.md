# Week 4 Practical Lab — SQL Fundamentals, DDL & Database Design

**Course:** M.000.404.vze – Databases (SQL)  
**Date:** 29 September 2026

## Overview

This lab extends the CourseHub database with a normalized PostgreSQL schema, sample data, constraint tests, and a normalization analysis.

## Repository structure

```text
week-04-sql-ddl-normalization/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   └── 02_test_data.sql
└── normalization/
    └── normalization-analysis.md
```

## Run the SQL files

Run these files in order in pgAdmin's Query Tool or with `psql`:

1. `sql/01_schema.sql` — creates the tables and constraints.
2. `sql/02_test_data.sql` — inserts valid sample data.

The schema script uses `DROP TABLE IF EXISTS ... CASCADE` so it can be rerun during practice. **This deletes the existing tables and their data in this lab schema.** Do not run it against a database containing data you need to keep.

## Schema overview

- `programme`: stores programme names.
- `student`: stores student details and references a programme.
- `instructor`: stores instructor details.
- `course`: stores course details and references an instructor.
- `enrollment`: connects students and courses and stores enrollment-specific information.

### Main constraints

- Primary keys use generated identity columns.
- Student names, email, course title, credits, enrollment date, and status are required.
- Student email and programme name are unique.
- Course credits must be between 1 and 30.
- Enrollment status must be `active`, `completed`, or `withdrawn`.
- Foreign keys prevent references to missing students, courses, programmes, or instructors.
- `UNIQUE (student_id, course_id)` prevents a student from enrolling in the same course more than once.

## Constraint tests

Run each invalid statement **individually** after inserting the valid sample data. Each should fail, so do not put these statements into the normal sample-data script.

### Test 1 — Missing student

```sql
INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (99999, 1, CURRENT_DATE, 'active');
```

**Expected:** Rejected by the `enrollment_student_id_fkey` foreign-key constraint because student `99999` does not exist.

### Test 2 — Invalid status

```sql
INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (1, 1, CURRENT_DATE, 'maybe');
```

**Expected:** Rejected by the `CHECK` constraint `enrollment_status_check`, because `maybe` is not an allowed status.

### Test 3 — Duplicate enrollment

```sql
-- Enrollment (1, 1) already exists in the sample data.
INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (1, 1, CURRENT_DATE, 'active');
```

**Expected:** Rejected by the unique constraint on `(student_id, course_id)` because that student-course pair already exists.

### Test 4 — Invalid credits

```sql
INSERT INTO course (title, credits, instructor_id)
VALUES ('Invalid Course', -5, 1);
```

**Expected:** Rejected by the `CHECK` constraint `course_credits_check`. An integer data type allows negative numbers, but the business rule requires credits to be between 1 and 30.

## Reflection questions

1. **What is the difference between DDL and DML?**  
   DDL (Data Definition Language) defines or changes database structures, for example with `CREATE TABLE` and `ALTER TABLE`. DML (Data Manipulation Language) works with data, for example with `INSERT`, `UPDATE`, and `DELETE`.

2. **Why is a foreign key more than just an integer column?**  
   A foreign key enforces referential integrity: its value must match a referenced key in the related table (unless null is permitted). It prevents orphan records.

3. **Why is `CHECK (credits > 0)` useful even though `credits` is `INTEGER`?**  
   `INTEGER` restricts the data type, not the business meaning. It still permits values such as `-5`; the check enforces a valid range.

4. **What problem does `UNIQUE(student_id, course_id)` prevent?**  
   It prevents duplicate enrollment records for the same student and course.

5. **What is the main idea of 1NF?**  
   Each attribute contains a single value from its domain, with no repeating groups or lists stored in one cell.

6. **What is a partial dependency, and why is it relevant to 2NF?**  
   A non-key attribute depends on only part of a composite candidate key. 2NF removes partial dependencies by ensuring non-prime attributes depend on the whole candidate key.

7. **What is a transitive dependency, and why is it relevant to 3NF?**  
   A non-key attribute depends on another non-key attribute through a chain of functional dependencies. 3NF addresses such dependencies to reduce redundancy and anomalies.

8. **Why should normalization decisions be based on business meaning and functional dependencies?**  
   Functional dependencies express which facts determine other facts. Business rules establish whether those dependencies are true, allowing the schema to separate facts correctly without making unsupported assumptions.

## Optional challenge — semester

If a student may retake a course in different semesters, add a required `semester` attribute to `enrollment` (for example, `semester VARCHAR(20) NOT NULL`) and change the uniqueness rule to `UNIQUE (student_id, course_id, semester)`. This permits one enrollment per student, course, and semester. The exact semester format should be defined by the institution. If multiple attempts within the same semester are allowed, a different key or attempt attribute would be needed.

## Git workflow

```bash
git status
git add .
git commit -m "Complete Week 4 DDL and normalization lab"
git push
```

After pushing, check that the files are visible in your private GitHub repository and that your instructor still has collaborator access.
