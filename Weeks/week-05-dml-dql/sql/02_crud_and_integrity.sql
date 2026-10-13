-- Week 5: CRUD and Data Integrity

-- B1 - INSERT

-- Add one additional student

INSERT INTO student (name, surname, email, programme_id)
VALUES
    ('Lucas', 'Martin', 'lucas@example.com', 2);

-- Add one valid enrollment

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (6, 3, '2026-10-06', 'active');

-- Verify

SELECT *
FROM student
WHERE email = 'lucas@example.com';


-- B2 - UPDATE

-- Preview active enrollments first

SELECT *
FROM enrollment
WHERE status = 'active';

-- Update ONE selected enrollment

UPDATE enrollment
SET status = 'completed'
WHERE student_id = 1
  AND course_id = 1;

-- Verify

SELECT *
FROM enrollment
WHERE student_id = 1
  AND course_id = 1;


-- B3 - DELETE

-- Insert a temporary enrollment

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (6, 4, '2026-10-06', 'active');

-- Find the temporary enrollment

SELECT *
FROM enrollment
WHERE student_id = 6
  AND course_id = 4;

-- Preview before deleting

SELECT *
FROM enrollment
WHERE student_id = 6
  AND course_id = 4;

-- Delete only the temporary enrollment

DELETE FROM enrollment
WHERE student_id = 6
  AND course_id = 4;

-- Verify that it is gone

SELECT *
FROM enrollment
WHERE student_id = 6
  AND course_id = 4;


-- B4 - INVALID TESTS

-- TEST 1: Student does not exist

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (999, 1, '2026-10-06', 'active');

-- Rejected by FOREIGN KEY because student 999 does not exist.

-- TEST 2: Invalid status

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (5, 2, '2026-10-06', 'maybe');

-- Rejected by CHECK constraint because "maybe"

-- TEST 3: Duplicate enrollment

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (1, 2, '2026-10-06', 'active');

-- Rejected by UNIQUE(student_id, course_id).

-- TEST 4: Invalid credits

INSERT INTO course (title, credits, instructor_id)
VALUES
    ('Invalid Course', -5, 1);

-- Rejected by the credits CHECK constraint.

-- TEST 5: Missing required value

INSERT INTO student (name, surname, email, programme_id)
VALUES
    ('Test', NULL, 'test@example.com', 1);

-- Rejected because surname is NOT NULL.