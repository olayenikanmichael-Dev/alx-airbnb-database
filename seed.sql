-- ==========================================================
-- SEED SCRIPT FOR Airbnb CLONE DATABASE
-- Repository: alx-airbnb-database
-- Directory: database-script-0x02
-- File: seed.sql
-- ==========================================================

-- 1️⃣ INSERT USERS
INSERT INTO Users (full_name, email, password_hash, phone_number, role)
VALUES
('John Doe', 'john.doe@example.com', 'hashed_password_123', '+2348011111111', 'guest'),
('Jane Smith', 'jane.smith@example.com', 'hashed_password_456', '+2348022222222', 'host'),
('Michael Johnson', 'mike.j@example.com', 'hashed_password_789', '+2348033333333', 'guest'),
('Sarah Adams', 'sarah.adams@example.com', 'hashed_password_101', '+2348044444444', 'host');

-- 2️⃣ INSERT PROPERTIES
INSERT INTO Properties (host_id, title, description, location, price_per_night, max_guests, status)
VALUES
(2, 'Modern Apartment in Lagos', 'A cozy 2-bedroom apartment with city view.', 'Lagos, Nigeria', 180.00, 4, 'available'),
(4, 'Beachfront Villa', 'Luxury villa with ocean view and private pool.', 'Lekki, Nigeria', 350.00, 8, 'available'),
(2, 'Downtown Studio', 'Perfect for solo travelers or couples.', 'Ikeja, Nigeria', 120.00, 2, 'available');

-- 3️⃣ INSERT BOOKINGS
INSERT INTO Bookings (property_id, guest_id, check_in, check_out, total_price, booking_status)
VALUES
(1, 1, '2025-10-10', '2025-10-15', 900.00, 'confirmed'),
(2, 3, '2025-11-01', '2025-11-05', 1400.00, 'pending'),
(3, 1, '2025-12-20', '2025-12-22', 240.00, 'cancelled');

-- 4️⃣ INSERT PAYMENTS
INSERT INTO Payments (booking_id, amount, payment_method, payment_status)
VALUES
(1, 900.00, 'credit_card', 'completed'),
(2, 1400.00, 'paypal', 'pending'),
(3, 240.00, 'bank_transfer', 'failed');

-- 5️⃣ INSERT REVIEWS
INSERT INTO Reviews (property_id, guest_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing stay! Very clean and comfortable.'),
(2, 3, 4, 'Great location and view, but a bit pricey.'),
(3, 1, 3, 'Decent place for a quick stopover.');
