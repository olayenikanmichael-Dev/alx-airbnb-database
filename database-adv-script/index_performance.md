# Database Index Optimization

## 📘 Objective
Improve query performance by identifying high-usage columns and creating appropriate indexes.  
Then measure the performance before and after indexing using `EXPLAIN` or `ANALYZE`.

---

##  High-Usage Columns

| Table | Column | Reason for Index |
|--------|---------|------------------|
| **bookings** | `user_id` | Used in JOIN with users table |
| **bookings** | `property_id` | Used in JOIN with properties table |
| **users** | `name` or `email` | Used in WHERE filters or search queries |
| **properties** | `name` | Used in ORDER BY or search filters |
| **bookings** | `(user_id, property_id)` | Commonly queried together in reports |

---

## ⚙️ Create Indexes

```sql
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_users_name ON users (name);
CREATE INDEX idx_properties_name ON properties (name);
CREATE INDEX idx_bookings_user_property ON bookings (user_id, property_id);
