# Small-Bookstore-Database-MySQL

- This database is about a small bookstore.
- It is made small for practicising and showcasing essentials features of the SQL luanguage (MySQL variant).

- The database has 5 tables.
- Each table has 10 rows.

  # ER Layout

Entities:
- Books (book_id, title, author_id, genre, publication_date, price)
- Authors (author_id, name, birthdate, nationality)
- Customers (customer_id, first_name, last_name, email, address, city, country, phone)
- Orders (order_id, customer_id, order_date, total_amount, status)
- Order_details (order_id, book_id, quantity, price)

Relationships:
- One author can write many books.
- One customer can place many orders.
- One order can contain many books.

Cardinalities:
- One-to-many relationship between authors and books.
- One-to-many relationship between customers and orders.
- Many-to-many relationship between orders and books.
