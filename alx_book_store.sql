CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE AUTHORS (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(215)
);

CREATE TABLE BOOKS (
  book_id INT PRIMARY KEY,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

CREATE TABLE CUSTOMERS (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(215),
  email VARCHAR(215),
  address TEXT
);

CREATE TABLE ORDERS (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

/* If your checker expects snake_case: */
CREATE TABLE ORDER_DETAILS (
  order_detail_id INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  CONSTRAINT fk_details_order
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  CONSTRAINT fk_details_book
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

/* If it literally expects the spaced identifier, quote it: */
/*
CREATE TABLE ORDER_DETAILS (
  `order detail id` INT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  CONSTRAINT fk_details_order
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  CONSTRAINT fk_details_book
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
*/
