-- CREATE DATABASE subquery;

-- CREATE TABLE IF NOT EXISTS products (
--     product_id int GENERATED ALWAYS AS IDENTITY,
--     product_name varchar(100),
--     price int not NULL,
--     PRIMARY KEY(product_id)
-- );

-- CREATE TABLE IF NOT EXISTS categories (
--     category_id int GENERATED ALWAYS AS IDENTITY,
--     category_name varchar(100) NOT NULL,
--     PRIMARY KEY(category_id)
-- );

-- CREATE TABLE IF NOT EXISTS products_categories (
--     category_id INT NOT NULL,
--     product_id INT NOT NULL,
--     PRIMARY KEY(category_id, product_id),
--     FOREIGN KEY(category_id) REFERENCES categories(category_id),
--     FOREIGN KEY(product_id) REFERENCES products(product_id)
-- );

-- INSERT INTO products (product_name, price) VALUES
-- ('Notebook', 1000),
-- ('Headset', 50),
-- ('Tablet', 300);

-- INSERT INTO categories (category_name) VALUES
-- ('Portable'),
-- ('Handheld'),
-- ('Peripheral'),
-- ('Electronic');

-- INSERT INTO products_categories(product_id, category_id) VALUES
-- (1,1),
-- (1,4),
-- (2,3),
-- (3,3),
-- (4,4),
-- (4,1),
-- (5,3),
-- (6,4),
-- (6,2);

select * from products;
select * from categories;
select * from products_categories;

select MAX(price) from products;
select AVG(price) from products;

WITH maximum_price AS (
    select MAX(price) AS "max" from products
)
select p.product_name, p.price 
from products p, maximum_price mp
where p.price = mp.max;

select product_name, price from products
where price < (select AVG(price) from products);

SELECT p1.product_name, p1.price, c1.category_name
FROM products p1
JOIN products_categories pc1 ON p1.product_id = pc1.product_id
JOIN categories c1 ON pc1.category_id = c1.category_id;

SELECT AVG(p.price) AS "average", c.category_name
FROM products p
JOIN products_categories pc ON p.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.category_id
GROUP BY c.category_name;

-- Subquery
EXPLAIN ANALYZE
SELECT p1.product_name, p1.price, string_agg(c1.category_name, ', ' ) AS "categories"
FROM products p1
JOIN products_categories pc1 ON p1.product_id = pc1.product_id
JOIN categories c1 ON pc1.category_id = c1.category_id
WHERE p1.price >= ANY (
    SELECT AVG(p.price)
    FROM products p
    JOIN products_categories pc ON p.product_id = pc.product_id
    WHERE pc.category_id = pc1.category_id
)
GROUP BY p1.product_name, p1.price;

-- CTE
EXPLAIN ANALYZE 
WITH average_price_per_category AS (
    SELECT AVG(p.price) AS "avg", pc.category_id
    FROM products p
    JOIN products_categories pc ON p.product_id = pc.product_id
    GROUP BY pc.category_id
)
SELECT p1.product_name, p1.price, string_agg(c1.category_name, ', ' ) AS "categories"
FROM products p1
JOIN products_categories pc1 ON p1.product_id = pc1.product_id
JOIN categories c1 ON pc1.category_id = c1.category_id
WHERE p1.price >= ANY (
    select "avg" from average_price_per_category apc
    WHERE apc.category_id = pc1.category_id
)
GROUP BY p1.product_name, p1.price;