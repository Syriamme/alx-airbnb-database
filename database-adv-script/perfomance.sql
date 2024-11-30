--Initial Query to Retrieve All Bookings with User, Property, and Payment Details
SELECT
    Booking.booking_id, Booking.start_date, Booking.end_date, Booking.status AS booking_status,
    User.user_id, User.first_name AS user_first_name, User.last_name AS user_last_name, User.email AS user_email,
    Property.property_id, Property.name AS property_name, Property.location AS property_location, Property.pricepernight,
    Payment.payment_id, Payment.amount AS payment_amount, Payment.payment_date
FROM
    Booking
JOIN
    User ON Booking.user_id = User.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
JOIN
    Payment ON Booking.booking_id = Payment.booking_id;


--Analyzing Performance

EXPLAIN ANALYZE
SELECT
    Booking.booking_id, Booking.start_date, Booking.end_date, Booking.status AS booking_status,
    User.user_id, User.first_name AS user_first_name, User.last_name AS user_last_name, User.email AS user_email,
    Property.property_id, Property.name AS property_name, Property.location AS property_location, Property.pricepernight,
    Payment.payment_id, Payment.amount AS payment_amount, Payment.payment_date
FROM
    Booking
JOIN
    User ON Booking.user_id = User.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
JOIN
    Payment ON Booking.booking_id = Payment.booking_id;

--Refactored Query
SELECT
    Booking.booking_id, Booking.start_date, Booking.end_date, Booking.status AS booking_status,
    User.user_id, User.first_name AS user_first_name, User.last_name AS user_last_name, User.email AS user_email,
    Property.property_id, Property.name AS property_name, Property.location AS property_location, Property.pricepernight,
    Payment.payment_id, Payment.amount AS payment_amount, Payment.payment_date
FROM
    Booking
JOIN
    User ON Booking.user_id = User.user_id
JOIN
    Property ON Booking.property_id = Property.property_id
JOIN
    Payment ON Booking.booking_id = Payment.booking_id;
WHERE
    Booking.start_date >= '2024-01-01'  -- Only fetch bookings for an year
    AND Booking.status = 'confirmed';  -- Only fetch bookings that are confirmed