-- COUNT function and GROUP BY clause.
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

--window function (ROW_NUMBER, RANK)
SELECT
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank_popularity,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM
    Property p
LEFT JOIN
    Booking b ON p.property_id = b.property_id
GROUP BY
    p.property_id, p.name
ORDER BY
    booking_count DESC;

