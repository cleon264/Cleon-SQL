# Normalization Analysis — COURSE_ENROLLMENT_REPORT

## Original relation

```text
COURSE_ENROLLMENT_REPORT(
    student_id,
    student_name,
    student_email,
    programme_id,
    programme_name,
    course_id,
    course_title,
    credits,
    instructor_id,
    instructor_name,
    enrollment_date,
    enrollment_status
)
```

The assumed logical key is `(student_id, course_id)`.

Functional dependencies:

```text
student_id                  → student_name, student_email, programme_id
programme_id                → programme_name
course_id                   → course_title, credits, instructor_id
instructor_id               → instructor_name
(student_id, course_id)     → enrollment_date, enrollment_status
```

## C1 — Problems and anomalies

### 1. Repeated facts

- A student's name, email, and programme are repeated for every course in which the student is enrolled.
- A programme name is repeated for every student in that programme and for every enrollment row belonging to those students.
- Course title, credits, and instructor are repeated for every student enrolled in that course.
- Instructor name is repeated wherever the instructor's course appears.
- Enrollment date and status are specific to the student-course relationship.

### 2. Update anomaly

If an instructor's name changes, every row for courses taught by that instructor may need to be updated. If one row is missed, the report contains inconsistent instructor names.

### 3. Insertion anomaly

A new course cannot easily be recorded unless at least one student is enrolled, because the relation's logical key requires both a student and a course. This can prevent storing course information independently.

### 4. Deletion anomaly

If the only student enrolled in a course is deleted from the relation, the course's title, credits, and instructor information may also be lost.

## C2 — First Normal Form (1NF)

Under the stated assumptions, the relation can be considered in 1NF if every attribute value is atomic (one value per cell) and each row represents one student-course enrollment. The attributes shown are single-valued in this interpretation.

If `course_id` contains a value such as `"101,102,103"` in one cell, it stores a list of course identifiers rather than one atomic value. That violates 1NF and makes individual course relationships difficult to reference and constrain. Each course should instead be represented by a separate enrollment row.

## C3 — Second Normal Form (2NF)

The composite key is `(student_id, course_id)`.

### Attributes dependent only on `student_id`

```text
student_name, student_email, programme_id
```

### Attributes dependent only on `course_id`

```text
course_title, credits, instructor_id
```

### Attributes dependent on the complete key

```text
enrollment_date, enrollment_status
```

`programme_name` is determined by `programme_id`, and `instructor_name` is determined by `instructor_id`; they are therefore indirectly associated with the student or course through those dependencies.

The original relation has partial dependencies because student facts depend only on `student_id` and course facts depend only on `course_id`, each of which is only part of the composite key. These dependencies violate 2NF (assuming the listed non-key attributes are non-prime). A 2NF decomposition separates student facts, course facts, and enrollment facts.

## C4 — Third Normal Form (3NF)

There are transitive dependencies:

```text
student_id → programme_id → programme_name
course_id  → instructor_id → instructor_name
```

`programme_name` describes a programme, not an individual enrollment. It should be stored in `PROGRAMME`, with `programme_id` referenced by `STUDENT`.

`instructor_name` describes an instructor, not an individual course enrollment. It should be stored in `INSTRUCTOR`, with `instructor_id` referenced by `COURSE`.

Keeping these names in the enrollment relation repeats facts and can cause update, insertion, and deletion anomalies.

## Proposed normalized schema

```text
PROGRAMME(
    programme_id PK,
    programme_name UNIQUE NOT NULL
)

STUDENT(
    student_id PK,
    name NOT NULL,
    surname NOT NULL,
    email UNIQUE NOT NULL,
    programme_id FK NOT NULL
)

INSTRUCTOR(
    instructor_id PK,
    instructor_name NOT NULL
)

COURSE(
    course_id PK,
    title NOT NULL,
    credits CHECK (credits > 0 AND credits <= 30),
    instructor_id FK NOT NULL
)

ENROLLMENT(
    enrollment_id PK,
    student_id FK NOT NULL,
    course_id FK NOT NULL,
    enrollment_date NOT NULL,
    status CHECK (status IN ('active', 'completed', 'withdrawn')),
    UNIQUE (student_id, course_id)
)
```

The implementation is in `../sql/01_schema.sql`.

## Design assumptions

- Each student belongs to exactly one programme; therefore `student.programme_id` is required.
- Each course has exactly one instructor; therefore `course.instructor_id` is required. If a course can have multiple instructors, a separate course-instructor junction table would be appropriate.
- A student can enroll in a particular course only once, regardless of semester, because the lab specifies `(student_id, course_id)` as the logical key.
- Credits are whole numbers from 1 through 30.
- Enrollment status is limited to the three values specified in the lab.
