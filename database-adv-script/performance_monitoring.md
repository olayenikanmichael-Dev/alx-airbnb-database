-- ============================================================
-- STEP 1: ANALYZE FREQUENTLY USED QUERIES
-- ============================================================

-- Example 1: Retrieve user bookings with property details
EXPLAIN ANALYZE

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    p.name AS property_name,
    b.start_date,
    b.end_date
FROM users u
JOIN bookings b ON u.id = b.user_id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01'
AND p.city = 'Lagos'
ORDER BY b.start_date DESC;

-- Example 2: Calculate total revenue per property
EXPLAIN ANALYZE
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    SUM(pay.amount) AS total_revenue
FROM properties p
JOIN bookings b ON p.id = b.property_id
JOIN payments pay ON b.id = pay.booking_id
WHERE pay.status = 'completed'
GROUP BY p.id, p.name
ORDER BY total_revenue DESC;

-- Example 3: Identify top 5 active users by number of bookings
EXPLAIN ANALYZE
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC
LIMIT 5;

-- ============================================================
-- STEP 2: IDENTIFY BOTTLENECKS
-- ============================================================
-- After running EXPLAIN ANALYZE, look for:
--   - Sequential scans on large tables
--   - Costly sorting or grouping operations
--   - Repeated full joins
--   - Missing indexes on WHERE or JOIN columns

-- Example: Sequential scan on bookings(property_id)
-- Suggests creating an index on bookings.property_id

-- ============================================================
-- STEP 3: IMPLEMENT OPTIMIZATIONS
-- ============================================================

-- Add indexes to reduce scan cost
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_properties_city ON properties (city);
CREATE INDEX idx_payments_status ON payments (status);

-- Optional: Schema adjustment (denormalization)
-- Add total_bookings column in users table for quick access
-- ALTER TABLE users ADD COLUMN total_bookings INT DEFAULT 0;

-- ============================================================
-- STEP 4: RE-RUN MONITORING AFTER CHANGES
-- ============================================================

EXPLAIN ANALYZE
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC
LIMIT 5;
