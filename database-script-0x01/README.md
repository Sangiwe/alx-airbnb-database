# Database Schema Design 

This directory contains the SQL Data Definition Language (DDL) scripts for creating the Airbnb Clone database schema.

## Schema Overview
The database consists of 6 main tables:
1. `User` - Stores user account information
2. `Property` - Contains property listings
3. `Booking` - Manages reservation records
4. `Payment` - Tracks payment transactions
5. `Review` - Stores guest reviews
6. `Message` - Handles user messaging

## Key Design Decisions

### 1. Primary Keys
- All tables use `CHAR(36)` UUIDs as primary keys
- Default value set to `UUID()` for automatic generation

### 2. Foreign Key Constraints
- Implemented `ON DELETE CASCADE` for maintaining referential integrity
- Example: Deleting a user automatically deletes their properties

### 3. Data Types
- Used appropriate data types for each field:
  - `VARCHAR` for text with known maximum length
  - `TEXT` for longer descriptions
  - `ENUM` for fixed-value fields (user roles, booking statuses)
  - `DECIMAL(10,2)` for monetary values

### 4. Constraints
- Added `NOT NULL` for required fields
- Implemented `CHECK` constraints for:
  - Valid rating range (1-5) in Reviews
  - Positive price values
  - Valid date ranges (end_date > start_date)

### 5. Indexing
- Created indexes on:
  - All primary keys (automatic)
  - Frequently queried columns (emails, property IDs)
  - Foreign key columns for join performance

## Usage Instructions

To create the database:

```bash
mysql -u username -p < schema.sql