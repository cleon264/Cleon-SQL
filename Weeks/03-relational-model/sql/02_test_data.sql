```sql

INSERT INTO department (department_name)
VALUES
    ('Computer Science'),
    ('Business');

INSERT INTO student (first_name, second_name, email)
VALUES
    ('Anna', 'Keller', 'anna@example.com'),
    ('David', 'Smith', 'david@example.com'),
    ('Maria', 'Lopez', 'maria@example.com');

INSERT INTO instructor (instructor_name, department_id)
VALUES
    ('Dr. Meyer', 1),
    ('Prof. Rossi', 1);

INSERT INTO course (course_name, department_id, instructor_id)
VALUES
    ('Databases', 1, 1),
    ('Programming', 1, 2);

INSERT INTO enrollment (
    student_id,
    course_id,
    enrollment_date,
    enrollment_status
)
VALUES
    (1, 1, '2026-09-22', 'active'),
    (1, 2, '2026-09-22', 'active'),
    (2, 1, '2026-09-22', 'active'),
    (3, 1, '2026-09-22', 'active');

INSERT INTO enrollment (
    student_id,
    course_id,
    enrollment_date,
    enrollment_status
)
VALUES
    (999, 1, '2026-09-22', 'active');

```