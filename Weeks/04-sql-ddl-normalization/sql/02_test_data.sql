-- Week 4: Valid sample data
-- Run sql/01_schema.sql first.

INSERT INTO programme (programme_name) VALUES
    ('Computer Science'),
    ('Data Science');

INSERT INTO instructor (instructor_name) VALUES
    ('Dr. Ada Lovelace'),
    ('Prof. Alan Turing'),
    ('Dr. Grace Hopper');

INSERT INTO student (name, surname, email, programme_id) VALUES
    ('Cleon', 'Sequeira', 'cleon.sequeira@example.com', 1),
    ('Maya', 'Schmidt', 'maya.schmidt@example.com', 1),
    ('Noah', 'Fischer', 'noah.fischer@example.com', 2),
    ('Lina', 'Weber', 'lina.weber@example.com', 2);

INSERT INTO course (title, credits, instructor_id) VALUES
    ('Database Fundamentals', 6, 1),
    ('Programming Principles', 5, 2),
    ('Data Modeling', 4, 3);

INSERT INTO enrollment (student_id, course_id, enrollment_date, status) VALUES
    (1, 1, DATE '2026-09-01', 'active'),
    (1, 2, DATE '2026-09-01', 'active'),
    (2, 1, DATE '2026-09-02', 'active'),
    (2, 3, DATE '2026-09-02', 'completed'),
    (3, 2, DATE '2026-09-03', 'active'),
    (4, 3, DATE '2026-09-04', 'active');

-- Optional: inspect the inserted data.
SELECT * FROM programme ORDER BY programme_id;
SELECT * FROM instructor ORDER BY instructor_id;
SELECT * FROM student ORDER BY student_id;
SELECT * FROM course ORDER BY course_id;
SELECT * FROM enrollment ORDER BY enrollment_id;

-- Invalid constraint tests are documented in README.md.
-- Run them individually, not as part of this valid-data script.
