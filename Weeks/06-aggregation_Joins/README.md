# Week 6 – Aggregation, Joins & Advanced Querying

## 1. Objective

This lab continues the CourseHub database developed during Weeks 2–5.

The objective is to practice SQL aggregation, GROUP BY, HAVING, INNER JOIN, LEFT JOIN, subqueries, CTEs, and debugging.

## 2. Database Used

I used the CourseHub database developed in the previous practical labs.

The database contains five main tables:

- STUDENT
- PROGRAMME
- INSTRUCTOR
- COURSE
- ENROLLMENT

The queries are based on my own CourseHub dataset, so results may differ from the reference dataset containing 20 students, 20 courses, and 30 enrollments.

## 3. Database Relationships

The relationship between STUDENT and COURSE is many-to-many.

The ENROLLMENT table connects them:

STUDENT → ENROLLMENT → COURSE

Each enrollment contains student_id and course_id as foreign keys.

Other relationships include:

- PROGRAMME → STUDENT
- INSTRUCTOR → COURSE

The optional phone column in STUDENT can contain NULL.

## 4. Aggregation

### COUNT(*) vs COUNT(phone)

COUNT(*) counts all student rows, including students whose phone number is NULL.

COUNT(phone) counts only rows where the phone number is not NULL.

Therefore, the results can differ.

### WHERE vs HAVING

WHERE filters individual rows before grouping.

HAVING filters groups after aggregation.

For example, HAVING COUNT(*) >= 2 selects courses with at least two matching enrollments.

## 5. JOIN Strategies

### INNER JOIN

INNER JOIN returns only rows with matching values in both tables.

For example, it connects enrollments with their students and courses.

### LEFT JOIN

LEFT JOIN returns every row from the left table, even if there is no matching row in the right table.

For example, it can show courses that have zero enrollments.

### Why is the status condition in ON?

In the active-enrollment query, the condition status = 'active' is placed in the ON clause.

This preserves courses that have no active enrollments.

If the condition were placed in WHERE, those courses would be excluded.

## 6. Subqueries and CTEs

IN identifies students with completed enrollments.

EXISTS identifies students with active enrollments.

A CTE created using WITH makes an intermediate query result available to the main SELECT statement.

## 7. Debugging Insights

One important debugging lesson is that aggregate functions such as COUNT(*) cannot be used directly in WHERE to filter groups.

HAVING must be used instead.

Another lesson is that JOIN conditions must use the correct foreign keys.

## 8. SQL Files

- `sql/01_aggregates.sql` – Aggregation, GROUP BY and HAVING.
- `sql/02_joins.sql` – INNER JOIN and LEFT JOIN.
- `sql/03_subqueries_ctes.sql` – IN, EXISTS and CTE.
- `sql/04_debugging.sql` – Corrected SQL queries.

## 9. Conclusion

Week 6 builds on the previous CourseHub labs by introducing advanced SQL retrieval techniques.

Aggregation summarizes data, joins combine related tables, and subqueries and CTEs help answer more complex questions.