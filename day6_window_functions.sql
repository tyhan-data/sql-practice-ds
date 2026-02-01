-- ==============================
-- Window Functions Practice – Q1 to Q9
-- Dataset: students(student_id, name, department_id, marks)
-- ==============================

-- Q1. Row Number
-- Assign a row number to each student within their department,
-- ordered by marks from highest to lowest.
SELECT
    name,
    department_id,
    marks,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY marks DESC
    ) AS row_numbers
FROM students;


-- Q2. Rank
-- Rank students within each department based on marks (highest first).
-- Students with the same marks receive the same rank.
SELECT
    name,
    department_id,
    marks,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY marks DESC
    ) AS rank_in_dept
FROM students;


-- Q3. Dense Rank
-- Assign a dense rank to students within each department based on marks.
-- Dense rank does not skip numbers when there are ties.
SELECT
    name,
    department_id,
    marks,
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY marks DESC
    ) AS dense_rank_in_dept
FROM students;


-- Q4. Department Average (Window Function)
-- Show each student’s marks along with their department’s average marks.
SELECT
    name,
    marks,
    AVG(marks) OVER (
        PARTITION BY department_id
    ) AS dept_avg_marks
FROM students;


-- Q5. Top 2 Students per Department
-- Find the top 2 students in each department based on marks.
-- Include all students tied in the top 2 ranks.
SELECT
    name,
    department_id,
    marks
FROM (
    SELECT
        name,
        department_id,
        marks,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY marks DESC
        ) AS dept_rank
    FROM students
) ranked_students
WHERE dept_rank <= 2;


-- Q6. Cumulative Marks
-- Calculate the cumulative sum of marks for students within each department,
-- ordered by marks from lowest to highest.
SELECT
    name,
    department_id,
    marks,
    SUM(marks) OVER (
        PARTITION BY department_id
        ORDER BY marks ASC
    ) AS cumulative_marks
FROM students;


-- Q7. Difference from Department Average
-- Show student marks, department average, and difference.
SELECT
    name,
    marks,
    AVG(marks) OVER (
        PARTITION BY department_id
    ) AS dept_avg_marks,
    marks - AVG(marks) OVER (
        PARTITION BY department_id
    ) AS difference
FROM students;


-- Q8. Highest Scorer per Department
-- Find the student(s) with the highest marks in each department.
-- Include all tied students.
SELECT
    name,
    department_id,
    marks
FROM (
    SELECT
        name,
        department_id,
        marks,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY marks DESC
        ) AS dept_rank
    FROM students
) t
WHERE dept_rank = 1;


-- Q9. Second Highest Marks per Department
-- Find the student(s) with the second highest marks in each department.
-- Departments with fewer than 2 distinct marks are automatically excluded.
SELECT
    name,
    department_id,
    marks
FROM (
    SELECT
        name,
        department_id,
        marks,
        DENSE_RANK() OVER (
            PARTITION BY department_id
            ORDER BY marks DESC
        ) AS dept_rank
    FROM students
) t
WHERE dept_rank = 2;
