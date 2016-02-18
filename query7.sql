SELECT Customer.*
FROM Customer, BookedTour
WHERE Customer.customerId = BookedTour.customerId
AND (YEAR(BookedTour.travelDate) = '2015' OR YEAR(BookedTour.travelDate) = '2016');
