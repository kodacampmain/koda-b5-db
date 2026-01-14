CREATE TABLE IF NOT EXISTS products (
    id int generated always as identity primary key,
    name varchar(100) not null,
    price int not null
);
CREATE TABLE IF NOT EXISTS sales (
    id int generated always as identity primary key,
    product_id int REFERENCES products(id),
    quantity int not null
);
INSERT INTO products(name, price) VALUES
('Laptop', 1000),
('Phone', 600),
('Tablet', 400);
INSERT INTO sales(product_id, quantity) VALUES
(1, 5),
(2, 10),
(3, 7),
(1, 3);