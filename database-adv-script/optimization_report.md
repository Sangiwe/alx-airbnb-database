# Optimization Report for Complex Query

## Initial Query Description

The original query retrieves booking information, along with:
- User details (via JOIN on `User`)
- Property details (via JOIN on `Property`)
- Payment details (via LEFT JOIN on `Payment`)

It joins four tables and selects multiple fields using aliases for clarity.

## Performance Analysis Using EXPLAIN

I used `EXPLAIN ANALYZE` to assess performance.

### Initial Results:
- Sequential Scan (`Seq Scan`) was used on the `Booking`, `User`, and `Payment` tables.
- This indicated missing indexes on foreign key columns (`user_id`, `property_id`, `booking_id`).
- Execution time was relatively high due to full table scans and large result sets.

## Refactoring Changes

### Changes Made:
1. **Reduced selected columns**: Removed unnecessary `SELECT *` to avoid retrieving unused data.
2. **Indexed important columns**:
    ```sql
    CREATE INDEX idx_booking_user_id ON Booking(user_id);
    CREATE INDEX idx_booking_property_id ON Booking(property_id);
    CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
    ```
3. **Kept LEFT JOIN** on `Payment` because not all bookings may have a payment yet.

## Final Results (After Optimization)

After creating indexes and reducing selected fields:
- The query used **Index Scan** instead of Seq Scan.
- Execution time improved significantly.
- The query now scales better for larger datasets.


