-- BEGIN INSERT STATEMENTS

-- Guides!
INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (12345678, 'Steve', 'Jobs', '18005553020', 'amphibious', 'senior guide', 50000.50, to_date('20060725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (22345678, 'Tim', 'Cook', '18005553021', 'bus', 'guide', 2000.53, to_date('20120725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32413323, 'Paul', 'Cook', '18005553023', 'car', 'junior guide', 100.12, to_date('20150725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32424, 'Ken', 'Stanford', '18005553033', 'bus', 'guide', 100.14, to_date('20150726','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (1, 'Gary', 'Pol', '18005553233', 'amphibious', 'senior guide', 60021.14, to_date('20030726','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (2, 'Steve', 'Jobs', '18005553020', 'amphibious', 'senior guide', 50000.50, to_date('20060725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (3, 'Tim', 'Cook', '18005553021', 'bus', 'guide', 2000.53, to_date('20120725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (4, 'Paul', 'Cook', '18005553023', 'car', 'junior guide', 100.12, to_date('20150725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (5, 'Ken', 'Stanford', '18005553033', 'bus', 'guide', 100.14, to_date('20150726','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (6, 'Gary', 'Pol', '18005553233', 'amphibious', 'senior guide', 50021.14, to_date('20030726','YYYYMMDD'));
-- END Guides

-- Vehicles
INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1, 'car', 'Vlogo', 'XL-PL340', 2001, 3);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (12, 'bus', 'Vlogdo', 'XL3-PL344560', 2012, 30);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (123, 'bus', 'Karmi', 'XL3-PL34780', 2012, 60);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1234, 'bus', 'Karami', 'XL3-PL34650', 2015, 23);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1235, 'amphibious', 'DuckBoat', 'XL3-P32L340', 2008, 49);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (2, 'car', 'Vlogo', 'XL-PL340', 2001, 3);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (3, 'bus', 'Vlogdo', 'XL3-PL344560', 2016, 30);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (4, 'bus', 'Karmi', 'XL3-PL34780', 2012, 60);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (5, 'bus', 'Karami', 'XL3-PL34650', 2010, 23);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (6, 'amphibious', 'DuckBoat', 'XL3-P32L340', 2008, 49);
-- END Vehicles

-- Tours!
INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (1, 'Tour A', 'A really, really fun tour', 'Burlington', 'Vermont', 2, 'car', 39, 20);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (2, 'Tour B', 'A really, really, really fun tour', 'Burlington', 'Massachusets', 4, 'amphibious', 50, 23);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (3, 'Tour C', 'A really, really, really, really fun tour', 'Worester', 'Massachusets', 3, 'bus', 49, 21);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (4, 'Tour D', 'A not so fun tour', 'White City', 'Massachusets', 40, 'bus', 499, 300);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (5, 'Tour E', 'The tour of a life time, without the Disney', 'Orlando', 'Florida', 2, 'amphibious', 10.23, 1.99);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (6, 'Tour F', 'Why are you going on this tour?', 'Forks', 'Washington', 99, 'bus', 432, 3.11);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (7, 'Tour A', 'A really, really fun tour', 'Burlington', 'Vermont', 2, 'car', 39, 20);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (8, 'Tour B', 'A really, really, really fun tour', 'Burlington', 'Massachusets', 4, 'amphibious', 50, 23);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (9, 'Tour C', 'A really, really, really, really fun tour', 'Worester', 'Massachusets', 3, 'bus', 49, 21);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (10, 'Tour D', 'A not so fun tour', 'White City', 'Massachusets', 40, 'bus', 499, 300);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (11, 'Tour E', 'The tour of a life time, without the Disney', 'Orlando', 'Florida', 2, 'amphibious', 10.23, 1.99);

INSERT INTO Tour (tourId, tourName, description, city, state, duration, vehicleType, adultCost, childCost)
  VALUES (12, 'Tour F', 'Why are you going on this tour?', 'Forks', 'Washington', 99, 'bus', 432, 3.11);
-- END Tours

-- Locations!
INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (1, 'AppleBees', 'resturant', '100 Infinite Loop Dr.', 49.3234, 43.242234);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (2, 'Apple Trees', 'museum', '101 Infinite Loop Dr.', 949.32234, 23.232433);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (3, 'Apple Keys', 'historic', '102 Infinite Loop Dr.', 84.32231, 12.2432);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (4, 'Apple Seas', 'historic', '103 Infinite Loop Dr.', 249.321, 23.24323);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (5, 'Apple Sneeze', 'resturant', '104 Infinite Loop Dr.', 132.32124, 34.2433);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (6, 'AppleBees', 'resturant', '100 Infinite Loop Dr.', 49.3234, 43.242234);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (7, 'Apple Trees', 'museum', '101 Infinite Loop Dr.', 949.32234, 23.232433);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (8, 'Apple Keys', 'historic', '102 Infinite Loop Dr.', 84.32231, 12.2432);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (9, 'Apple Seas', 'historic', '103 Infinite Loop Dr.', 249.321, 23.24323);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (10, 'Apple Sneeze', 'resturant', '104 Infinite Loop Dr.', 132.32124, 34.2433);
-- END Locations

-- Traveling!
-- Tours 1 and 4 include 2 locations
INSERT INTO Traveling(tourId, locationId)
 VALUES (1, 1);

INSERT INTO Traveling(tourId, locationId)
 VALUES (1, 2);

INSERT INTO Traveling(tourId, locationId)
 VALUES (4, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (4, 2);

-- Tour 2 includes 5 locations
INSERT INTO Traveling(tourId, locationId)
 VALUES (2, 1);

INSERT INTO Traveling(tourId, locationId)
 VALUES (2, 2);

INSERT INTO Traveling(tourId, locationId)
 VALUES (2, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (2, 4);

INSERT INTO Traveling(tourId, locationId)
 VALUES (2, 5);

-- Tour 3 includes 3 locations.
INSERT INTO Traveling(tourId, locationId)
 VALUES (3, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (3, 4);

INSERT INTO Traveling(tourId, locationId)
 VALUES (3, 1);

-- Tours 1 and 4 include 2 locations
INSERT INTO Traveling(tourId, locationId)
 VALUES (5, 1);

INSERT INTO Traveling(tourId, locationId)
 VALUES (5, 2);

INSERT INTO Traveling(tourId, locationId)
 VALUES (9, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (9, 2);

-- Tour 2 includes 5 locations
INSERT INTO Traveling(tourId, locationId)
 VALUES (6, 1);

INSERT INTO Traveling(tourId, locationId)
 VALUES (6, 2);

INSERT INTO Traveling(tourId, locationId)
 VALUES (6, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (6, 4);

INSERT INTO Traveling(tourId, locationId)
 VALUES (6, 5);

-- Tour 3 includes 3 locations.
INSERT INTO Traveling(tourId, locationId)
 VALUES (7, 3);

INSERT INTO Traveling(tourId, locationId)
 VALUES (7, 4);

INSERT INTO Traveling(tourId, locationId)
 VALUES (7, 1);
-- END Traveling

-- Customers with Traveling Companions!
-- Party 1
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (1, 'Joe', 'Shmoe', 32, '100 Joe Shmoe Ln.', 18025553212);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 1, 'Stevey', 'Shmoe', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 1, 'Stacy', 'Shmoe', 11);

-- Party 2
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (2, 'Joe', 'Shmee', 32, '100 Joe Shmee Ln.', 18025553122);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 2, 'Stevey', 'Shmee', 15);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 2, 'Stacy', 'Shmee', 3);

-- Party 3
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (3, 'Joe', 'Shmeegle', 32, '100 Joe Shmeegle Ln.', 18025553322);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 3, 'Stevey', 'Shmeegle', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 3, 'Stacy', 'Shmeegle', 23);

-- Party 4
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (4, 'Joe', 'Mallard', 32, '100 Joe Mallard Pond Ln.', 18025553232);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 4, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 4, 'Stacy', 'Mallard', 23);

-- Party 5
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (5, 'Joe', 'Shmoe', 32, '100 Joe Shmoe Ln.', 18025553212);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 5, 'Stevey', 'Shmoe', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 5, 'Stacy', 'Shmoe', 11);

-- Party 2
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (6, 'Joe', 'Shmee', 32, '100 Joe Shmee Ln.', 18025553122);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 6, 'Stevey', 'Shmee', 15);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 6, 'Stacy', 'Shmee', 3);

-- Party 3
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (7, 'Joe', 'Shmeegle', 32, '100 Joe Shmeegle Ln.', 18025553322);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 7, 'Stevey', 'Shmeegle', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 7, 'Stacy', 'Shmeegle', 23);

-- Party 4
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (8, 'Joe', 'Mallard', 32, '100 Joe Mallard Pond Ln.', 18025553232);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 8, 'Stevey', 'Mallard', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 8, 'Stacy', 'Mallard', 23);


-- Party 5
-- One party of 5
INSERT INTO Customer (customerId, firstName, lastName, age, address, phone)
 VALUES (9, 'Joe', 'Doe', 32, '100 Joe Doe Ln.', 18025553232);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (1, 9, 'Stevey', 'Doe', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (2, 9, 'Stacy', 'Doe', 29);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (3, 9, 'Paula', 'Doe', 21);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (4, 9, 'Kerry', 'Pane', 21);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age)
 VALUES (5, 9, 'Rich', 'Haverhill', 93);
-- END Customers with Traveling Companions

-- Booked Tours
-- One customer has booked 2 Tours
INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(1, to_date('20000726','YYYYMMDD'), to_date('20100726','YYYYMMDD'), 1, 12345678, 1, 1);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(2, to_date('20030726','YYYYMMDD'), to_date('20100727','YYYYMMDD'), 2, 22345678, 12, 1);
-- The rest have booked 1

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(3, to_date('20150726','YYYYMMDD'), to_date('20150728','YYYYMMDD'), 4, 12345678, 1, 2);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(4, to_date('20030726','YYYYMMDD'), to_date('20100729','YYYYMMDD'), 3, 1, 123, 3);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(5, to_date('20150726','YYYYMMDD'), to_date('20160729','YYYYMMDD'), 3, 1, 1235, 4);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(6, to_date('20030726','YYYYMMDD'), to_date('20100712','YYYYMMDD'), 3, 1, 1235, 5);


-- One customer has booked 2 Tours
INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(7, to_date('20000726','YYYYMMDD'), to_date('20100713','YYYYMMDD'), 1, 12345678, 4, 5);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(8, to_date('20030726','YYYYMMDD'), to_date('20150714','YYYYMMDD'), 2, 22345678, 2, 5);
-- The rest have booked 1

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(9, to_date('20150726','YYYYMMDD'), to_date('20150715','YYYYMMDD'), 4, 12345678, 3, 6);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(10, to_date('20030726','YYYYMMDD'), to_date('20100716','YYYYMMDD'), 3, 1, 123, 7);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(11, to_date('20150726','YYYYMMDD'), to_date('20160717','YYYYMMDD'), 3, 1, 6, 8);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(12, to_date('20030726','YYYYMMDD'), to_date('20100718','YYYYMMDD'), 3, 1, 1235, 9);

-- END Booked Tours