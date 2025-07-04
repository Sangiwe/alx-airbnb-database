# Database Index Optimization Report

## High-Usage Columns

### User Table
- `user_id` (Primary key, JOIN operations)
- `email` (WHERE clauses for authentication)
- `role` (WHERE clauses for filtering users)

### Booking Table
- `booking_id` (Primary key)
- `property_id` (JOIN to Property table)
- `user_id` (JOIN to User table)
- `status` (WHERE clauses for filtering)
- `created_at` (ORDER BY and date range queries)

### Property Table
- `property_id` (Primary key)
- `host_id` (JOIN to User table)
- `location` (WHERE clauses for search)
- `price_per_night` (WHERE clauses for filtering)


