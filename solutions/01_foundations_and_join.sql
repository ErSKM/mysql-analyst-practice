--  1.Return the first 20 customers with customer_id, name, city, state, and signup_date

SELECT customer_id,customer_name, city, state, signup_date FROM analyst_retail_practice.customers
limit 20;

-- 2. Find all products in Electronics.

SELECT product_name FROM analyst_retail_practice.products
where category = 'Electronics';

-- 3. Find products with unit_price between 500 and 1000.

SELECT product_name FROM analyst_retail_practice.products
where unit_price between 500 and 1000;

-- 4. Count customers by state.

SELECT Count(customer_id) as Customers,State FROM analyst_retail_practice.customers
group by state;

-- 5. Count orders by status.

SELECT order_status,Count(order_status) as Count FROM analyst_retail_practice.orders
group by order_status;

-- 6. Calculate average product price by category.

SELECT category,avg(unit_price) as Avg_price FROM analyst_retail_practice.products
group by category;

-- 7. Find categories whose average price is above 500.

SELECT category,avg(unit_price) as Avg_price FROM analyst_retail_practice.products
group by category
having Avg_price > 500;

-- 8. Calculate total quantity sold for each product.

SELECT p.product_name,sum(o.quantity) as Quantities_Sold 
FROM analyst_retail_practice.products p
left join analyst_retail_practice.order_items o 
on p.product_id = o.product_id
group by p.product_id,p.product_name;





-- 11. Join orders to customers and show order_id, date, customer_name, city, region.

SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    c.city,
    c.region
FROM analyst_retail_practice.orders o
JOIN analyst_retail_practice.customers c
    ON o.customer_id = c.customer_id;

