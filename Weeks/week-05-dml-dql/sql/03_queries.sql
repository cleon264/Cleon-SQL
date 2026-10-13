-- Week 5: DQL Queries

-- C1 - BASIC SELECT

-- Return all course titles and credits

SELECT title, credits
FROM course;


-- C2 - ALIAS

SELECT
    title AS course_name,
    credits
FROM course;


-- C3 - EXPRESSION

-- One credit = approximately 30 workload hours

SELECT
    title AS course_name,
    credits,
    credits * 30 AS estimated_hours
FROM course;


-- C4 - COMPARISON OPERATOR

-- Courses with at least 5 credits

SELECT title, credits
FROM course
WHERE credits >= 5;


-- C5 - AND

-- At least 5 credits and not Programming

SELECT title, credits
FROM course
WHERE credits >= 5
  AND title <> 'Programming';


-- C6 - OR

-- Active OR completed enrollments

SELECT *
FROM enrollment
WHERE status = 'active'
   OR status = 'completed';


-- C7 - TEXT FILTERING

-- Course title containing Data

SELECT title, credits
FROM course
WHERE title LIKE '%Data%';


-- C8 - ORDER BY

-- Credits descending
-- Title ascending if credits are equal

SELECT title, credits
FROM course
ORDER BY credits DESC, title ASC;


-- C9 - DISTINCT

-- Different enrollment statuses

SELECT DISTINCT status
FROM enrollment;


-- C10 - COMBINED QUERY

SELECT
    title AS course_name,
    credits,
    credits * 30 AS estimated_hours
FROM course
WHERE credits >= 5
ORDER BY credits DESC;


-- PART D - NULL AND FUNCTIONS


-- D1 - Add an optional phone column

ALTER TABLE student
ADD COLUMN phone VARCHAR(50);

-- Add phone numbers for only some students

UPDATE student
SET phone = '+49 111 111111'
WHERE student_id = 1;

UPDATE student
SET phone = '+49 222 222222'
WHERE student_id = 2;

UPDATE student
SET phone = '+49 333 333333'
WHERE student_id = 4;

-- Students whose phone is NULL

SELECT *
FROM student
WHERE phone IS NULL;

-- Students whose phone is NOT NULL

SELECT *
FROM student
WHERE phone IS NOT NULL;


-- D2 - COALESCE

SELECT
    name,
    surname,
    COALESCE(phone, 'Not provided') AS phone
FROM student;


-- D3 - TEXT FUNCTIONS

SELECT
    title,
    UPPER(title) AS uppercase_title,
    LENGTH(title) AS title_length
FROM course;

-- Additional LOWER example

SELECT
    title,
    LOWER(title) AS lowercase_title
FROM course;


-- D4 - CURRENT DATE

SELECT CURRENT_DATE;