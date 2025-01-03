--etrieve all bookings and the respective users who made those bookings

SELECT
    Booking.booking_id, Booking.start_date, Booking.end_date, 
    Booking.status, User.first_name, User.last_name, User.email
FROM 
    Booking
INNER JOIN
    User ON Booking.user_id = User.user_id;


--retrieve all properties and their reviews, including properties that have no reviews

SELECT
    Property.property_id, Property.name, Proper.location,
    Review.rating, Review.comment, Review.created_at
FROM
    Review
LEFT JOIN
    Property ON Property.property_id = Review.property_id

--to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user

SELECT
    User.user_id, User.first_name, User.last_name, User.email, 
    Booking.booking_id, Booking.start_date, Booking.end_date, Booking.status
FROM
    User
FULL OUTER JOIN
    Booking ON User.user_id = Booking.user_id
ORDER BY
    User.user_id, Booking.start_date;