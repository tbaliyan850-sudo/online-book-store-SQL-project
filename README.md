📚 Online Bookstore SQL Project

📌 Project Overview

The Online Bookstore SQL Project is a relational database project developed using MySQL and MySQL Workbench.

The project is designed to manage and analyze information related to customers, books, and orders. It contains three main tables:

- Customers
- Books
- Orders

SQL queries are used to retrieve useful information, analyze customer orders, calculate sales, and understand bookstore performance.

This project helped me improve my practical understanding of SQL, relational databases, aggregate functions, joins, grouping, filtering, and data analysis.

---

🎯 Project Objectives

The main objectives of this project are:

- To create and manage a relational database using MySQL.
- To store customer, book, and order-related information.
- To understand relationships between multiple tables.
- To practice SQL queries for data retrieval and analysis.
- To calculate total sales and book quantities.
- To analyze customer purchasing behavior.
- To identify book prices, stock details, and order information.
- To improve practical SQL and database management skills.

---

🛠️ Tools and Technologies Used

- Database: MySQL
- SQL Environment: MySQL Workbench
- Language: SQL
- Dataset: Online Bookstore Sample Dataset

---

🗂️ Database Structure

This project contains three tables:

1. Customers Table

The "customers" table stores information about customers.

Column Name| Description
customer_id| Unique ID of each customer
name| Name of the customer
email| Email address of the customer
phone| Phone number of the customer
city| City of the customer
country| Country of the customer

---

2. Books Table

The "books" table stores information about books available in the bookstore.

Column Name| Description
book_id| Unique ID of each book
title| Title of the book
author| Name of the author
genre| Genre or category of the book
publish_year| Year in which the book was published
price| Price of the book
stock| Available stock quantity

---

3. Orders Table

The "orders" table stores information about customer orders.

Column Name| Description
order_id| Unique ID of each order
customer_id| ID of the customer who placed the order
book_id| ID of the ordered book
order_date| Date on which the order was placed
quantity| Number of books ordered
total_amount| Total amount of the order

---

🔗 Relationship Between Tables

The tables are connected using common columns.

Customers and Orders

The "customer_id" column connects the "customers" table with the "orders" table.

One customer can place multiple orders.

Books and Orders

The "book_id" column connects the "books" table with the "orders" table.

One book can appear in multiple orders.

Relationship Diagram

Customers
    |
    | customer_id
    |
  Orders
    |
    | book_id
    |
  Books

---

📊 SQL Concepts Used

The following SQL concepts were used in this project:

- Database and table creation
- "CREATE DATABASE"
- "CREATE TABLE"
- "INSERT"
- "SELECT"
- "WHERE"
- "DISTINCT"
- "ORDER BY"
- "LIMIT"
- "IN"
- "BETWEEN"
- "AND"
- "OR"
- "NOT"
- Aggregate functions:
  - "SUM()"
  - "COUNT()"
  - "AVG()"
  - "MIN()"
  - "MAX()"
- "GROUP BY"
- "HAVING"
- Column aliases using "AS"
- "INNER JOIN"
- Subqueries
---

🔍 Sample SQL Queries

1. Find the Total Number of Orders

SELECT COUNT(*) AS total_orders
FROM orders;

This query counts the total number of records in the "orders" table.

---

2. Calculate Total Books Sold

SELECT SUM(quantity) AS total_books_sold
FROM orders;

This query calculates the total number of books sold by adding all values from the "quantity" column.

---

3. Calculate Total Sales Amount

SELECT SUM(total_amount) AS total_sales
FROM orders;

This query calculates the total sales amount generated from all orders.

---

4. Find the Most Expensive Book

SELECT title, price
FROM books
ORDER BY price DESC
LIMIT 1;

This query displays the book with the highest price.

---

5. Find the Cheapest Book

SELECT title, price
FROM books
ORDER BY price ASC
LIMIT 1;

This query displays the book with the lowest price.

---

6. Find Books from a Specific Genre

SELECT title, author, genre
FROM books
WHERE genre = 'Fiction';

This query retrieves books that belong to the Fiction genre.

---

7. Find Customers from a Specific City

SELECT name, email, city, country
FROM customers
WHERE city = 'Delhi';

This query retrieves customers who belong to Delhi.

---

8. Find Customers Who Placed at Least Two Orders

SELECT c.customer_id,
       c.name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;

This query identifies customers who have placed two or more orders.

---

9. Find Total Quantity of Books Sold by Each Author

SELECT b.author,
       SUM(o.quantity) AS total_books_sold
FROM books b
JOIN orders o
    ON b.book_id = o.book_id
GROUP BY b.author;

This query calculates the total number of books sold by each author.

---

10. Find Total Sales by Each Customer

SELECT c.customer_id,
       c.name,
       SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

This query calculates how much each customer has spent.

---

11. Find the Best-Selling Book

SELECT b.book_id,
       b.title,
       SUM(o.quantity) AS total_quantity_sold
FROM books b
JOIN orders o
    ON b.book_id = o.book_id
GROUP BY b.book_id, b.title
ORDER BY total_quantity_sold DESC
LIMIT 1;

This query identifies the book with the highest total quantity sold.

---

12. Find Books That Are Out of Stock

SELECT book_id,
       title,
       author,
       stock
FROM books
WHERE stock = 0;

This query displays books that are currently unavailable because their stock is zero.

---

13. Find Orders Above a Certain Amount

SELECT *
FROM orders
WHERE total_amount > 1000;

This query retrieves orders whose total amount is greater than 1000.

---

14. Display Recent Orders

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 10;

This query displays the latest 10 orders.

---

📈 Business Questions Answered

This project helps answer the following business questions:

- How many orders have been placed?
- What is the total sales amount?
- Which book is the most expensive?
- Which customers have placed multiple orders?
- Which customers have spent the most money?
- Which authors have the highest book sales?
- Which books are out of stock?
- What are the latest orders?
- Which orders have a high total amount?
---

💡 Key Learning Outcomes

Through this project, I learned:

- How to create and manage relational databases.
- How to work with multiple tables.
- How to use primary and foreign key relationships.
- How to write SQL queries for data analysis.
- How to use aggregate functions such as "SUM()" and "COUNT()".
- How to use "GROUP BY" and "HAVING".
- How to connect tables using "JOIN".
- How to filter, sort, and analyze data.
- How to answer business-related questions using SQL.
- How SQL can be used to support business decision-making.

---

🚀 Future Improvements

In the future, this project can be improved by:

- Creating a Power BI dashboard.
- Adding more book and customer records.
- Adding payment and delivery tables.
- Analyzing monthly and yearly sales trends.
- Creating customer segmentation.
- Identifying repeat customers.
- Analyzing low-stock and high-demand books.
- Using advanced SQL concepts such as:
  - Common Table Expressions
  - Window Functions
  - Ranking Functions
  - Advanced Subqueries

---

📁 Project Files

Online-Bookstore-SQL-Project/
│
├── README.md
├── database_creation.sql
├── table_creation.sql
├── data_insertion.sql
└── analysis_queries.sql

«Update the file names according to the actual files uploaded to your GitHub repository.»

---

👩‍💻 Author

Tanisha Baliyan

MBA Student | Business Analytics and Human Resource

Aspiring Data Analyst / Business Analyst

---

⭐ Conclusion

The Online Bookstore SQL Project demonstrates the practical use of SQL for managing relational data and performing business analysis.

The project focuses on customers, books, and orders and shows how SQL can be used to generate meaningful insights from structured data.
