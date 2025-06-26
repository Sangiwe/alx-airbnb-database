-- 1. Users (Guests, Hosts, and Admins)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) 
VALUES -- Hosts
      ('11e8888b-1234-5678-1234-567812345678', 'Sarah', 'Johnson', 'sarah@example.com', '$2a$10$hashed1', '+1234567890', 'host', '2024-01-15 09:30:00'),
      ('22e9999c-2345-6789-2345-678923456789', 'Mike', 'Chen', 'mike@example.com', '$2a$10$hashed2', '+1987654321', 'host', '2024-02-20 14:15:00'),
       -- Guests
      ('33e7777a-3456-7890-3456-789034567890', 'Emma', 'Williams', 'emma@example.com', '$2a$10$hashed3', '+1555666777', 'guest', '2024-03-10 10:00:00'),
      ('44e6666d-4567-8901-4567-890145678901', 'David', 'Brown', 'david@example.com', '$2a$10$hashed4', '+1444333222', 'guest', '2024-04-05 16:45:00'),
       -- Admin
      ('55e5555e-5678-9012-5678-901256789012', 'Admin', 'User', 'admin@example.com', '$2a$10$hashed5', '+1777888999', 'admin', '2024-01-01 00:00:00');

-- 2. Properties (3 properties for each host)
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES('aa111111-bbbb-cccc-dddd-eeee11111111', '11e8888b-1234-5678-1234-567812345678', 'Beachfront Villa', 'Luxury villa with private beach', 'Malibu, CA', 350.00, '2024-01-16 10:00:00', NULL),
      ('bb222222-cccc-dddd-eeee-ffff22222222', '11e8888b-1234-5678-1234-567812345678', 'Downtown Loft', 'Modern loft in city center', 'New York, NY', 200.00, '2024-01-18 11:30:00', NULL),
      ('cc333333-dddd-eeee-ffff-gggg33333333', '22e9999c-2345-6789-2345-678923456789', 'Mountain Cabin', 'Cozy cabin with stunning views', 'Aspen, CO', 180.00, '2024-02-21 09:15:00', '2024-04-15 14:30:00');

-- 3. Bookings (Mix of past/future stays)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) 
VALUES -- Emma's bookings
      ('dd444444-eeee-ffff-gggg-hhhh44444444', 'aa111111-bbbb-cccc-dddd-eeee11111111', '33e7777a-3456-7890-3456-789034567890', '2024-06-01', '2024-06-07', 2100.00, 'confirmed', '2024-05-10 08:20:00'),
      ('ee555555-ffff-gggg-hhhh-iiii55555555', 'bb222222-cccc-dddd-eeee-ffff22222222', '33e7777a-3456-7890-3456-789034567890', '2024-07-15', '2024-07-18', 600.00, 'pending', '2024-05-12 13:45:00'),
       -- David's booking
      ('ff666666-gggg-hhhh-iiii-jjjj66666666', 'cc333333-dddd-eeee-ffff-gggg33333333', '44e6666d-4567-8901-4567-890145678901', '2024-05-20', '2024-05-25', 900.00, 'confirmed', '2024-04-28 17:30:00');

-- 4. Payments (Linked to Bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES ('gg777777-hhhh-iiii-jjjj-kkkk77777777', 'dd444444-eeee-ffff-gggg-hhhh44444444', 2100.00, '2024-05-10 08:25:00', 'credit_card'),
       ('hh888888-iiii-jjjj-kkkk-llll88888888', 'ff666666-gggg-hhhh-iiii-jjjj66666666', 900.00, '2024-04-28 17:35:00', 'paypal');

-- 5. Reviews (From Guests)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES -- Emma's review
      ('ii999999-jjjj-kkkk-llll-mmmm99999999', 'aa111111-bbbb-cccc-dddd-eeee11111111', '33e7777a-3456-7890-3456-789034567890', 5, 'Absolutely perfect! The beach access was incredible.', '2024-06-08 10:00:00'),
-- David's review
       ('jj101010-kkkk-llll-mmmm-nnnn10101010', 'cc333333-dddd-eeee-ffff-gggg33333333', '44e6666d-4567-8901-4567-890145678901', 4, 'Great cabin, but the wifi was spotty.', '2024-05-26 14:30:00');

-- 6. Messages (Host-Guest Communication)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) 
VALUES -- Emma > Sarah
       ('kk111111-llll-mmmm-nnnn-oooo11111111', '33e7777a-3456-7890-3456-789034567890', '11e8888b-1234-5678-1234-567812345678', 'Hi Sarah, is the beach villa pet-friendly?', '2024-05-09 12:00:00'),
       ('ll121212-mmmm-nnnn-oooo-pppp12121212', '11e8888b-1234-5678-1234-567812345678', '33e7777a-3456-7890-3456-789034567890', 'Yes! We allow dogs under 50lbs.', '2024-05-09 12:30:00');