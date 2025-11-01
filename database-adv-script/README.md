
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

