
---

## 📝 Tables

### 1. Departments Table
| Column          | Type        | Notes                       |
|-----------------|------------|-----------------------------|
| department_id    | INT        | Primary Key, Auto Increment |
| department_name  | VARCHAR(100) | Unique, Not NULL           |

### 2. Students Table
| Column         | Type        | Notes                                     |
|----------------|------------|-------------------------------------------|
| student_id      | INT        | Primary Key, Auto Increment               |
| name            | VARCHAR(100)| Not NULL                                 |
| age             | INT        |                                           |
| department_id   | INT        | Foreign Key → departments(department_id) |
| marks           | INT        | Not NULL, between 0–100                   |

---

## 📌 Topics Covered

**Day 1 — Basic SELECT & WHERE**
- Selecting columns, `*`
- Filtering rows with `WHERE`
- Using `LIKE`, `BETWEEN`, `IN`, `NOT IN`

**Day 2 — Filtering, Sorting & Conditions**
- `DISTINCT`, `ORDER BY`, `LIMIT`
- AND, OR conditions
- Sorting by multiple columns

**Day 3 — Aggregate Functions**
- `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`
- `GROUP BY` and `HAVING` clauses

**Day 4 — JOIN Practice**
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Department-wise analysis
- Handling missing data (`NULL` values)

**Day 5 — Subqueries & CASE Statements**
- Subqueries in `WHERE` and `SELECT`
- Conditional columns using `CASE WHEN`
- Top-N queries using subqueries

**Day 6 — Window Functions & Advanced Analytics**
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- Cumulative sum (`SUM() OVER`), running average (`AVG() OVER`)
- `LAG()` and `LEAD()` functions
- Percentile rank with `PERCENT_RANK()`
- Difference from department average

---

## 🚀 How to Run

1. Clone the repository:
```bash
https://github.com/tyhan-data/sql-practice-ds.git



