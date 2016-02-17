SELECT PARTY_COUNT + 1 AS TOTAL_COUNT, Tour.tourName, Tour.city, Tour.state, Tour.vehicleType
FROM SUM(PARTY_COUNT)
	BookedTour,
	Tour,
	(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, Customer.*
	FROM Customer, TravelingWith
	WHERE TravelingWith.customerId = Customer.customerId
	GROUP BY TravelingWith.customerId)
WHERE BookedTour.customerId = Customer.customerId AND BookedTour = Tour.tourId
GROUP BY BookedTour.tourId;
