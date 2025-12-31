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

SELECT id, title, created_at, updated_at
FROM posts
-- WHERE extract(minute FROM created_at) < 25 
-- AND extract(minute FROM created_at) <= 30
-- WHERE NOT user_id=4 AND NOT user_id=6
WHERE NOT user_id IN (4,6)
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
FROM users
WHERE name NOT LIKE '_akh%';
-- WHERE name LIKE '%a%';
-- WHERE name LIKE 'a%';
-- WHERE name LIKE '%a';
-- WHERE name LIKE '_a_';
-- WHERE name LIKE '_a';
-- WHERE name LIKE 'a_';