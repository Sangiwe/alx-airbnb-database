-- INNER JOIN
SELECT 
     p.name AS property_name,
     b.booking_id, 
     b.property_id, 
     u.user_id, 
     u.first_name, 
     u.last_name
FROM 
   User u
INNER JOIN 
   Booking b ON u.user_id = b.user_id
INNER JOIN Property p ON p.property_id = p.property_id;

-- LEFT JOIN
SELECT 
	   p.property_id,
     p.name AS Property_name,
     r.review_id,
     r.rating,
     r.comment
FROM 
   Property p
LEFT JOIN 
   Review r ON p.property_id = r.property_id
ORDER BY 
    p.property_id,  
    r.rating DESC; 

-- FULL OUTER JOIN
-- Solution using FULL OUTER JOIN (conceptual, for non-MySQL databases)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date
FROM 
    User u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;

-- MySQL-compatible version (emulates FULL OUTER JOIN)
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date
FROM 
    User u
RIGHT JOIN 
    Booking b ON u.user_id = b.user_id
WHERE 
    u.user_id IS NULL;