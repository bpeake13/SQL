SELECT COUNT(BookedTour.bookedTourId), Guide.firstName, Guide.lastName, Guide.title
FROM Guide, BookedTour
WHERE BookedTour.driverLicense = Guide.driverLicense
GROUP BY BookedTour.driverLicense;
