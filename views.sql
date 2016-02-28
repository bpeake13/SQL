CREATE OR REPLACE VIEW BookedTourSize AS
SELECT 
BookedTour.bookedTourId AS TOUR_ID,
BookedTour.travelDate AS TRAVEL_DATE,
(CASE
	WHEN SUM(M.PARTY_COUNT) >= 10 
	THEN 'Large'
	ELSE 'Regular'
	END
) AS GROUP_SIZE
FROM 
	BookedTour,
	(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, TravelingWith.customerId AS CUS_ID
	FROM Customer, TravelingWith
	WHERE TravelingWith.customerId = Customer.customerId
	GROUP BY TravelingWith.customerId) M
WHERE BookedTour.customerId = M.CUS_ID
GROUP BY BookedTour.bookedTourId, BookedTour.travelDate;

CREATE OR REPLACE VIEW GetLargeToursAfter03012016 AS
SELECT BookedTour.*
FROM BookedTourSize, BookedTour
WHERE BookedTour.bookedTourId = BookedTourSize.TOUR_ID
AND GROUP_SIZE = 'Large'
AND TRAVEL_DATE >= to_date('20160301','YYYYMMDD');