# Database Normalization - ALX Airbnb Database

## ✅ What is Normalization?

Normalization is the process of organizing data in a database to eliminate redundancy and improve data integrity. The goal is to structure the tables and their relationships to reduce duplication and ensure consistency.

## ✅ Normalization Process to 3NF

### 🔹 First Normal Form (1NF)

- **Rule:** Eliminate repeating groups; ensure each column contains atomic values (indivisible).
- **Check:**  
All entities (User, Property, Booking, Payment, Review, Message) have atomic attributes — no lists or multiple values in a single field.

**✅ Passes 1NF**

---

### 🔹 Second Normal Form (2NF)

- **Rule:** Must first be in 1NF. Remove partial dependencies — every non-key attribute must depend on the whole primary key.
- **Check:**  
All tables with composite keys are reviewed. However, in this design, most tables use a single-column primary key (UUID). Therefore, no partial dependencies exist.

**✅ Passes 2NF**

---

### 🔹 Third Normal Form (3NF)

- **Rule:** Must be in 2NF. Remove transitive dependencies — non-key attributes should depend only on the primary key.
- **Check:**  
No transitive dependencies are found. All non-key attributes depend directly on their table's primary key.

**Examples:**
- In the **Booking** table, `total_price`, `start_date`, and `end_date` all depend directly on `booking_id`.
- In **Payment**, `amount` and `payment_method` depend only on `payment_id`.
- No attribute depends on another non-primary key attribute.

**✅ Passes 3NF**

---

## ✅ Conclusion

The database schema satisfies the requirements for 3NF. It eliminates redundancy, ensures data integrity, and maintains clear relationships between entities.

## 🚀 Notes

No further adjustments were necessary since the schema was designed with normalization in mind from the beginning.
