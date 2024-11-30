SELECT
    Property.property_id, Property.name, Property.location,
    AVG(Review.rating)
FROM
    Property
JOIN 
    Review ON Property.property_id = Review.property_id
GROUP BY
    Property.property_id
HAVING
    AVG(Review.rating) > 4.0;

SELECT
    User.user_id,
    User.first_name,
    User.last_name
FROM
    User
WHERE
    (SELECT COUNT (*) FROM Booking WHERE Booking.user_id = User.user_id) > 3;