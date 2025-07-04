-- Drop the old Booking table 
DROP TABLE IF EXISTS Booking;

-- Booking table with PARTITIONING enabled
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pMax VALUES LESS THAN MAXVALUE
);

--  Inserted some test data
INSERT INTO Booking VALUES
(UUID(), 'prop1', 'user1', '2022-01-10', '2022-01-15', 1000.00, 'confirmed', NOW()),
(UUID(), 'prop2', 'user2', '2023-06-05', '2023-06-10', 1200.00, 'confirmed', NOW()),
(UUID(), 'prop3', 'user3', '2024-03-01', '2024-03-05', 800.00, 'pending', NOW());

-- Ran a performance test query
EXPLAIN SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
