--find all properties where the average rating is greater than 4.0

SELECT
    Property.property_id, Property.name, Property.location,
    AVG(Review.rating) AS average_rating
FROM
    Property
JOIN 
    Review ON Property.property_id = Review.property_id
GROUP BY
    Property.property_id
HAVING
    AVG(Review.rating) > 4.0;

--correlated subquery to find users who have made more than 3 bookings
SELECT
    User.user_id,
    User.first_name,
    User.last_name
FROM
    User
WHERE
    (SELECT COUNT (*) FROM Booking WHERE Booking.user_id = User.user_id) > 3;