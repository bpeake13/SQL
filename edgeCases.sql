-- A really large party
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (13, 'Joe', 'Mallard', 32, '100 Joe Mallard Pond Ln.', 18025553232);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 13, 'Stacy', 'Mallard', 23);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (3, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (4, 13, 'Stacy', 'Mallard', 23);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (5, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (6, 13, 'Stacy', 'Mallard', 23);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (7, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (8, 13, 'Stacy', 'Mallard', 23);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (9, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (10, 13, 'Stacy', 'Mallard', 23);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (11, 13, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (12, 13, 'Stacy', 'Mallard', 23);


INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(13, to_date('20000726','YYYYMMDD'), to_date('20160305','YYYYMMDD'), 1, 12345678, 1, 13);