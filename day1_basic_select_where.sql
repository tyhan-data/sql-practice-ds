-- ==============================
-- DAY 1 — Basic SELECT & WHERE (Beginner)
-- Dataset: students(student_id, name, marks, age, department_id), departments(department_id, department_name) 
-- ==============================

USE ds_sql_practice;

-- 1. Show all data from the students table
SELECT * 
FROM students;

-- 2. Show unique marks from students
SELECT DISTINCT marks
FROM students;

-- 3. Show only name and marks from students
SELECT name, marks
FROM students;

-- 4. Show students whose marks are greater than 60
SELECT name, marks
FROM students
WHERE marks > 60;

-- 5. Show students whose names start with 'A'
SELECT name
FROM students
WHERE name LIKE 'A%';

-- 6. Show only name and department name
SELECT S.name, D.department_name
FROM students S
JOIN departments D  
  ON S.department_id = D.department_id;

-- 7. Show students whose marks are greater than 70
SELECT name, marks
FROM students
WHERE marks > 70;

-- 8. Show students whose department is 'CSE'
SELECT S.name, D.department_name
FROM students S
JOIN departments D 
  ON S.department_id = D.department_id
WHERE D.department_name = 'CSE';

-- 9. Show students whose age is NOT 20
SELECT name, age
FROM students
WHERE age <> 20;

-- 10. Show students whose marks are between 50 and 80
SELECT name, marks
FROM students
WHERE marks BETWEEN 50 AND 80;

-- 11. Show only the first 3 students
SELECT * 
FROM students
LIMIT 3;

-- 12. Count the number of students in the table
SELECT COUNT(*)
FROM students;

-- 13. Sort students by marks in descending order
SELECT name, marks
FROM students
ORDER BY marks DESC;

-- 14. Show students whose names do not contain 'a'
SELECT name
FROM students
WHERE name NOT LIKE '%a%';
