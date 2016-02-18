SELECT SUM(M.PARTY_COUNT) AS TOTAL_COUNT, Tour.tourName, Tour.city, Tour.state, Tour.vehicleType
FROM 
	BookedTour,
	Tour,
	(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, TravelingWith.customerId AS CUS_ID
	FROM Customer, TravelingWith
	WHERE TravelingWith.customerId = Customer.customerId
	GROUP BY TravelingWith.customerId) M
WHERE BookedTour.tourId = Tour.tourId
AND BookedTour.customerId = M.CUS_ID
GROUP BY BookedTour.tourId, Tour.tourName, Tour.city, Tour.state, Tour.vehicleType;
