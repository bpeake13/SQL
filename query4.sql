SELECT COUNT(BookedTour.bookedTourId) AS TOUR_COUNT, Guide.firstName, Guide.lastName, Guide.title
FROM Guide, BookedTour
WHERE BookedTour.driverLicense = Guide.driverLicense
GROUP BY BookedTour.driverLicense, Guide.firstName, Guide.lastName, Guide.title
UNION
SELECT 0 AS TOUR_COUNT, M.firstName, M.lastName, M.title
FROM
(SELECT Guide.* FROM Guide
MINUS 
SELECT Guide.* FROM Guide, BookedTour WHERE BookedTour.driverLicense = Guide.driverLicense) M;