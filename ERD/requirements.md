# Requirements for AirBnB ERD

## Entities and Attributes
The following entities and their attributes are included in the AirBnB ERD:

### 1. **User**
- `user_id` (PK, UUID)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. **Property**
- `property_id` (PK, UUID)
- `host_id` (FK → User(user_id))
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### 3. **Booking**
- `booking_id` (PK, UUID)
- `property_id` (FK → Property(property_id))
- `user_id` (FK → User(user_id))
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 4. **Payment**
- `payment_id` (PK, UUID)
- `booking_id` (FK → Booking(booking_id))
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe, NOT NULL)

### 5. **Review**
- `review_id` (PK, UUID)
- `property_id` (FK → Property(property_id))
- `user_id` (FK → User(user_id))
- `rating` (INTEGER, 1-5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 6. **Message**
- `message_id` (PK, UUID)
- `sender_id` (FK → User(user_id))
- `recipient_id` (FK → User(user_id))
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## Relationships
- **User → Property** (1:N): A user (host) can own many properties.
- **User → Booking** (1:N): A user (guest) can make many bookings.
- **Property → Booking** (1:N): A property can have many bookings.
- **Booking → Payment** (1:1): One booking can have only one payment.
- **Property → Review** (1:N): A property can have many reviews.
- **User → Review** (1:N): A user can write many reviews.
- **User → Message** (M:N): A user can send and receive many messages.

---

## Constraints
- **User**: Unique constraint on email; non-null constraints on essential fields.
- **Property**: Foreign key constraint on `host_id`; non-null constraints on key attributes.
- **Booking**: Foreign key constraints on `property_id` and `user_id`; `status` must be one of `pending`, `confirmed`, or `canceled`.
- **Payment**: Foreign key constraint on `booking_id`; `amount` cannot be negative.
- **Review**: Constraints on rating (1-5); foreign key constraints on `property_id` and `user_id`.
- **Message**: Foreign key constraints on `sender_id` and `recipient_id`.

---

## Indexing
- Primary Keys: Automatically indexed.
- Additional indexes:
  - `email` in the **User** table.
  - `property_id` in **Property** and **Booking** tables.
  - `booking_id` in **Booking** and **Payment** tables.