CREATE DATABASE goit_rdb_hw_04;

USE goit_rdb_hw_04;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO authors (author_name)
VALUES ('George Orwell'), ('J.K. Rowling');

INSERT INTO genres (genre_name)
VALUES ('Dystopian'), ('Fantasy');

INSERT INTO users (username, email)
VALUES ('serhii', 'serhii@example.com'),
       ('anna', 'anna@example.com');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES 
('1984', 1949, 1, 1),
('Harry Potter', 1997, 2, 2);

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
(1, 1, '2024-01-01', '2024-01-10'),
(2, 2, '2024-02-01', '2024-02-15');

USE goit_rdb_hw_03;

SELECT
    od.order_id,
    od.product_id,
    od.quantity,
    o.customer_id,
    o.employee_id,
    o.shipper_id,
    o.date AS order_date,
    c.name AS customer_name,
    c.country AS customer_country,
    p.name AS product_name,
    p.unit,
    p.price,
    cat.name AS category_name,
    e.first_name,
    e.last_name,
    s.name AS shipper_name,
    sup.name AS supplier_name,
    sup.country AS supplier_country
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS s
    ON o.shipper_id = s.id
INNER JOIN suppliers AS sup
    ON p.supplier_id = sup.id;

-- Task 4.1 COUNT
SELECT COUNT(*) AS total_rows
FROM order_details AS od
INNER JOIN orders AS o
    ON od.order_id = o.id
INNER JOIN customers AS c
    ON o.customer_id = c.id
INNER JOIN products AS p
    ON od.product_id = p.id
INNER JOIN categories AS cat
    ON p.category_id = cat.id
INNER JOIN employees AS e
    ON o.employee_id = e.employee_id
INNER JOIN shippers AS s
    ON o.shipper_id = s.id
INNER JOIN suppliers AS sup
    ON p.supplier_id = sup.id;

-- Task 4.2 LEFT JOIN

SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
LEFT JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;

-- Task 4.2 RIGHT JOIN

SELECT COUNT(*) AS total_rows
FROM order_details od
RIGHT JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;

-- Task 4.3 FILTER

SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
WHERE e.employee_id > 3 AND e.employee_id <= 10;

-- Task 4.4 GROUP BY
SELECT 
    cat.name AS category_name,
    COUNT(*) AS total_orders,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers s ON o.shipper_id = s.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
WHERE e.employee_id > 3 AND e.employee_id <= 10
GROUP BY cat.name;
