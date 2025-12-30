CREATE TABLE users (
 id serial primary key,
 name varchar(100)
);

INSERT INTO users (name) VALUES ('fakhri');
INSERT INTO users (name) VALUES ('koda'), ('dako');

UPDATE users SET name='Fakhri' WHERE id=1;

DELETE FROM users WHERE id=2 OR id=3;

INSERT INTO users (name) VALUES ('koda'), ('dako');

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

INSERT INTO posts (title, content, user_id)
VALUES ('my judul', 'my content', 6);

SELECT id, title, content, user_id
FROM posts;