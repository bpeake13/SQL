SELECT *
FROM
	(SELECT Tour.tourName, COUNT(*)
	FROM BookedTour, Tour
	WHERE BookedTour.tourId = Tour.tourId
	GROUP BY BookedTour.tourId, Tour.tourName
	ORDER BY COUNT(*) DESC)
WHERE ROWNUM = 1;