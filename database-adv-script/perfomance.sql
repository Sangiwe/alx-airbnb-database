-- Original complex query to retrieve bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.status,
    b.created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.payment_status = 'completed';

-- Analyze performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.status,
    b.created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.payment_status = 'completed';

-- Refactored (optimized) version: fewer selected fields
SELECT
    b.booking_id,
    u.first_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.payment_status = 'completed';

SELECT
    b.id AS booking_id,
    b.created_at,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND pay.status = 'completed';
