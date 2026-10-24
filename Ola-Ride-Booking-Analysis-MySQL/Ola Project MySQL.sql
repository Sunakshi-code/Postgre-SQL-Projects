CREATE DATABASE Ola;
Use ola;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings As
SELECT Booking_Status FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

#2. Find the average ride distance for each vehicle type:

CREATE VIEW ride_distance_for_each_vehicle_type As
SELECT Vehicle_Type, avg(Ride_Distance) As average_ride_distance
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle_type;

#3. Get the total number of cancelled rides by customers:

CREATE VIEW cancelled_rides_by_customers As
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:

SELECT Customer_ID, COUNT(Booking_ID) As total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC 
LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'personal and car-related issues';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT MAX(Driver_Ratings) As Max_rating,
MIN(Driver_Ratings) As Min_rating
FROM bookings
WHERE Vehicle_Type = ' Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:

SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:

SELECT Vehicle_Type, avg(Customer_Rating) As avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:

SELECT sum(Booking_Value) As total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:

SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'YES';
