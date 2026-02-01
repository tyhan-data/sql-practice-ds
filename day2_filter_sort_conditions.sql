-- ==============================
-- DAY 2 — Filtering, Sorting & Conditions
-- Dataset: students(student_id, name, marks, age, department_id), departments(department_id, department_name)
-- ==============================

USE ds_sql_practice;

-- Q1. Show unique department names
SELECT DISTINCT department_name 
FROM departments;

-- Q2. Show students ordered by marks descending
SELECT name, marks 
FROM students
ORDER BY marks DESC;

-- Q3. Show students ordered by name descending
SELECT name
FROM students
ORDER BY name DESC;

-- Q4. Show top 5 students ordered by marks ascending
SELECT name, marks
FROM students
ORDER BY marks ASC
LIMIT 5;

-- Q5. Students from CSE department AND marks > 75
SELECT S.name, S.marks, D.department_name
FROM students S
JOIN departments D
  ON S.department_id = D.department_id
WHERE D.department_name = 'CSE'
  AND S.marks > 75;

-- Q6. Students from EEE department OR marks > 85
SELECT S.name, S.marks, D.department_name
FROM students S
JOIN departments D
  ON S.department_id = D.department_id
WHERE D.department_name = 'EEE'
   OR S.marks > 85;

-- Q7. Students from CSE or EEE department
SELECT S.name, D.department_name
FROM students S
JOIN departments D
  ON S.department_id = D.department_id
WHERE D.department_name IN ('CSE', 'EEE');

-- Q8. Students with marks between 60 and 90
SELECT name, marks
FROM students
WHERE marks BETWEEN 60 AND 90;

-- Q9. Students with marks >= 70 and < 90
SELECT name, marks
FROM students
WHERE marks >= 70
  AND marks < 90;

-- Q10. Students whose names end with 'n'
SELECT name
FROM students
WHERE name LIKE '%n';

-- Q11. Students whose marks are not equal to 60
SELECT name, marks
FROM students
WHERE marks <> 60;

-- Q12. Students whose marks are NULL
SELECT name, marks
FROM students
WHERE marks IS NULL;

-- Q13. Students whose marks are 70, 75, or 80
SELECT name, marks
FROM students
WHERE marks IN (70, 75, 80);

-- Q14. Students whose department_id is 1 or 3
SELECT S.name, D.department_id
FROM students S
JOIN departments D
  ON S.department_id = D.department_id
WHERE D.department_id IN (1, 3);
