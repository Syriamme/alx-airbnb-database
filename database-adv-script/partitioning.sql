--Booking Table
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (start_date);


CREATE TABLE Booking_for_2024 PARTITION OF Booking_partitioned FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_for_2025 PARTITION OF Booking_partitioned FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_for_2026 PARTITION OF Booking_partitioned FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

CREATE TABLE Booking_for_2027 PARTITION OF Booking_partitioned FOR VALUES FROM ('2028-01-01') TO ('2029-01-01');

--Analyze for performance

EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned 
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

