# goit-rdb-hw-04

Homework for Topic 4: DDL, DML and complex SQL queries.

### Overview
This project demonstrates:
- database schema design using DDL
- data insertion using DML
- complex multi-table queries using JOIN

### Tasks created

### Task 1 — DDL
Created database `LibraryManagement` with tables:
- authors
- genres
- books
- users
- borrowed_books

Defined primary and foreign keys.

### Task 2 — DML
Inserted test data into all tables with соблюдение referential integrity.

### Task 3 — Complex JOIN
Built a multi-table INNER JOIN query for the Northwind dataset:
- order_details
- orders
- customers
- products
- categories
- employees
- shippers
- suppliers

Validated result using COUNT (expected ~518 rows).

### Repository structure
- `queries.sql` — all SQL scripts
- `screenshots/` — execution results
- `README.md` — project description

### Task 4.1 — COUNT
Result: 518

### Explanation:
COUNT(*) shows total number of rows returned by INNER JOIN across all tables.
This value is used as baseline for comparing LEFT/RIGHT JOIN behavior.

### Task 4.2 — LEFT JOIN
Result: 518 rows (same as INNER JOIN)

### Explanation:
LEFT JOIN did not change the number of rows because all records have matching values in joined tables.
No NULL values appeared after LEFT JOIN.

### Task 4.2 — RIGHT JOIN

Result: 518 rows (same as INNER JOIN)

### Explanation:
RIGHT JOIN did not change the number of rows, which means that all records in the orders table have corresponding records in order_details.
No orphan records exist in the joined tables.

### Task 4.3 — Filter by employee_id

Result: 317 rows

### Explanation:
The WHERE clause filters records where employee_id is greater than 3 and less than or equal to 10.
This reduces the dataset to only orders handled by selected employees.
