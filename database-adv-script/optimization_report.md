# SQL Performance Optimization

## 📘 Objective
Refactor complex SQL queries to improve performance by reducing execution time, minimizing joins, and using indexes effectively.

---

##  Step 1 — Initial Complex Query


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

