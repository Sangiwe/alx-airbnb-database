# Entity Relationship Diagram (ERD) Requirements

## Entities and Attributes

### 1. User
- user_id: Primary Key (UUID), Indexed
- name: VARCHAR, NOT NULL
- email: VARCHAR, UNIQUE, NOT NULL
- password: VARCHAR, NOT NULL
- role: ENUM ('guest', 'host', 'admin'), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 2. Property
- property_id: Primary Key (UUID), Indexed
- host_id: Foreign Key, references User(user_id)
- name: VARCHAR, NOT NULL
- description: TEXT, NOT NULL
- location: VARCHAR, NOT NULL
- price_per_night: DECIMAL, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 3. Booking
- booking_id: Primary Key (UUID), Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- start_date: DATE, NOT NULL
- end_date: DATE, NOT NULL
- total_price: DECIMAL, NOT NULL
- status: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 4. Payment
- payment_id: Primary Key (UUID), Indexed
- booking_id: Foreign Key, references Booking(booking_id)
- amount: DECIMAL, NOT NULL
- payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- payment_method: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL

---

### 5. Review
- review_id: Primary Key (UUID), Indexed
- property_id: Foreign Key, references Property(property_id)
- user_id: Foreign Key, references User(user_id)
- rating: INTEGER, CHECK rating BETWEEN 1 AND 5, NOT NULL
- comment: TEXT, NOT NULL
- created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 6. Message
- message_id: Primary Key (UUID), Indexed
- sender_id: Foreign Key, references User(user_id)
- recipient_id: Foreign Key, references User(user_id)
- message_body: TEXT, NOT NULL
- sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships Between Entities

1. **User to Property**  
   - A user (host) can have zero or many properties.  
   - Each property belongs to one user (host).  
   - Relationship: **One-to-Many (Optional on both sides)**.

---

2. **Property to Booking**  
   - A property can have many bookings over time but only one active booking during the same date range.  
   - Each booking is linked to one property.  
   - Relationship: **One-to-Many**.

---

3. **User to Booking**  
   - A user (guest) can make many bookings.  
   - A booking cannot exist without a user (mandatory).  
   - Relationship: **One-to-Many (Mandatory from Booking to User)**.

---

4. **Booking to Payment**  
   - A booking can have one payment or potentially none if unpaid.  
   - Each payment is linked to one booking.  
   - Relationship: **One-to-One (Optional)**.

---

5. **User to Review**  
   - A user (guest) can write multiple reviews.  
   - Each review is linked to one user.  
   - Relationship: **One-to-Many (Optional)**.

---

6. **Property to Review**  
   - A property can have many reviews.  
   - Each review is for one property.  
   - Relationship: **One-to-Many (Optional)**.

---

7. **User to Message**  
   - Users can send many messages and receive many messages.  
   - Each message has one sender and one recipient.  
   - Relationship: **Many-to-Many (Implemented as two One-to-Many relationships with sender_id and recipient_id)**.

---

## Constraints

- Unique constraint on **email** in the User table.
- Non-null constraints on essential attributes.
- Enum constraints on **role, status, payment_method.**
- Check constraint on **rating** (1 to 5).
- Foreign key constraints to maintain referential integrity.

---

## Indexing

- Primary Keys are automatically indexed.
- Indexed columns:  
  - `email` in User  
  - `property_id` in Property and Booking  
  - `booking_id` in Booking and Payment

---

## Note

The ER diagram visually represents these entities and their relationships. It is used for understanding and designing the database structure.

