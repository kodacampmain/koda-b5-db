CREATE TABLE users (
 id serial primary key,
 name varchar(100)
);

INSERT INTO users (name) VALUES ('fakhri');
INSERT INTO users (name) VALUES ('koda'), ('dako');

UPDATE users SET name='Fakhri' WHERE id=1;

DELETE FROM users WHERE id=2 OR id=3;

INSERT INTO users (name) VALUES ('dako');

DELETE FROM users WHERE id IN (1,5);

SELECT name, id
FROM users;

ALTER TABLE users
ADD UNIQUE(name);

CREATE TABLE posts (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO posts (title, content, user_id) VALUES 
('my judul', 'my content 1', 4), 
('my judul', 'my content 2', 6), 
('my judul', 'my content 3', 8);

SELECT id, user_id, title
FROM posts
-- WHERE extract(minute FROM created_at) < 25 
-- AND extract(minute FROM created_at) <= 30
-- WHERE NOT user_id=4 AND NOT user_id=6
-- WHERE NOT user_id IN (4,6)
-- ORDER BY user_id DESC
-- LIMIT 5
OFFSET 0;

ALTER TABLE posts
ADD COLUMN created_at TIMESTAMP DEFAULT NOW();
ALTER TABLE posts
ADD COLUMN updated_at TIMESTAMP;

UPDATE posts SET title='my title', updated_at=NOW()
WHERE id=1;

SELECT name AS "Nama", id
FROM users;
-- WHERE name NOT LIKE '_akh%';
-- WHERE name LIKE '%a%';
-- WHERE name LIKE 'a%';
-- WHERE name LIKE '%a';
-- WHERE name LIKE '_a_';
-- WHERE name LIKE '_a';
-- WHERE name LIKE 'a_';

SELECT p.id, u.name, p.title
FROM posts p
JOIN users u ON p.user_id = u.id;

insert into users(name) values ('virgil'), ('rohman'), ('bian'), ('al');
# Agregasi
SELECT u.id, u.name AS "Username", count(p.id) AS "Number of Posts"
FROM posts p
JOIN users u ON p.user_id = u.id
-- WHERE p.title = 'my judul'
GROUP BY u.name, u.id
HAVING count(p.id) >= 1
ORDER BY "Number of Posts" DESC;

-- DB MARKET
CREATE TABLE products (
    id serial PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INT
);
ALTER TABLE products
ADD COLUMN supplier_id int;
CREATE TABLE categories (
    id serial PRIMARY KEY,
    category_name VARCHAR(100)
);
CREATE TABLE suppliers (
    id serial PRIMARY KEY,
    supplier_name VARCHAR(255),
    address VARCHAR(255)
);

SELECT p.id, p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.id
JOIN suppliers s ON p.supplier_id = s.id
ORDER BY p.id ASC
LIMIT 20;
-- WHERE c.category_name IS NULL;

-- SEQUENCE MANIPULATION FUNCTION
SELECT setval('categories_id_seq',20);

UPDATE products SET supplier_id=products.id;