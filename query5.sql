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
