-- Q1) Display all columns and all rows from the posts table

SELECT * FROM posts;

-- Q2) Show the post titles along with the corresponding author’s name

SELECT a.title, b.name AS author_name
FROM posts a
JOIN users b ON a.author_id = b.id;

-- Q3) Insert a new row into the posts table with "My new value for user 2" values for author_id = 2

INSERT INTO posts (title, slug, body, author_id)
VALUES ('My new value for user 2', 'my-new-value-user2', 'This is a new post for user 2', 2);

-- Q4) Change the title of the post with id = 1 to 'Updated First Post'

UPDATE posts SET title = 'Updated First Post' WHERE id = 1;

-- Q5) Find the number of posts written by each author

SELECT a.name AS author_name, COUNT(b.id) AS total_posts
FROM users a
LEFT JOIN posts b ON a.id = b.author_id
GROUP BY a.id, a.name;

-- Q6) Display the newest posts first

SELECT * FROM posts ORDER BY created_at DESC;

-- Q7) Display the newest two (02) posts

SELECT * FROM posts ORDER BY created_at DESC LIMIT 2;

-- Q8) Show only those posts that have comments

SELECT DISTINCT a.*
FROM posts a
JOIN comments b ON a.id = b.post_id;

-- Q9) Display multiple tags of a single post as comma-separated values

SELECT a.title, GROUP_CONCAT(c.name ORDER BY c.name SEPARATOR ', ') AS tags
FROM posts a
JOIN post_tag b ON a.id = b.post_id
JOIN tags c ON b.tag_id = c.id
GROUP BY a.id, a.title;