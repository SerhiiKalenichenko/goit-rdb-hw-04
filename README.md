# goit-rdb-hw-04

Homework for Topic 4: DDL, DML and complex SQL queries.

---

## Overview
This project demonstrates:
- database schema design using DDL
- data insertion using DML
- complex multi-table queries using JOIN
- data aggregation, filtering and sorting

---

## Task 1 — DDL

Created database `LibraryManagement` with the following tables:
- authors
- genres
- books
- users
- borrowed_books

Implemented:
- primary keys for all tables
- foreign key relationships:
  - books → authors, genres
  - borrowed_books → books, users

The schema ensures referential integrity and consistent data structure.

---

## Task 2 — DML

Inserted test data into all tables:
- at least one or two records per table
- all relationships are valid and consistent
- foreign keys correctly reference parent tables

---

## Task 3 — Complex JOIN

Executed a query combining all tables from the dataset:
- order_details
- orders
- customers
- products
- categories
- employees
- shippers
- suppliers

Used `INNER JOIN` with proper key relationships to retrieve a unified dataset.

---

## Task 4 — Analytical Queries

### 4.1 COUNT
Calculated total number of rows in the joined dataset using:
- `COUNT(*)`

---

### 4.2 LEFT JOIN / RIGHT JOIN

Replaced `INNER JOIN` with `LEFT JOIN` and `RIGHT JOIN`.

Result:
- number of rows remained unchanged

Reason:
- all records have matching relationships across tables
- additional rows are not introduced
- further `INNER JOIN` operations filter out unmatched records

---

### 4.3 Filtering

Filtered dataset using:
- `employee_id > 3 AND employee_id <= 10`

---

### 4.4 GROUP BY + Aggregation

Grouped results by category name:
- counted number of rows
- calculated average quantity (`AVG(order_details.quantity)`)

---

### 4.5 HAVING

Filtered grouped results:
- selected only categories where average quantity > 21

---

### 4.6 ORDER BY

Sorted results:
- by row count in descending order

---

### 4.7 LIMIT OFFSET

Selected subset of results:
- skipped first row
- returned next 4 rows

---

## Repository Structure

- `queries.sql` — all SQL queries for tasks 1–4
- `screenshots/` — execution results and queries
  - `p1_*` — DDL (database and tables)
  - `p2_*` — data insertion
  - `p3_*` — JOIN query
  - `p4_*` — analytical queries

---

## Conclusion

All tasks were completed according to the requirements:
- database schema created
- data inserted
- queries executed successfully
- results validated with screenshots

The solution is consistent, reproducible and ready for evaluation.

---

