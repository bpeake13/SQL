SELECT Vehicle.*
FROM Vehicle
WHERE Vehicle.maxPassengers > 10;

SELECT Vehicle.*
FROM Vehicle, Guide
WHERE Vehicle.vehicleType = Guide.vehicleType
AND Guide.driverLicense = 12345678;

SELECT COUNT(BookedTour.bookedTourId), Customer.firstName, Customer.lastName
FROM BookedTour, Customer
WHERE BookedTour.customerId = Customer.customerId
GROUP BY BookedTour.customerId;

SELECT COUNT(BookedTour.bookedTourId), Guide.firstName, Guide.lastName, Guide.title
FROM Guide, BookedTour
WHERE BookedTour.driverLicense = Guide.driverLicense
GROUP BY BookedTour.driverLicense;

SELECT HIS_COUNT, MUSE_COUNT, RES_COUNT, Tour.tourName
FROM
	(SELECT COUNT(Traveling.locationId) AS HIS_COUNT, Tour.tourId AS HIS_TOUR
	FROM Traveling, Location, Tour
	WHERE Traveling.locationId = Location.locationId 
	AND Traveling.tourId = Tour.tourId
	AND Location.type = 'historic'
	GROUP BY Traveling.tourId),
	(SELECT COUNT(Traveling.locationId) AS MUSE_COUNT, Tour.tourId AS MUSE_TOUR
	FROM Traveling, Location, Tour
	WHERE Traveling.locationId = Location.locationId 
	AND Traveling.tourId = Tour.tourId
	AND Location.type = 'museum'
	GROUP BY Traveling.tourId),
	(SELECT COUNT(Traveling.locationId) AS RES_COUNT, Tour.tourId AS RES_TOUR
	FROM Traveling, Location, Tour
	WHERE Traveling.locationId = Location.locationId 
	AND Traveling.tourId = Tour.tourId
	AND Location.type = 'resturant'
	GROUP BY Traveling.tourId),
	Tour
WHERE HIS_TOUR = Tour.tourId
AND MUSE_TOUR = Tour.tourId
AND RES_TOUR = Tour.tourId;

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

SELECT Customer.*
FROM Customer, BookedTour
WHERE Customer.customerId = BookedTour.customerId
AND (YEAR(BookedTour.travelDate) = '2015' OR YEAR(BookedTour.travelDate) = '2016');
