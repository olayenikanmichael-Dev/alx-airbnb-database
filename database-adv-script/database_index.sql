-- ================================================
-- DATABASE INDEXING FOR PERFORMANCE OPTIMIZATION
-- ================================================

-- 1. Create index on user_id in bookings table
-- Used frequently in JOIN and WHERE clauses
CREATE INDEX idx_bookings_user_id
ON bookings (user_id);

-- 2. Create index on property_id in bookings table
-- Improves queries joining bookings and properties
CREATE INDEX idx_bookings_property_id
ON bookings (property_id);

-- 3. Create index on email or name in users table
-- If queries often filter by user email or name
CREATE INDEX idx_users_name
ON users (name);

-- 4. Create index on property name for faster search and sorting
CREATE INDEX idx_properties_name
ON properties (name);

-- 5. (Optional) Composite index for common multi-column queries
-- Example: If you frequently query bookings by user_id and property_id together
CREATE INDEX idx_bookings_user_property
ON bookings (user_id, property_id);

-- ================================================
-- PERFORMANCE TESTING
-- ================================================

-- Measure query performance BEFORE and AFTER indexing
-- (1) Run this query with EXPLAIN or ANALYZE before creating indexes
EXPLAIN ANALYZE
SELECT 
    users.name, properties.name, bookings.start_date, bookings.end_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
WHERE users.name = 'Alice'
ORDER BY bookings.start_date DESC;

-- (2) Run the same query again AFTER creating indexes
-- and compare total execution time / query plan.
