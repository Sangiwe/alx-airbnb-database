# Database Index Optimization Report

## Task 1: Identify High-Usage Columns

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

## Task 2: Performance Measurement

### Example: Role-Based User Query

**Before Index:**
```sql
EXPLAIN SELECT * FROM User WHERE role = 'Admin';

**Output**
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | User  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    5 |    33.33 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

**After Index:**
CREATE INDEX idx_role ON User(role);
EXPLAIN SELECT * FROM User WHERE role = 'Admin';

**Output**
+----+-------------+-------+------------+------+---------------+---------+---------+-------+------+----------+-----------------------+
| id | select_type | table | partitions | type | possible_keys | key     | key_len | ref   | rows | filtered | Extra                 |
+----+-------------+-------+------------+------+---------------+---------+---------+-------+------+----------+-----------------------+
|  1 | SIMPLE      | User  | NULL       | ref  | idx_role      | idx_role| 1       | const |    1 |   100.00 | Using index condition |
+----+-------------+-------+------------+------+---------------+---------+---------+-------+------+----------+-----------------------+