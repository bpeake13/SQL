SELECT 
SUM(CASE WHEN Location.type ='resturant' THEN 1 ELSE 0 END) AS RES_COUNT,
SUM(CASE WHEN Location.type ='museum' THEN 1 ELSE 0 END) AS MUES_COUNT,
SUM(CASE WHEN Location.type ='historic' THEN 1 ELSE 0 END) AS HIS_COUNT,
Tour.tourName
FROM Traveling, Location, Tour
WHERE Traveling.locationId = Location.locationId 
AND Traveling.tourId = Tour.tourId
GROUP BY Traveling.tourId, Tour.tourName;
