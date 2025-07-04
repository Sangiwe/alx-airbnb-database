-- Original complex query: joins Booking, User, Property, Payment

-- Initial Query
SELECT
    b.id AS booking_id,
    b.status,
    b.created_at,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.status AS payment_status
FROM
    Booking b
JOIN
    User u ON b.user_id = u.id
JOIN
    Property p ON b.property_id = p.id
LEFT JOIN
    Payment pay ON b.id = pay.booking_id;


-- Refactored and optimized query
SELECT
    b.id AS booking_id,
    b.status,
    b.created_at,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status AS payment_status
FROM
    Booking b
JOIN
    User u ON b.user_id = u.id
JOIN
    Property p ON b.property_id = p.id
LEFT JOIN
    Payment pay ON b.id = pay.booking_id;
