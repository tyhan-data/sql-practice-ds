-- ==============================
-- DAY 4 — JOIN Practice (Real-life)
-- Dataset: students(student_id, name, marks, department_id), departments(department_id, department_name)
-- ==============================

USE ds_sql_practice;

--------------------------------------------------
-- Q1. Show student name with department name
--------------------------------------------------
SELECT
    S.name,
    D.department_name
FROM students S
JOIN departments D
    ON S.department_id = D.department_id;

--------------------------------------------------
-- Q2. Show only students from the CSE department
--------------------------------------------------
SELECT
    S.name,
    D.department_name
FROM students S
JOIN departments D
    ON S.department_id = D.department_id
WHERE D.department_name = 'CSE';

--------------------------------------------------
-- Q3. Prepare dataset with student + department features
-- Include all students and all departments (full outer join simulation)
--------------------------------------------------
SELECT 
    S.student_id,
    S.name,
    S.marks,
    S.department_id,
    D.department_name
FROM students S
LEFT JOIN departments D
    ON S.department_id = D.department_id

UNION 

SELECT 
    S.student_id,
    S.name,
    S.marks,
    S.department_id,
    D.department_name
FROM students S
RIGHT JOIN departments D
    ON S.department_id = D.department_id;

--------------------------------------------------
-- Q4. Show department-wise student count
--------------------------------------------------
SELECT
    D.department_name,
    COUNT(S.student_id) AS total_students
FROM departments D
LEFT JOIN students S
    ON S.department_id = D.department_id
GROUP BY D.department_name;

--------------------------------------------------
-- Q5. Show departments that have no students
--------------------------------------------------
SELECT
    D.department_name
FROM departments D
LEFT JOIN students S
    ON S.department_id = D.department_id
WHERE S.student_id IS NULL;

--------------------------------------------------
-- Q6. Find students whose department info is missing (data leakage check)
--------------------------------------------------
SELECT 
    S.student_id,
    S.name,
    S.department_id
FROM students S
LEFT JOIN departments D
    ON S.department_id = D.department_id
WHERE D.department_id IS NULL;

--------------------------------------------------
-- Q7. Find departments where all students passed (marks > 60)
--------------------------------------------------
SELECT
    D.department_name
FROM students S
JOIN departments D
    ON S.department_id = D.department_id
GROUP BY D.department_name
HAVING MIN(S.marks) > 60;

--------------------------------------------------
-- Q8. Find students whose department average is below overall average
--------------------------------------------------
SELECT 
    S.name,
    S.marks,
    D.department_name
FROM students S
JOIN departments D
    ON S.department_id = D.department_id
WHERE S.department_id IN (
    SELECT S.department_id
    FROM students S
    GROUP BY S.department_id
    HAVING AVG(S.marks) < (
        SELECT AVG(marks)
        FROM students
    )
);
