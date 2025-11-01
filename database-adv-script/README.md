
##  Overview
This file contains SQL queries demonstrating the use of different types of **JOIN** operations — `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.  
These queries are based on tables commonly found in a booking system, such as **Users**, **Bookings**, **Properties**, and **Reviews**.



##  Table Relationships
- **Users**: Contains information about users registered on the platform.  
- **Bookings**: Stores booking details made by users for properties.  
- **Properties**: Lists available properties that users can book.  
- **Reviews**: Contains feedback and ratings for properties.

---

## 🔍 SQL Queries

### 1. INNER JOIN
Retrieves all bookings and the respective users who made those bookings.

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings



INNER JOIN users 
    ON bookings.user_id = users.id;


    # SQL Subqueries 

##  Overview part TWO 
This file demonstrates how to use both **correlated** and **non-correlated subqueries** in SQL.  
Subqueries help you perform advanced filtering and analysis by embedding one query inside another.

---

##  Database Context
The examples are based on a simple **property booking system** with the following tables:

- **Users** – stores user information.  
- **Properties** – lists available properties.  
- **Bookings** – tracks property bookings made by users.  
- **Reviews** – stores property ratings and comments.

---

##  Sample Table Structures

sql
-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Properties table
CREATE TABLE properties (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Bookings table
CREATE TABLE bookings (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Reviews table
CREATE TABLE reviews (
    id INT PRIMARY KEY,
    property_id INT,
    rating DECIMAL(2,1),
    comment TEXT,
    FOREIGN KEY (property_id) REFERENCES properties(id)
);


