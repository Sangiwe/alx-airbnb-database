-- User Table Indexes
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_email ON User(email);
CREATE INDEX idx_role ON User(role);

-- Booking Table Indexes
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property Table Indexes
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);


-- Performance analysis before and after adding indexes

-- ======================
-- USER TABLE INDEXES
-- ======================

-- 1. role column analysis
EXPLAIN ANALYZE SELECT * FROM User WHERE role = 'host';

CREATE INDEX idx_role ON User(role);

EXPLAIN ANALYZE SELECT * FROM User WHERE role = 'host';

-- 2. email column analysis
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';

CREATE INDEX idx_email ON User(email);

EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'test@example.com';

-- ======================
-- BOOKING TABLE INDEXES
-- ======================

-- 1. status column analysis
EXPLAIN ANALYZE SELECT * FROM Booking WHERE status = 'confirmed';

CREATE INDEX idx_status ON Booking(status);

EXPLAIN ANALYZE SELECT * FROM Booking WHERE status = 'confirmed';

-- 2. user_id column analysis
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'user123';

CREATE INDEX idx_booking_user ON Booking(user_id);

EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 'user123';

-- ======================
-- PROPERTY TABLE INDEXES
-- ======================

-- 1. location column analysis
EXPLAIN ANALYZE SELECT * FROM Property WHERE location LIKE 'Paris%';

CREATE INDEX idx_location ON Property(location);

EXPLAIN ANALYZE SELECT * FROM Property WHERE location LIKE 'Paris%';

-- 2. price_per_night analysis
EXPLAIN ANALYZE SELECT * FROM Property WHERE price_per_night BETWEEN 50 AND 100;

CREATE INDEX idx_price ON Property(price_per_night);

EXPLAIN ANALYZE SELECT * FROM Property WHERE price_per_night BETWEEN 50 AND 100;