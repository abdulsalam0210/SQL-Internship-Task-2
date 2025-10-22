-- task2_insertion.sql
-- Task 2: Data Insertion and Handling NULLs
-- Author: Abdul Salam (alexabdul413@gmail.com)

USE ecommerce;

-- 1️ INSERTING DATA INTO USERS
INSERT INTO users (username, email, password_hash, first_name, last_name)
VALUES 
 ('john_doe', 'john@example.com', 'hash123', 'John', 'Doe'),
 ('mary_smith', 'mary@example.com', 'hash456', 'Mary', 'Smith'),
 ('peter_jones', NULL, 'hash789', 'Peter', 'Jones');  -- Example with NULL email

-- 2️ INSERTING INTO CATEGORIES
INSERT INTO categories (name) VALUES 
 ('Electronics'), ('Books'), ('Home Appliances');

-- 3️ INSERTING PRODUCTS WITH SOME NULL VALUES
INSERT INTO products (sku, name, description, price, category_id, stock_qty)
VALUES
 ('ELEC101', 'Smartphone Z', 'Latest model smartphone', 599.99, 1, 20),
 ('BOOK201', 'SQL Basics', 'Beginner SQL guide', 15.99, 2, 100),
 ('HOME301', 'Vacuum Cleaner', 'Powerful 1600W cleaner', NULL, 3, 15);  -- NULL price

-- 4️ UPDATE EXAMPLES
UPDATE products
SET price = 549.99
WHERE sku = 'ELEC101';

UPDATE users
SET email = 'peter.jones@example.com'
WHERE username = 'peter_jones' AND email IS NULL;

-- 5️ DELETE EXAMPLE
DELETE FROM products
WHERE stock_qty = 0;

-- 6️ INSERT USING SELECT (Copying data dynamically)
INSERT INTO payments (order_id, payment_method, paid_amount)
SELECT order_id, 'Card', total_amount
FROM orders
WHERE total_amount > 0;

-- 7️ NULL HANDLING EXAMPLE
SELECT user_id, username, email
FROM users
WHERE email IS NULL;

-- 8️ TRANSACTION AND ROLLBACK DEMONSTRATION
START TRANSACTION;
DELETE FROM orders WHERE order_status = 'Cancelled';
ROLLBACK;

-- ✅ End of Task 2 Script
