-- ==============================
-- DAY 5 — Subquery + CASE (Advanced Beginner)
-- Dataset: students(student_id, name, marks, department_id), departments(department_id, department_name)
-- ==============================

USE ds_sql_practice;

--------------------------------------------------
-- Q1. Show students whose marks are above the overall average
--------------------------------------------------
SELECT
    name,
    marks
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);

--------------------------------------------------
-- Q2. Show the student(s) with the highest marks
--------------------------------------------------
SELECT
    name,
    marks AS highest_marks
FROM students
WHERE marks = (
    SELECT MAX(marks)
    FROM students
);

--------------------------------------------------
-- Q3. Show department-wise highest and lowest scorer
--------------------------------------------------
SELECT
    D.department_name,
    MAX(S.marks) AS highest_scorer,
    MIN(S.marks) AS lowest_scorer
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name;

--------------------------------------------------
-- Q4. Create grades based on marks (A / B / C / Fail)
--------------------------------------------------
SELECT
    name,
    marks,
    CASE
        WHEN marks >= 80 THEN 'A'
        WHEN marks >= 70 THEN 'B'
        WHEN marks >= 60 THEN 'C'
        ELSE 'Fail'
    END AS grade
FROM students;

--------------------------------------------------
-- Q5. Show students whose marks are below their department’s average
--------------------------------------------------
SELECT
    S.name,
    S.marks,
    D.department_name
FROM students S
JOIN departments D
    ON S.department_id = D.department_id
WHERE S.marks < (
    SELECT AVG(S2.marks)
    FROM students S2
    WHERE S2.department_id = S.department_id
);

--------------------------------------------------
-- Q6. Find the second highest marks
--------------------------------------------------

-- Q6(a) Using Subquery
SELECT
    MAX(marks) AS second_highest_marks
FROM students
WHERE marks < (
    SELECT MAX(marks)
    FROM students
);

-- Q6(b) Using ORDER BY + LIMIT (MySQL / PostgreSQL style)
SELECT DISTINCT
    name,
    marks AS second_highest_marks
FROM students
ORDER BY marks DESC
LIMIT 1 OFFSET 1;

--------------------------------------------------
-- Q7. Show the department with the highest average marks
--------------------------------------------------
SELECT
    D.department_name,
    AVG(S.marks) AS avg_marks
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name
ORDER BY avg_marks DESC
LIMIT 1;

--------------------------------------------------
-- Q8. Show departments if two or more have the same highest average marks
--------------------------------------------------
SELECT
    D.department_name,
    AVG(S.marks) AS avg_marks
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name
HAVING AVG(S.marks) = (
    SELECT MAX(avg_marks)
    FROM (
        SELECT AVG(marks) AS avg_marks
        FROM students
        GROUP BY department_id
    ) t
);
