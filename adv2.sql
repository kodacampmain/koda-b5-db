-- CREATE TABLE iF NOT EXISTS sales (
--     product_id int REFERENCES products(id),
--     sales_amount int not null
-- );

SELECT * FROM products;

-- INSERT INTO sales (product_id, sales_amount)
-- VALUES
-- (1,100),
-- (2,200),
-- (1,300);

select * from sales;

WITH total_sales_per_product AS (
    SELECT SUM(sales_amount) AS "total", product_id
    FROM sales
    GROUP BY product_id
)
SELECT product_id, total
FROM total_sales_per_product
WHERE total > 200;

-- WHERE lower(product_name) = lower('keyboard')

CREATE TABLE IF NOT EXISTS employees (
    employee_id int generated always as identity primary key,
    name varchar(255) not null,
    manager_id int REFERENCES employees(employee_id)
);

INSERT INTO employees (name, manager_id) VALUES
('Alice', NULL),
('Bob', 1),
('Charlie', 2);

SELECT * FROM employees;

SELECT e.name AS "Employee", e2.name AS "Manager"
FROM employees e
LEFT JOIN employees e2 ON e.manager_id = e2.employee_id;