
-- Quick user lookup by email
CREATE INDEX indx_user_email ON User (email);

-- Faster lookup of properties by host
CREATE INDEX indx_property_host_id ON Property (host_id);  

-- Faster location-based searches
CREATE INDEX indx_property_location ON Property (location);

-- Faster lookup of bookings by user
CREATE INDEX indx_booking_user_id ON Booking (user_id);

-- Faster lookup of bookings by property
CREATE INDEX indx_booking_property_id ON Booking (property_id);

-- Efficient date-range filtering
CREATE INDEX indx_booking_dates ON Booking (start_date, end_date);

--Before adding indexes

EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date >= '2024-01-01' AND end_date <= '2024-12-31';

--After adding indexes

EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date >= '2024-01-01' AND end_date <= '2024-12-31';


