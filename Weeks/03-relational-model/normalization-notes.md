# Week 3 – Normalization Notes

## 1. Original Table

The following table combines student, course, instructor, and department information.

| student_id | student_name | course_id | course_name | instructor_name | department_name |
|---|---|---|---|---|---|
| 1 | Anna Keller | 101 | Databases | Dr. Meyer | Computer Science |
| 1 | Anna Keller | 102 | Programming | Prof. Rossi | Computer Science |
| 2 | David Smith | 101 | Databases | Dr. Meyer | Computer Science |
| 3 | Maria Lopez | 101 | Databases | Dr. Meyer | Computer Science |

## 2. Redundancy Problems

### Problem 1 – Repeated Student Information

Anna Keller appears more than once because she is enrolled in multiple courses.

If her name changes, multiple rows may need to be updated.

### Problem 2 – Repeated Course Information

The course Databases and its instructor Dr. Meyer appear repeatedly.

If the course name changes, multiple rows may need to be updated.

### Problem 3 – Update Inconsistency

If the instructor name is changed in only one row, the same course could have different instructor names.

This creates inconsistent data.

### Problem 4 – Deletion Problem

If the only student enrolled in a course is deleted, the course information could also be lost if everything is stored in one table.

## 3. Better Relational Structure

### STUDENT

| student_id | first_name | second_name |
|---|---|---|
| 1 | Anna | Keller |
| 2 | David | Smith |
| 3 | Maria | Lopez |

### DEPARTMENT

| department_id | department_name |
|---|---|
| 1 | Computer Science |

### INSTRUCTOR

| instructor_id | instructor_name | department_id |
|---|---|---|
| 1 | Dr. Meyer | 1 |
| 2 | Prof. Rossi | 1 |

### COURSE

| course_id | course_name | instructor_id | department_id |
|---|---|---|---|
| 101 | Databases | 1 | 1 |
| 102 | Programming | 2 | 1 |

### ENROLLMENT

| enrollment_id | student_id | course_id |
|---|---|---|
| 1 | 1 | 101 |
| 2 | 1 | 102 |
| 3 | 2 | 101 |
| 4 | 3 | 101 |

## 4. Explanation

Separating STUDENT, COURSE, INSTRUCTOR, DEPARTMENT, and ENROLLMENT reduces repeated information.

Student details are stored in STUDENT.

Instructor details are stored in INSTRUCTOR.

Department information is stored in DEPARTMENT.

Course details are stored in COURSE.

ENROLLMENT connects students and courses using foreign keys.

This structure reduces redundancy and makes updates easier.