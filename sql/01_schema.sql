CREATE DATABASE IF NOT EXISTS analyst_retail_practice;
USE analyst_retail_practice;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE customers (
 customer_id INT PRIMARY KEY, customer_name VARCHAR(100), email VARCHAR(150), signup_date DATE,
 customer_segment VARCHAR(30), customer_tier VARCHAR(20), city VARCHAR(80), state VARCHAR(80), region VARCHAR(30)
);
CREATE TABLE products (
 product_id INT PRIMARY KEY, product_name VARCHAR(150), category VARCHAR(80), brand VARCHAR(80),
 unit_cost DECIMAL(12,2), unit_price DECIMAL(12,2), product_status VARCHAR(30)
);
CREATE TABLE stores (
 store_id INT PRIMARY KEY, store_name VARCHAR(80), city VARCHAR(80), state VARCHAR(80), region VARCHAR(30),
 store_type VARCHAR(40), store_tier VARCHAR(30)
);
CREATE TABLE employees (
 employee_id INT PRIMARY KEY, employee_name VARCHAR(100), store_id INT, department VARCHAR(50), hire_date DATE,
 FOREIGN KEY(store_id) REFERENCES stores(store_id)
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY, customer_id INT, store_id INT, employee_id INT, order_date DATE,
 order_status VARCHAR(30), sales_channel VARCHAR(40), campaign VARCHAR(60),
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
 FOREIGN KEY(store_id) REFERENCES stores(store_id),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE order_items (
 order_id INT, line_no INT, product_id INT, quantity INT, unit_price DECIMAL(12,2), discount_pct DECIMAL(5,2),
 PRIMARY KEY(order_id,line_no), FOREIGN KEY(order_id) REFERENCES orders(order_id),
 FOREIGN KEY(product_id) REFERENCES products(product_id)
);
CREATE TABLE payments (
 order_id INT PRIMARY KEY, payment_method VARCHAR(40), payment_status VARCHAR(30), payment_date DATE,
 FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
CREATE TABLE returns (
 order_id INT PRIMARY KEY, return_date DATE, return_reason VARCHAR(80), return_type VARCHAR(30),
 FOREIGN KEY(order_id) REFERENCES orders(order_id)
);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_orders_store ON orders(store_id);
CREATE INDEX idx_items_product ON order_items(product_id);
CREATE INDEX idx_customers_signup ON customers(signup_date);

