SELECT COUNT(BookedTour.bookedTourId), Customer.firstName, Customer.lastName
FROM BookedTour, Customer
WHERE BookedTour.customerId = Customer.customerId
GROUP BY BookedTour.customerId;
