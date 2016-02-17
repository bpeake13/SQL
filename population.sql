-- Guides!
INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (12345678, 'Steve', 'Jobs', '18005553020', 'amphibious', 'senior guide', 3000.50, to_date('20060725','YYYYMMDD'));

INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (22345678, 'Tim', 'Cook', '18005553021', 'bus', 'guide', 2000.53, to_date('20120725','YYYYMMDD'));

INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32413323, 'Paul', 'Cook', '18005553023', 'car', 'junior guide', 100.12, to_date('20150725','YYYYMMDD'));

INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32424, 'Ken', 'Stanford', '18005553033', 'bus', 'guide', 100.14, to_date('20150726','YYYYMMDD'));

INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (1, 'Gary', 'Pol', '18005553233', 'amphibious', 'senior guide', 3021.14, to_date('20030726','YYYYMMDD'));
-- END Guides

-- Vehicles
INSERT INTO Vehicle(licencePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1, 'car', 'Vlogo', 'XL-PL340', 2001, 3);

INSERT INTO Vehicle(licencePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (12, 'bus', 'Vlogdo', 'XL3-PL344560', 2007, 30);

INSERT INTO Vehicle(licencePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (123, 'bus', 'Karmi', 'XL3-PL34780', 2002, 60);

INSERT INTO Vehicle(licencePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1234, 'bus', 'Karami', 'XL3-PL34650', 2009, 23);

INSERT INTO Vehicle(licencePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1235, 'amphibious', 'DuckBoat', 'XL3-P32L340', 2008, 49);
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
-- END Tours

-- Locations!
INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (1, 'AppleBees', 'resturant', '100 Infinite Loop Dr.', 3949.3234, 3242.242);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (2, 'Apple Trees', 'museum', '101 Infinite Loop Dr.', 3949.32234, 3242.243242);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (3, 'Apple Keys', 'historic', '102 Infinite Loop Dr.', 3949.32124, 442.243242);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (4, 'Apple Seas', 'historic', '103 Infinite Loop Dr.', 4949.32124, 442.243242);
 
INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (5, 'Apple Sneeze', 'resturant', '104 Infinite Loop Dr.', 1232.32124, 9435.243242);
-- END Locations
 
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
 VALUES (5, 'Joe', 'Doe', 32, '100 Joe Doe Ln.', 18025553232);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age) 
 VALUES (1, 5, 'Stevey', 'Doe', 12);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age) 
 VALUES (2, 5, 'Stacy', 'Doe', 29);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age) 
 VALUES (3, 5, 'Paula', 'Doe', 21);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age) 
 VALUES (4, 5, 'Kerry', 'Pane', 21);

INSERT INTO TravelingWith(travelingWithId, customerId, firstName, lastName, age) 
 VALUES (5, 5, 'Rich', 'Haverhill', 93);
-- END Customers with Traveling Companions

-- Booked Tours
INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicence, licencePlate, customerId)
 VALUES(1, to_date('20100726','YYYYMMDD'), 1, 12345678, 1, 1);
-- END Booked Tours


