CREATE DATABASE Onlinebookstore;
USE Onlinebookstore;
DROP DATABASE Onlinebookstore;

CREATE TABLE Books(
Book_id INT PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(90),
Published_year INT,
Price NUMERIC(10, 2),
Stock int
);
CREATE TABLE Customers(
Customer_id INT PRIMARY KEY,
Name VARCHAR(40),
Email VARCHAR(45),
Phone VARCHAR(10),
City VARCHAR(30),
Country VARCHAR(68)
);

CREATE TABLE Orders(
Order_id INT PRIMARY KEY,
Customer_id INT REFERENCES Customers(customer_id),
Book_id INT REFERENCES Books(Book_id),
Order_date DATE ,
Quantity INT,
Total_amount NUMERIC (10, 2)
);
SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders;
SELECT Author FROM BOOKS;

-- BASIC QUESTIONS:
-- 1) Retrieve all books in the "fiction" genre:
SELECT * FROM books WHERE Genre = "fiction";
-- 2) Find books published after the year 1950:
SELECT * FROM Books WHERE published_year > 1950;
-- 3) list all the customers from the canada:
SELECT * FROM Customers where country = "canada";
-- 4) show orders placed in november 2023:
SELECT * FROM ORDERS 
where Order_date BETWEEN "2023-11-01" AND "2023-11-30";
-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS TOTAL_STOCK FROM Books;
-- 6) find the details of the most expensive books:
SELECT * FROM Books ORDER BY price LIMIT 1;
-- 7) Show all the customers who ordered more than 1 quantity of book:
SELECT * FROM ORDERS WHERE Quantity > 1;
-- 8) retrieve all the orders where the total amount exceeds $20:
SELECT * FROM Orders WHERE TOTAL_amount > 20;
-- 9) list all the genre available in the books table:
SELECT DISTINCT genre FROM Books;
-- 10) find the book with the lowest stock:
SELECT * FROM books ORDER BY stock LIMIT 1;
-- 11) calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS REVENUE FROM Orders;

-- ADVANCED QUESTIONS:
-- 1) Retrieve the total number of books sold for each genre:
SELECT b.genre, SUM(O.quantity) AS TOTAL_books
FROM books b 
JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.genre;
-- 2) find the average price of the books in the 'fantasy' genre:
SELECT AVG(price) AS Average_price
FROM books
WHERE genre = "fantasy";
-- 3) lsit the customers who have placed at least 2 orders;
SELECT customer_id, COUNT(order_id) AS order_count
FROM Orders 
GROUP BY customer_id
HAVING  COUNT(order_id) >= 2;
-- 4) find the most frequently ordered books;
SELECT book_id , COUNT(order_id) AS Order_count
FROM ORDERS
GROUP BY book_id
ORDER BY Order_count DESC LIMIT 1;
-- 5) show most top 3 expensive books of 'fantasy' genre;
SELECT * FROM books
WHERE genre = "fantasy"
ORDER BY price DESC LIMIT 3;
-- 6) retrieve the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Total_books_sold
FROM orders o
JOIN books b
ON o.book_id = b.book_id
GROUP BY b.author;
-- 7) list the cities where customers spent over $30 are located;
SELECT  DISTINCT c.city , Total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.order_id
WHERE o.total_amount > 30;
-- 8) find the customer who spent the most on orders
SELECT c.customer_id, c.name ,SUM(o.total_amount) AS Total_spent
FROM Customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;
-- 9) calculate the stock remaining after fulfilling all orders
SELECT b.stock,b.book_id,b.title
FROM books b
LEFT JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id;