Design Notes

1. Enrollment as an associative entity

Student and Course have a many-to-many relationship because one student can enroll in many courses and one course can contain many students. Therefore, Enrollment is used as an associative entity.

Enrollment also stores other informations such as enrollment date, status, and semester.

2. Course and Instructor

Each Course must have exactly one Instructor. An Instructor may teach zero or many Courses.

3. Course and Degree Programme

Each Course belongs to exactly one Degree Programme. A Degree Programme may contain zero or many Courses.

4. Course and Assignment

Each Assignment belongs to exactly one Course. A Course may have zero or many Assignments.

5. Submission

Submission is used to connect Students and Assignments. A student may submit many assignments, and an assignment may receive submissions from many students.

The Submission entity stores the grade received by the student for the assignment.

Assumptions

1. Each course has exactly one instructor.
2. Each course belongs to exactly one degree programme.
3. A course may initially have no assignments.
4. A student may enroll in zero or many courses.
5. A student receives one grade per assignment, as specified in the business requirements.
