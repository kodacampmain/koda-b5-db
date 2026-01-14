-- CREATE TABLE iF NOT EXISTS sales (
--     product_id int REFERENCES products(id),
--     sales_amount int not null
-- );

SELECT * FROM products;

INSERT INTO sales (product_id, sales_amount)
VALUES
(1,100),
(2,200),
(1,300);

select * from sales;

WITH total_sales_per_product AS (
    SELECT SUM(sales_amount) AS "total", product_id
    FROM sales
    GROUP BY product_id
)
SELECT product_id, total
FROM total_sales_per_product;