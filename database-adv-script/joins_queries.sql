SELECT
    Booking.booking_id, Booking.start_date, Booking.end_date, 
    Booking.status, User.first_name, User.last_name, User.email
FROM 
    Booking
INNER JOIN
    User ON Booking.user_id = User.user_id;



SELECT
    Property.property_id, Property.name, Proper.location,
    Review.rating, Review.comment, Review.created_at
FROM
    Review
LEFT JOIN
    Property ON Property.property_id = Review.property_id



SELECT
    User.user_id, User.first_name, User.last_name, User.email, 
    Booking.booking_id, Booking.start_date, Booking.end_date, Booking.status
FROM
    User
FULL OUTER JOIN
    Booking ON Booking.user_id = User.user_id