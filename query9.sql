SELECT SUM(M.PARTY_COUNT) AS TOURS_TAKEN
FROM
(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, TravelingWith.customerId AS CUS_ID
FROM Customer, TravelingWith
WHERE TravelingWith.customerId = Customer.customerId
GROUP BY TravelingWith.customerId) M;