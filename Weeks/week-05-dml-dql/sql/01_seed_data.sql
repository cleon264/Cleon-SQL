-- Week 5: CourseHub Seed Data
-- Continuation of Week 4 CourseHub schema

-- PROGRAMMES

INSERT INTO programme (programme_name)
VALUES
    ('Computer Science'),
    ('Business Management');

-- INSTRUCTORS

INSERT INTO instructor (instructor_name)
VALUES
    ('Dr. Meyer'),
    ('Prof. Bahadir'),
    ('Dr. Schneider');

-- STUDENTS

INSERT INTO student (name, surname, email, programme_id)
VALUES
    ('Cleon', 'Sequeira', 'cleon@example.com', 1),
    ('Jashant', 'Sharma', 'jashant@example.com', 1),
    ('Manjot', 'Singh', 'manjot@example.com', 1),
    ('Rajneesh', 'Khushwaha', 'rajneesh@example.com', 2),
    ('Anna', 'Neyer', 'anna@example.com', 2);

-- COURSES

INSERT INTO course (title, credits, instructor_id)
VALUES
    ('Databases', 4, 1),
    ('Programming', 5, 2),
    ('Software Engineering', 3, 1),
    ('Data Science', 3, 3);

-- ENROLLMENTS

INSERT INTO enrollment
    (student_id, course_id, enrollment_date, status)
VALUES
    (1, 2, '2026-10-06', 'active'),
    (1, 3, '2026-10-06', 'active'),
    (2, 2, '2026-10-06', 'completed'),
    (2, 4, '2026-10-06', 'active'),
    (3, 2, '2026-10-06', 'active'),
    (3, 5, '2026-10-06', 'completed'),
    (4, 3, '2026-10-06', 'active'),
    (5, 5, '2026-10-06', 'active');

-- CHECK DATA

SELECT * FROM student
ORDER BY student_id;

SELECT * FROM course
ORDER BY course_id;

SELECT * FROM enrollment
ORDER BY enrollment_id;