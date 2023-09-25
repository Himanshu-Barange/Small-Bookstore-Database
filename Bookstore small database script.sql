CREATE DATABASE Online_Bookstore;

USE Online_Bookstore;

CREATE TABLE books(
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(25) NOT NULL,
author_id INT,
genre VARCHAR(50),
publication_date DATE,
price DECIMAL(5,2));

SELECT * FROM books;

CREATE TABLE authors(
author_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
birthdate DATE,
nationality VARCHAR(50)
);

SELECT * FROM authors;

CREATE TABLE customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
address VARCHAR(255),
city VARCHAR(100),
country VARCHAR(100),
phone VARCHAR(20)
);

SELECT * FROM customers;

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
total_amount DECIMAL(10, 2),
status VARCHAR(50) DEFAULT 'Pending',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM orders;

CREATE TABLE order_details(
order_id INT,
book_id INT,
quantity INT NOT NULL,
price DECIMAL(10, 2) NOT NULL,
PRIMARY KEY (order_id, book_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (book_id) REFERENCES books(book_id) 
);

SELECT * FROM order_details;

SHOW TABLES FROM Online_Bookstore; # peeking all the columns for reassurance

SELECT * FROM books; # seeing column names for putting into the INSERT INTO statement

INSERT INTO books(title, author_id, genre, publication_date, price)
VALUES
('The Great Gatsby', 1, 'Novel', '1925-04-10', 10.99),
('Moby Dick', 2, 'Novel', '1851-10-18', 12.99),
('To Kill a Mockingbird', 3, 'Novel', '1960-07-11', 8.99),
('1984', 4, 'Dystopian', '1949-06-08', 9.99),
('Pride and Prejudice', 5, 'Novel', '1813-01-28', 7.99),
('The Hobbit', 6, 'Fantasy', '1937-09-21', 11.99),
('Brave New World', 7, 'Dystopian', '1932-09-01', 10.49),
('The Catcher in the Rye', 8, 'Novel', '1951-07-16', 8.49),
('War and Peace', 9, 'Historical Novel', '1869-01-01', 14.99),
('The Odyssey', 10, 'Epic', '800-01-01', 13.99);

SELECT * FROM authors;

INSERT INTO authors(name, birthdate, nationality)
values
('F. Scott Fitzgerald', '1896-09-24', 'American'),
('Herman Melville', '1819-08-01', 'American'),
('Harper Lee', '1926-04-28', 'American'),
('George Orwell', '1903-06-25', 'British'),
('Jane Austen', '1775-12-16', 'British'),
('J.R.R. Tolkien', '1892-01-03', 'British'),
('Aldous Huxley', '1894-07-26', 'British'),
('J.D. Salinger', '1919-01-01', 'American'),
('Leo Tolstoy', '1828-09-09', 'Russian'),
('Homer', NULL, 'Ancient Greek');

SELECT * FROM authors; # reassuring all are well put in place

SELECT * FROM customers; # for seeing column names to put into the INSERT INTO statement

INSERT INTO customers(first_name, last_name, email, address, city, country, phone)
values
('John', 'Doe', 'john.doe@example.com', '123 Main St', 'Springfield', 'USA', '+1234567890'),
('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St', 'Shelbyville', 'USA', '+0987654321'),
('Alice', 'Johnson', 'alice.johnson@example.com', '789 Maple Ave', 'Rivertown', 'Canada', '+1122334455'),
('Bob', 'Martin', 'bob.martin@example.com', '101 Pine Rd', 'Lakeside', 'UK', '+4412345678'),
('Charlie', 'Brown', 'charlie.brown@example.com', '202 Oak Ln', 'Peanuts', 'Australia', '+6123456789'),
('Diana', 'Ross', 'diana.ross@example.com', '303 Cedar St', 'Motown', 'USA', '+1230987654'),
('Edward', 'Norton', 'edward.norton@example.com', '404 Birch Blvd', 'Hollywood', 'USA', '+1098765432'),
('Fiona', 'Apple', 'fiona.apple@example.com', '505 Cherry Ct', 'Musicville', 'UK', '+4423456789'),
('George', 'Lucas', 'george.lucas@example.com', '606 Star Way', 'Skywalker', 'USA', '+1212345678'),
('Helen', 'Mirren', 'helen.mirren@example.com', '707 Queen Rd', 'Oscarville', 'UK', '+4434567890');

SELECT * FROM customers; # reassuring

SELECT * FROM orders;

INSERT INTO orders(customer_id, order_date, total_amount, status)
values
(1, '2023-09-20', 20.98, 'Shipped'),
(2, '2023-09-21', 15.99, 'Pending'),
(3, '2023-09-22', 25.98, 'Shipped'),
(4, '2023-09-23', 18.49, 'Shipped'),
(5, '2023-09-24', 30.97, 'Pending'),
(6, '2023-09-25', 22.49, 'Shipped'),
(7, '2023-09-26', 28.98, 'Pending'),
(8, '2023-09-27', 24.99, 'Shipped'),
(9, '2023-09-28', 19.99, 'Pending'),
(10, '2023-09-29', 23.49, 'Shipped');

select * from orders; # reassuring

select * from order_details;

INSERT INTO order_details(order_id, book_id, quantity, price)
VALUES
(1, 1, 1, 10.99),
(1, 2, 1, 9.99),
(2, 3, 1, 15.99),
(3, 4, 2, 9.99),
(3, 5, 1, 7.99),
(4, 6, 1, 11.99),
(4, 7, 1, 10.49),
(5, 8, 1, 8.49),
(5, 9, 1, 14.99),
(6, 10, 1, 13.99),
(6, 1, 1, 10.99),
(7, 2, 1, 9.99),
(7, 3, 1, 15.99),
(8, 4, 1, 9.99),
(8, 5, 1, 7.99),
(9, 6, 1, 11.99),
(9, 7, 1, 10.49),
(10, 8, 1, 8.49),
(10, 9, 1, 14.99);

SELECT * FROM order_details;

SHOW tables; 		# get a list of all the tables in the active database

select * from information_schema.columns
where table_schema = 'Online_Bookstore';		# seeing all information about columns in this database

select table_name, column_name, column_type, column_key
from information_schema.columns
where table_schema = 'Online_Bookstore'; 		# getting selecting information about columns in the database

DESCRIBE books;		# getting detailed information about the books table

SELECT * from books where price > 10; 	# all books costing more than 10 dollars

select * from books where publication_date < '1900-01-01' and price < 5;		# all books published in 1800s and costing less than 5 dollars

select b.title, a.name 
from books b
join authors a on b.author_id = a.author_id;	# book names and corresponding author names

SELECT b.title, o.order_date		# titles of books order by customer John Doe and order date
from books b
JOIN order_details od ON b.book_id = od.book_id
JOIN orders o ON od.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.first_name = 'John' AND c.last_name = 'Doe';

SELECT COUNT(*) FROM books;		# number of books in the books table

SELECT SUM(od.price * od.quantity)		# total amount spent by customer John Doe
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details od ON o.order_id = od.order_id
WHERE c.first_name = 'John' AND c.last_name = 'Doe';

SELECT title, price		# books in descreasing order of price
FROM books
ORDER BY price DESC;

SELECT title, genre, price		# books by genre in a-z order and price in largest to smallest order within each genre
FROM books
ORDER BY genre ASC, price DESC;

SELECT DISTINCT genre FROM books;		# list of genres available in the store

SELECT title FROM books WHERE title LIKE 'The%';		# books containing 'The' in the title

SELECT MIN(price) AS cheapest_price FROM books; 	# cheapest price for a book

SELECT MAX(price) AS highest_price FROM books;		# highest price for a book

SELECT AVG(price) AS average_price FROM books; 		# average price for books

SELECT genre, COUNT(*)
FROM books
GROUP BY genre;			-- number of books in each genre

SELECT genre, COUNT(*) AS Number_of_books
FROM books
GROUP BY genre
HAVING COUNT(*) > 2;

SELECT b.title, a.name
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id; 		# all books and authors even if a books doesn't have a author

SELECT c.first_name, c.last_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id; 		# all customers and their order even if a customer hasn't placed any orders

SELECT SUM(total_amount) AS Total_Earnings		# total amount earned from orders
FROM orders;	

SELECT title
FROM books
WHERE price < 10
UNION
SELECT title
FROM books
WHERE publication_date < '1900-01-01';		# titles of books cheaper than 10$ and published before 1900s

