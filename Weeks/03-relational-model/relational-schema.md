# Week 3 – Relational Schema

## Based on Week 2 – CourseHub ER Model

This relational schema continues the Week 2 ER model.

The five main entities are STUDENT, INSTRUCTOR, COURSE, ENROLLMENT, and DEPARTMENT.

## 1. STUDENT

STUDENT(
    student_id PK,
    first_name,
    second_name,
    email
)

- Primary Key: student_id
- Candidate Key: email
- Foreign Keys: None

## 2. INSTRUCTOR

INSTRUCTOR(
    instructor_id PK,
    instructor_name,
    department_id FK → DEPARTMENT.department_id
)

- Primary Key: instructor_id
- Foreign Keys:
  - department_id references DEPARTMENT.department_id

## 3. DEPARTMENT

DEPARTMENT(
    department_id PK,
    department_name
)

- Primary Key: department_id
- Foreign Keys: None

## 4. COURSE

COURSE(
    course_id PK,
    course_name,
    department_id FK → DEPARTMENT.department_id,
    instructor_id FK → INSTRUCTOR.instructor_id
)

- Primary Key: course_id
- Foreign Keys:
  - department_id references DEPARTMENT.department_id
  - instructor_id references INSTRUCTOR.instructor_id

## 5. ENROLLMENT

ENROLLMENT(
    enrollment_id PK,
    student_id FK → STUDENT.student_id,
    course_id FK → COURSE.course_id,
    enrollment_date,
    enrollment_status
)

- Primary Key: enrollment_id
- Foreign Keys:
  - student_id references STUDENT.student_id
  - course_id references COURSE.course_id

- Unique Constraint: (student_id, course_id)

# Activity 1 – Mapping the ER Model

## 1. Which attributes uniquely identify rows?

- STUDENT: student_id
- INSTRUCTOR: instructor_id
- DEPARTMENT: department_id
- COURSE: course_id
- ENROLLMENT: enrollment_id

The email attribute in STUDENT is also unique and can serve as a candidate key.

## 2. Which attributes reference another table?

- INSTRUCTOR.department_id references DEPARTMENT.department_id.
- COURSE.department_id references DEPARTMENT.department_id.
- COURSE.instructor_id references INSTRUCTOR.instructor_id.
- ENROLLMENT.student_id references STUDENT.student_id.
- ENROLLMENT.course_id references COURSE.course_id.

## 3. Why are student_id and course_id stored in ENROLLMENT?

They connect students and courses.

A student can enroll in multiple courses, and a course can have multiple students.

The ENROLLMENT table resolves this many-to-many relationship.

## 4. What happens if ENROLLMENT contains a student_id that does not exist in STUDENT?

The foreign key constraint rejects the row because the referenced student does not exist.

# Activity 2 – Keys and Referential Integrity

## Primary Keys

- STUDENT: student_id
- INSTRUCTOR: instructor_id
- DEPARTMENT: department_id
- COURSE: course_id
- ENROLLMENT: enrollment_id

## Candidate Keys

- STUDENT: student_id, email
- INSTRUCTOR: instructor_id
- DEPARTMENT: department_id
- COURSE: course_id
- ENROLLMENT: enrollment_id

## Foreign Keys

- INSTRUCTOR.department_id → DEPARTMENT.department_id
- COURSE.department_id → DEPARTMENT.department_id
- COURSE.instructor_id → INSTRUCTOR.instructor_id
- ENROLLMENT.student_id → STUDENT.student_id
- ENROLLMENT.course_id → COURSE.course_id

## Difference Between Primary Key and Candidate Key

A candidate key is a minimal attribute or combination of attributes that uniquely identifies a row.

A primary key is the candidate key selected to identify each row in a table.

## Referential Integrity

Referential integrity prevents a table from referencing a row that does not exist in another table.

For example, an enrollment cannot reference a student who is not stored in STUDENT.