## Partitioning Performance Report

### Table: Booking

I implemented partitioning on the `Booking` table using the `start_date` column, using `RANGE` partitioning by `YEAR(start_date)`.

### Query Tested
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
````
## Observations

**Before Partitioning** : The query scanned the entire Booking table.

**After Partitioning** : The query accessed only the partition for year 2023.

**Result** : Improved performance by reducing the number of rows scanned.

## Output
Before: rows = 100000+

After: rows = 30000 (only in partition p2023)

