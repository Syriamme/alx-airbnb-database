-- User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
  (UUID(), 'Jean', 'Karen', 'jeankaren@example.com', 'hashedpassword2', '123-456-7890', 'guest', CURRENT_TIMESTAMP),
  (UUID(), 'Daniel', 'Njagi', 'danielnjagi@example.com', 'hashedpassword1', '234-567-8901', 'host', CURRENT_TIMESTAMP),
  (UUID(), 'Rori', 'Njagi', 'rorinjagi@example.com', 'hashedpassword4', '345-678-9012', 'guest', CURRENT_TIMESTAMP),
  (UUID(), 'Njagi', 'Dan', 'njagidan@example.com', 'hashedpassword3', '456-789-0123', 'admin', CURRENT_TIMESTAMP);

-- Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'jeankaren@example.com'), 'Cozy  House', 
  'A beautiful house by the beach.', 'Miami, FL', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'danielnjagi@example.com'), 'Luxury Cabin', 'Cabin in the mountains.', 
  'Denver, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'rorinjagi@example.com'), 'Modern Apartment', 'Apartment in downtown.', 
  'New York, NY', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy House'), (SELECT user_id FROM User WHERE email = 'jeankaren@example.com'), '2024-12-01', 
  '2024-12-07', 900.00, 'confirmed', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Luxury Cabin'), (SELECT user_id FROM User WHERE email = 'danielnjagi@example.com'), 
  '2024-12-10', '2024-12-15', 1000.00, 'pending', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Modern Apartment'), (SELECT user_id FROM User WHERE email = 'rorinjagi@example.com'), '2024-12-20', 
  '2024-12-25', 900.00, 'confirmed', CURRENT_TIMESTAMP);

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE property_id = (SELECT property_id FROM Property WHERE name = 'Cozy House')), 900.00, CURRENT_TIMESTAMP, 'credit_card'),
  (UUID(), (SELECT booking_id FROM Booking WHERE property_id = (SELECT property_id FROM Property WHERE name = 'Luxury Cabin')), 1000.00, CURRENT_TIMESTAMP, 'paypal'),
  (UUID(), (SELECT booking_id FROM Booking WHERE property_id = (SELECT property_id FROM Property WHERE name = 'Modern Apartment')), 900.00, CURRENT_TIMESTAMP, 'stripe');

-- Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy House'), (SELECT user_id FROM User WHERE email = 'jeankaren@example.com'), 5, 
  'Amazing stay!', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Luxury Cabin'), (SELECT user_id FROM User WHERE email = 'danielnjagi@example.com'), 4, 
  'Great cabin.', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Modern Apartment'), (SELECT user_id FROM User WHERE email = 'rorinjagi@example.com'), 5, 
  'The apartment was perfect for my city trip.', CURRENT_TIMESTAMP);

-- Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'jeankaren@example.com'), 
  (SELECT user_id FROM User WHERE email = 'jeankaren@example.com'), 'Hi, I would like to know if your beach house is available for December.', CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'danielnjagi@example.com'), 
  (SELECT user_id FROM User WHERE email = 'danielnjagi@example.com'), 'Yes. Feel free to book it!', CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'rorinjagi@example.com'), 
  (SELECT user_id FROM User WHERE email = 'rorinjagi@example.com'), 'Hello, can you tell me more about the apartment?', CURRENT_TIMESTAMP);