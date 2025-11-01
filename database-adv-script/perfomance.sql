
-- STEP 1: INITIAL COMPLEX QUERY (Unoptimized)


-- Retrieve all bookings along with user details, property details, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
ORDER BY b.start_date DESC;


-- ============================================================
-- STEP 2: OPTIMIZED QUERY (Refactored for Performance)
-- ============================================================

-- Use SELECT only for needed columns
-- Leverage proper indexes and avoid redundant joins

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
LEFT JOIN users u ON b.user_id = u.id
LEFT JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date DESC;
