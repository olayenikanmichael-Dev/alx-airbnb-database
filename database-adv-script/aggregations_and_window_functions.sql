--Aggregation Query: Count total bookings per user--

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM users
LEFT JOIN bookings 
    ON users.id = bookings.user_id
GROUP BY users.id, users.name
ORDER BY total_bookings DESC;


--Window Function Query: Rank properties by booking count--


SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings 
    ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name
ORDER BY booking_rank;




--Window Function Query — Rank Properties by Bookings--


SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings 
    ON properties.id = bookings.property_id
GROUP BY properties.id, properties.name
ORDER BY booking_rank;


