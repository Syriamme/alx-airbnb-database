# Database Seeding Script

## Overview
The `seed.sql` file contains SQL `INSERT` statements that mimic real-world data to fill up the database when needed. Such data allows for testing the functionality and the interaction of the resulting database schema in the most efficient manner.

### Supported Entities
The script seeds the following entities:
1. **User**: Sample users, such as, guests, hosts, and admins.
2. **Property**: A set of attributes linked to hosts such as the number of affiliates and the operation of centres in the regions.
3. **Booking**: Reservation of a particular property by a user.
4. **Payment**: Information concerning payments for the bookings including the amount of payment and the method of payment.
5. **Review**: Feedbacks given by users for all properties involving rating and comments.
6. **Message**: Conversations between users and customers, fans, and friends.

---

## Requirements
A fully defined database schema which will be developed using the contents of the `schema.sql` file.
Assistance on the existence of the `UUID()` function or similar in your SQL database.
This script must be run after the creation of the database and when the database is to be seeded the database should be empty.

---

## How to Use
1. Check the necessary database schema to be there by running the `schema.sql` file.
2. Open your SQL client or terminal which connects you to the Database.
3. Execute the `seed.sql` script to populate the database:
   ```bash
   mysql -u <username> -p <database_name><seed.sql