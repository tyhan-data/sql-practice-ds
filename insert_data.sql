-- ==============================
-- Departments Table Insert
-- ==============================
INSERT INTO departments (department_id, department_name) VALUES
(1, 'CSE'),
(2, 'EEE'),
(3, 'BBA'),
(4, 'CST'),
(5, 'ENT'),
(6, 'MECH'),
(7, 'LAW'),
(8, 'MED');

-- ==============================
-- Students Table Insert
-- ==============================
INSERT INTO students (student_id, name, age, department_id, marks) VALUES
(1, 'Rahim', 21, 1, 85),
(2, 'Karim', 22, 2, 72),
(3, 'Ayesha', 20, 1, 90),
(4, 'Nabila', 23, 3, 65),
(5, 'Hasan', 21, 2, 78),
(6, 'Tyhan', 19, 4, 98),
(7, 'Sadia', 22, 1, 55),
(8, 'Imran', 20, 3, 60),
(9, 'Rafi', 21, 4, 30),
(10, 'Mitu', 22, 2, 85),
(11, 'Jony', 23, NULL, 64),      -- student without department
(12, 'Sohana', 20, 5, 88),
(13, 'Farhan', 21, 5, 77),
(14, 'Tanvir', 22, 6, 81),
(15, 'Rina', 19, 6, 69),
(16, 'Shamim', 23, 7, 91),
(17, 'Anika', 20, 7, 85),
(18, 'Kamal', 21, 8, 74),
(19, 'Mina', 22, 8, 62),
(20, 'Jahid', 20, NULL, 50);     -- another student without department


