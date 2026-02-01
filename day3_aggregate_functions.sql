-- 🔹 DAY 3 — Aggregate Functions & GROUP BY
-- Practice Questions

USE ds_sql_practice;

--------------------------------------------------
-- Q1. Find the total number of students
--------------------------------------------------
SELECT COUNT(*) AS total_students
FROM students;

--------------------------------------------------
-- Q2. Find the average marks
--------------------------------------------------
SELECT AVG(marks) AS average_marks
FROM students;

--------------------------------------------------
-- Q3. Find the highest marks
--------------------------------------------------
SELECT MAX(marks) AS highest_mark
FROM students;

--------------------------------------------------
-- Q4. Find the lowest marks
--------------------------------------------------
SELECT MIN(marks) AS lowest_mark
FROM students;

--------------------------------------------------
-- Q5. Find department-wise average marks
--------------------------------------------------
SELECT
    D.department_name,
    AVG(S.marks) AS average_marks
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name;

--------------------------------------------------
-- Q6. Find department-wise total number of students
--------------------------------------------------
SELECT
    D.department_name,
    COUNT(S.student_id) AS total_students
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name;
------------------------------------------------
-- Q6.Show departments with maximum total marks.
------------------------------------------------
SELECT 
     D.department_name,
     SUM(S.marks) AS maximum_total_marks
FROM departments D 
JOIN students S 
     ON D.department_id = S.department_id
GROUP BY department_name
ORDER BY maximum_total_marks DESC
LIMIT 1 ;

--------------------------------------------------
-- Q7. Show departments where average marks are greater than 70
--------------------------------------------------
SELECT
    D.department_name,
    AVG(S.marks) AS average_marks
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name
HAVING AVG(S.marks) > 70;

----------------------------------------------------
-- Q8. Find department-wise highest and lowest marks.
----------------------------------------------------
SELECT
    D.department_name,
    MAX(S.marks) AS highest_marks,
    MIN(S.marks) As lowest_marks
FROM departments D
JOIN students S
    ON D.department_id = S.department_id
GROUP BY D.department_name;

--------------------------------------------------------------
-- Q9. Show department-wise average marks along with department ID.
--------------------------------------------------------------
SELECT 
    D.department_id,
    D.department_name,
    AVG(S.marks) AS avg_marks
FROM departments D 
JOIN students S 
    ON D.department_id = S.department_id
GROUP BY 
    D.department_id, 
    D.department_name;
    
-------------------------------------------------
-- Q10.Find departments with more than 3 students.
--------------------------------------------------
SELECT 
    D.department_name,
    COUNT(S.student_id) AS total_student
FROM departments D 
JOIN students S 
    ON D.department_id = S.department_id
GROUP BY D.department_name
HAVING COUNT(S.student_id) > 3;
-------------------------------------------------------------
-- Q11.Show students whose marks improved if grace +5 is applied.
-------------------------------------------------------------
SELECT
     name,
     marks AS original_marks,
     marks + 5 AS after_updating_marks
FROM students
WHERE marks < 60
	  AND marks + 5 >= 60;
