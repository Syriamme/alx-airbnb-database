# AirBnB Database Schema
## Overview
This document contains SQL Schema for a AirBnB system. Thus, the schema consists of such tables as user, property, booking, payment, review, and message. To implement this database, normalization principles are employed such that there is no repetition of data in the storage system.
## Entities
1. **User**: A user in the system implies that one can be a guest, host, or even the admin.
2. **Property**: Is an instance of a property which has been listed by a host.
3. **Booking**: Describes a guest booking of the property.
4. **Payment**: Means a payment linked to a booking.
5. **Review**: Represents a guest review of a particular property, of which a guest may have stayed in the property.
6. **Message**: Reflects a communication exchange between end users such as a guest and the host.
## Tables
### User Table
- **user_id**: UUID (Primary Key)
- **first_name**: VARCHAR (NOT NULL)
- **last_name**: VARCHAR (NOT NULL)
- **email**: VARCHAR (Unique, NOT NULL)
- **password_hash**: VARCHAR (NOT NULL)
- **phone_number**: VARCHAR (Nullable)
- **role**: VARCHAR( ENUM ‘guest’, ‘host’, ‘admin’) (NOT NULL)
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
### Property Table
- **property_id**: UUID (Primary Key)
- **host_id**: UUID (FK, `User(user_id)`)
- **name**: VARCHAR (NOT NULL)
- **description**: TEXT (NOT NULL)
- **location**: VARCHAR (NOT NULL)
- **pricepernight**: DECIMAL (NOT NULL)
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
- **updated_at**: The creation and modification time is set to timestamp with an default value of current timestamp on update timestamp.

### Booking Table

- **booking_id**: UUID (Primary Key)
- **property_id**: UUID (Foreign Key, references Property(property_id))
- **user_id**: UUID (FK, `User(user_id)`)
- **start_date**: DATE (NOT NULL)
- **end_date**: DATE (NOT NULL)
- **status**: VARCHAR2 (20 Byte) ENUM ('pending’, ‘confirmed’, ‘canceled’) (NOT NULL)
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
### Payment Table
- **payment_id**: UUID (Primary Key)
- **booking_id**: UUID (Foreign Key, refers to `Booking(booking_id)`)
- **amount**: DECIMAL (NOT NULL)
- **payment_date**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
- **payment_method**: The enum is defined as credit card, paypal, stripe and it is to be filled in.
### Review Table
- **review_id**: UUID (Primary Key)
- **property_id**: UUID (Foreign Key, references Property(property_id))
- **user_id**: UUID (FK, `User(user_id)`)
- **rating**: INTEGER ( MUST BE ENTERED BETWEEN 1 AND 5) (CONSIDERED AS NOT NULL)
- **comment**: TEXT (NOT NULL)
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
### Message Table
- **message_id**: UUID (Primary Key)
- **sender_id**: UUID (FK, `User(user_id)`)
- **recipient_id**: UUID (FK, `User(user_id)`)
- **message_body**: TEXT (NOT NULL)
- **sent_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP
## Indexes
- Indexes are created on columns frequently used for searching and joining:
  - `User.email`
  - `Property.property_id`
  – `Booking.property_id`, `Booking.user_id`.
  - `Payment.booking_id`
  id: Review.property_id, Review.user_id
  wrong with `Message.sender_id` & `Message.recipient_id`.
## Normalization

The schema has been designed to adhere to normalization principles, ensuring the following:
- **1NF (First Normal Form)**: The tables are uniformly unique identified, all the attribute include atomic data.
- **2NF (Second Normal Form)**: All the rest of the attributes are fully dependent on the primary key.
- **3NF (Third Normal Form)**: Transitive dependencies have been removed, which means that attributes, which can be derived from the key and other attributes, have been deleted ( e.g.., **total_price** from the **Booking** table – total price is always dependent on the total quantity of services and prices).
## SQL Schema
For database SQL schema look at the file named `schema.sql`. This encompasses the `CREATE TABLE` statements of the above tables creation statements, constraints, Keys and Indexes.
## Usage
To set up the database:
1. Execute the script file named `schema.sql` in your SQL DBMS (MySQL, PostgreSQL, etc. ).
2. The tables will be created and the necessary indexes will be added to enhance efficiency at the same time.