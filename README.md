# goit-rdb-hw-04

Homework for Topic 4: DDL, DML and complex SQL queries.

### Overview
This project demonstrates:
- database schema design using DDL
- data insertion using DML
- complex multi-table queries using JOIN

### Tasks created

## Task 1 — DDL
Created database `LibraryManagement` with tables:
- authors
- genres
- books
- users
- borrowed_books

Defined primary and foreign keys.

## Task 2 — DML
Inserted test data into all tables with соблюдение referential integrity.

## Task 3 — Complex JOIN
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

## Task 4.1 — COUNT
Result: 518

### Explanation:
COUNT(*) shows total number of rows returned by INNER JOIN across all tables.
This value is used as baseline for comparing LEFT/RIGHT JOIN behavior.

## Task 4.2 — LEFT JOIN
Result: 518 rows (same as INNER JOIN)

### Explanation:
LEFT JOIN did not change the number of rows because all records have matching values in joined tables.
No NULL values appeared after LEFT JOIN.

## Task 4.2 — RIGHT JOIN

Result: 518 rows (same as INNER JOIN)

### Explanation:
RIGHT JOIN did not change the number of rows, which means that all records in the orders table have corresponding records in order_details.
No orphan records exist in the joined tables.

## Task 4.3 — Filter by employee_id

Result: 317 rows

### Explanation:
The WHERE clause filters records to include only orders handled by employees with IDs between 4 and 10.
This reduces the dataset size while preserving join integrity.
The filtering is applied after JOIN operations, ensuring correct dataset restriction.

## Task 4.4 — GROUP BY category_name

### Explanation:
Data is grouped by category name.
COUNT(*) returns the number of records per category.
AVG(order_details.quantity) calculates the average quantity of products within each category.

## Task 4.5 — GROUP BY and AVG

### Result:
Aggregated data by category with total number of orders and average quantity.

### Explanation:
The query groups records by category name and calculates:
- total number of rows per category (COUNT)
- average product quantity (AVG)

HAVING is used to filter groups where the average quantity is greater than 21.

## Task 4.6 — ORDER BY

### Result:
Rows are sorted in descending order based on the number of records in each category.

### Explanation:
ORDER BY COUNT(*) DESC ensures that categories with the highest number of records appear first.

## Task 4.7 — LIMIT and OFFSET

### Result:
Displayed 4 rows after skipping the first one.

### Explanation:
OFFSET 1 skips the first row, and LIMIT 4 returns the next four rows.
This is used for pagination of query results.
