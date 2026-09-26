# Week 3 – Relational Model and Normalization

## Objective

This practical lab continues the Week 2 CourseHub ER model.

The objective is to transform the ER model into a relational schema, identify keys, understand referential integrity, and recognize redundancy problems.

## Main Entities

The relational schema contains five tables:

- STUDENT
- INSTRUCTOR
- COURSE
- ENROLLMENT
- DEPARTMENT

## Relationships

- Students enroll in courses through ENROLLMENT.
- Instructors teach courses.
- Departments contain courses.
- Departments have instructors.

## Relational Schema

See [relational-schema.md](relational-schema.md) for the complete schema, keys, foreign keys, and explanations.

## Normalization

The original table contains repeated student, course, instructor, and department information.

Separating the information into five tables reduces redundancy and helps prevent inconsistent updates.

See [normalization-notes.md](normalization-notes.md).

## PostgreSQL Implementation

The SQL files are:

- `sql/01_schema.sql` – Creates the tables and constraints.
- `sql/02_test_data.sql` – Inserts test data and tests an invalid foreign key.

## Foreign Key Test

The test attempts to insert an enrollment with student_id = 999.

PostgreSQL rejects the row because student 999 does not exist in the STUDENT table.

This demonstrates referential integrity.

## Conclusion

The Week 2 ER model has been converted into a relational schema.

Primary keys identify rows, foreign keys connect tables, and constraints help maintain data integrity.