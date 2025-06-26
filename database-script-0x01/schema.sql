 CREATE DATABASE airbnb_database;
Use airbnb_database;

CREATE TABLE User (
    user_id CHAR(36) NOT NULL DEFAULT (UUID()),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (user_id),
    INDEX idx_user_id (user_id) 
);

CREATE TABLE Property (
    property_id CHAR(36) NOT NULL DEFAULT (UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (property_id),
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE,
    INDEX idx_host_id (host_id),
    INDEX idx_property_id (property_id)  
);

CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (booking_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date),  -- Checks that end_date is after start_date
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id),
    INDEX idx_booking_id (booking_id)
);

CREATE TABLE Payment (
	payment_id CHAR(36) NOT NULL DEFAULT (UUID()),
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount >= 0 AND amount <= 1000000), --  Prevent unrealistic values (e.g., R10 million)
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, --  Track refunds and updates
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    payment_status ENUM('pending', 'completed', 'refunded', 'failed') NOT NULL DEFAULT 'pending',
    
    PRIMARY KEY (payment_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    INDEX idx_booking_id (booking_id) -- Faster "Find all payments for a booking"
);
 

CREATE TABLE Review (
    review_id CHAR(36) NOT NULL DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT CHECK ( rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (review_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,  -- When a property is deleted then reivew is deleted
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,  -- When a user is deleted then reivew is deleted,,
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id),
    INDEX idx_rating (rating) 
);

CREATE TABLE Message (
    message_id CHAR(36) NOT NULL DEFAULT (UUID()),
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES User(user_id)  ON DELETE CASCADE, -- Delete messages if either sender vanishes
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)  ON DELETE CASCADE, -- Delete messages if either recipient vanishes
    INDEX idx_sender_id (sender_id),
    INDEX idx_recipient_id (recipient_id)
);
