-- CREATE ALL TABLE STATEMENTS

DROP TABLE Guide CASCADE CONSTRAINTS;
CREATE TABLE Guide (
	driverLicense NUMBER(10) PRIMARY KEY,
	firstName VARCHAR(16) NOT NULL,
	lastName VARCHAR(16) NOT NULL,
	phone VARCHAR(16) NOT NULL,
	vehicleType CHAR(10) NOT NULL,
	title CHAR(12) NOT NULL,
	salary NUMBER(10, 2) NOT NULL,
	hireDate DATE NOT NULL,
	CONSTRAINT Guide_vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT Guide_titleVal check(title in ('junior guide', 'guide', 'senior guide')),
	CONSTRAINT Guide_salaryVal check(salary >= 0)
);

DROP TABLE Vehicle CASCADE CONSTRAINTS;
CREATE TABLE Vehicle (
	licensePlate CHAR(6) PRIMARY KEY,
	vehicleType CHAR(10) NOT NULL,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	year NUMBER(4) NOT NULL,
	maxPassengers NUMBER(3) NOT NULL,
	CONSTRAINT Vehicle_vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT Vehicle_yearVal check(year >= 0),
	CONSTRAINT Vehicle_maxPassengersVal check(maxPassengers >= 1)
);

DROP TABLE Tour CASCADE CONSTRAINTS;
CREATE TABLE Tour (
	tourId NUMBER(10) PRIMARY KEY,
	tourName VARCHAR(100) NOT NULL,
	description VARCHAR(1000) NOT NULL,
	city VARCHAR(64) NOT NULL,
	state VARCHAR(64) NOT NULL,
	duration NUMBER(5) NOT NULL,
	vehicleType CHAR(10) NOT NULL,
	adultCost NUMBER(6, 2) NOT NULL,
	childCost NUMBER(6, 2) NOT NULL,
	CONSTRAINT Tour_vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT Tour_adultCostVal check(adultCost >= 0),
	CONSTRAINT Tour_childCostVal check(childCost >= 0)
);

DROP TABLE Location CASCADE CONSTRAINTS;
CREATE TABLE Location (
	locationId NUMBER(10) PRIMARY KEY,
	locationName VARCHAR(100) NOT NULL,
	type CHAR(10) NOT NULL,
	address VARCHAR(100) NOT NULL,
	longitude NUMBER(9, 6) NOT NULL,
	laditude NUMBER(9, 6) NOT NULL,
	CONSTRAINT Location_typeVal check(type in ('historic', 'museum', 'resturant'))
);

DROP TABLE Traveling CASCADE CONSTRAINTS;
CREATE TABLE Traveling (
	tourId NUMBER(10) NOT NULL,
	locationId NUMBER(10) NOT NULL,
	CONSTRAINT Traveling_pk PRIMARY KEY(tourId, locationId),
	CONSTRAINT Traveling_fk_tourId FOREIGN KEY (tourId) REFERENCES Tour(tourId),
	CONSTRAINT Traveling_fk_locationId FOREIGN KEY (locationId) REFERENCES Location(locationId)
);

DROP TABLE Customer CASCADE CONSTRAINTS;
CREATE TABLE Customer (
	customerId NUMBER(10) PRIMARY KEY,
	firstName VARCHAR(16) NOT NULL,
	lastName VARCHAR(16) NOT NULL,
	age NUMBER(3) NOT NULL,
	address VARCHAR(100) NOT NULL,
	phone VARCHAR(16) NOT NULL,
	CONSTRAINT Customer_ageVal check(age >= 0)
);

DROP TABLE TravelingWith CASCADE CONSTRAINTS;
CREATE TABLE TravelingWith (
	travelingWithId NUMBER(10) NOT NULL,
	customerId NUMBER(10) NOT NULL,
	firstName VARCHAR(16) NOT NULL,
	lastName VARCHAR(16) NOT NULL,
	age NUMBER(3) NOT NULL,
	PRIMARY KEY (travelingWithId, customerId),
	CONSTRAINT TravelingWith_fk_customerId FOREIGN KEY (customerId) REFERENCES Customer(customerId),
	CONSTRAINT TravelingWith_ageVal check(age >= 0)
);

DROP TABLE BookedTour CASCADE CONSTRAINTS;
CREATE TABLE BookedTour (
	bookedTourId NUMBER(10) PRIMARY KEY,
	purchaseDate DATE NOT NULL,
	travelDate DATE NOT NULL,
	totalPrice NUMBER(6, 2),
	tourId NUMBER(10) NOT NULL,
	driverLicense NUMBER(10) NOT NULL,
	licensePlate CHAR(6) NOT NULL,
	customerId NUMBER(10) NOT NULL,
	CONSTRAINT BookedTour_fk_tourId FOREIGN KEY (tourId) REFERENCES Tour(tourId),
	CONSTRAINT BookedTour_fk_licensePlate FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate),
	CONSTRAINT BOokedTour_fk_customerId FOREIGN KEY (customerId) REFERENCES Customer(customerId)
);

DROP TRIGGER "onTourBooked";
CREATE TRIGGER onTourBooked BEFORE INSERT ON BookedTour
FOR EACH ROW
DECLARE
	childCostTemp NUMBER(6, 2);
	adultCostTemp NUMBER(6, 2);
	customerAmount NUMBER(6, 2);
	partySum NUMBER(6, 2);
BEGIN
	SELECT Tour.adultCost INTO adultCostTemp FROM Tour WHERE Tour.tourId = :NEW.tourId;
	SELECT Tour.childCost INTO childCostTemp FROM Tour WHERE Tour.tourId = :NEW.tourId;
	SELECT (CASE WHEN Customer.age >= 18 THEN adultCostTemp ELSE childCostTemp END) INTO customerAmount
	FROM Customer
	WHERE Customer.customerId = :NEW.customerId;
	SELECT SUM(CASE WHEN TravelingWith.age >= 18 THEN adultCostTemp ELSE childCostTemp END) INTO partySum
	FROM TravelingWith
	WHERE TravelingWith.customerId = :NEW.customerId;
	:NEW.totalPrice := customerAmount + partySum;
END;
/

DROP TRIGGER "onTourUpdated";
CREATE TRIGGER onTourUpdated AFTER UPDATE ON Tour
FOR EACH ROW
BEGIN
	UPDATE BookedTour SET BookedTour.totalPrice = 
	(SELECT (CASE WHEN Customer.age >= 18 THEN :NEW.adultCost ELSE :NEW.childCost END)
	FROM Customer
	WHERE Customer.customerId = BookedTour.customerId)
	+
	(SELECT SUM(CASE WHEN TravelingWith.age >= 18 THEN :NEW.adultCost ELSE :NEW.childCost END)
	FROM TravelingWith
	WHERE TravelingWith.customerId = BookedTour.customerId)
	WHERE BookedTour.tourId = :NEW.tourId;
END;
/

-- END CREATE ALL TABLE STATEMENTS

-- BEGIN INSERT STATEMENTS

-- Guides!
INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (12345678, 'Steve', 'Jobs', '18005553020', 'amphibious', 'senior guide', 3000.50, to_date('20060725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (22345678, 'Tim', 'Cook', '18005553021', 'bus', 'guide', 2000.53, to_date('20120725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32413323, 'Paul', 'Cook', '18005553023', 'car', 'junior guide', 100.12, to_date('20150725','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (32424, 'Ken', 'Stanford', '18005553033', 'bus', 'guide', 100.14, to_date('20150726','YYYYMMDD'));

INSERT INTO Guide (driverLicense, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (1, 'Gary', 'Pol', '18005553233', 'amphibious', 'senior guide', 3021.14, to_date('20030726','YYYYMMDD'));
-- END Guides

-- Vehicles
INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1, 'car', 'Vlogo', 'XL-PL340', 2001, 3);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (12, 'bus', 'Vlogdo', 'XL3-PL344560', 2007, 30);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (123, 'bus', 'Karmi', 'XL3-PL34780', 2002, 60);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
 VALUES (1234, 'bus', 'Karami', 'XL3-PL34650', 2009, 23);

INSERT INTO Vehicle(licensePlate, vehicleType, make, model, year, maxPassengers)
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
 VALUES (1, 'AppleBees', 'resturant', '100 Infinite Loop Dr.', 49.3234, 43.242234);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (2, 'Apple Trees', 'museum', '101 Infinite Loop Dr.', 949.32234, 23.232433);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (3, 'Apple Keys', 'historic', '102 Infinite Loop Dr.', 84.32231, 12.2432);

INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (4, 'Apple Seas', 'historic', '103 Infinite Loop Dr.', 249.321, 23.24323);
 
INSERT INTO Location (locationId, locationName, type, address, longitude, laditude)
 VALUES (5, 'Apple Sneeze', 'resturant', '104 Infinite Loop Dr.', 132.32124, 34.2433);
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
-- One party of 5
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
-- One customer has booked 2 Tours
INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(1, to_date('20000726','YYYYMMDD'), to_date('20100726','YYYYMMDD'), 1, 12345678, 1, 1);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(2, to_date('20030726','YYYYMMDD'), to_date('20100726','YYYYMMDD'), 2, 22345678, 12, 1);
-- The rest have booked 1

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(3, to_date('20150726','YYYYMMDD'), to_date('20150728','YYYYMMDD'), 4, 12345678, 1, 2);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(4, to_date('20030726','YYYYMMDD'), to_date('20100726','YYYYMMDD'), 3, 1, 123, 3);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(5, to_date('20150726','YYYYMMDD'), to_date('20160729','YYYYMMDD'), 3, 1, 1235, 4);

INSERT INTO BookedTour (bookedTourId, purchaseDate, travelDate, tourId, driverLicense, licensePlate, customerId)
 VALUES(6, to_date('20030726','YYYYMMDD'), to_date('20100726','YYYYMMDD'), 3, 1, 1235, 5);

-- END Booked Tours


-- END INSERT STATEMENTS

-- Q1 Report vehicles that can carry more than 10 passengers.
SELECT Vehicle.*
FROM Vehicle
WHERE Vehicle.maxPassengers > 10;

-- Q2 For a given tour guide (say TourID = 10), report which of the 5 company vehicles that the tour guide can drive. Assume that the categories are distinct: car license permits driving only of cars, bus license only permits driving of buses, etc.
SELECT Vehicle.*
FROM Vehicle, Guide
WHERE Vehicle.vehicleType = Guide.vehicleType
AND Guide.driverLicense = 12345678;

-- Q3 Report the number of booked tours each customer has. Also include the FirstName, LastName, and Age
SELECT COUNT(BookedTour.bookedTourId), Customer.firstName, Customer.lastName
FROM BookedTour, Customer
WHERE BookedTour.customerId = Customer.customerId
GROUP BY BookedTour.customerId, Customer.firstName, Customer.lastName;

-- Q4 Report the number of booked tours to which each tour guide has been assigned. Also include the FirstName, LastName, and Title of the tour guide.
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

-- Q5 Report the number of each location type (historic, museum, restaurant) along with the tour name that each tour contains.
SELECT 
SUM(CASE WHEN Location.type ='resturant' THEN 1 ELSE 0 END) AS RES_COUNT,
SUM(CASE WHEN Location.type ='museum' THEN 1 ELSE 0 END) AS MUES_COUNT,
SUM(CASE WHEN Location.type ='historic' THEN 1 ELSE 0 END) AS HIS_COUNT,
Tour.tourName
FROM Traveling, Location, Tour
WHERE Traveling.locationId = Location.locationId 
AND Traveling.tourId = Tour.tourId
GROUP BY Traveling.tourId, Tour.tourName;

-- Q6 Report the number of people taking each of the different tours. Include the TourName, City, State and VehicleType. Make sure to count the primary customer as well as those who are traveling along with him or her.
SELECT SUM(M.PARTY_COUNT) AS TOTAL_COUNT, Tour.tourName, Tour.city, Tour.state, Tour.vehicleType
FROM 
	BookedTour,
	Tour,
	(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, TravelingWith.customerId AS CUS_ID
	FROM Customer, TravelingWith
	WHERE TravelingWith.customerId = Customer.customerId
	GROUP BY TravelingWith.customerId) M
WHERE BookedTour.tourId = Tour.tourId
AND BookedTour.customerId = M.CUS_ID
GROUP BY BookedTour.tourId, Tour.tourName, Tour.city, Tour.state, Tour.vehicleType;

-- Q7 Report primary customers who have booked tours in 2015 and 2016.
SELECT Customer.*
FROM Customer, BookedTour
WHERE Customer.customerId = BookedTour.customerId
AND YEAR(BookedTour.travelDate) = '2015'
UNION
SELECT Customer.*
FROM Customer, BookedTour
WHERE Customer.customerId = BookedTour.customerId
AND YEAR(BookedTour.travelDate) = '2016';

-- Q8 Report which is the most popular tour, i.e. the tour that has been booked the most often (appears most often in BookedTours). Do not factor in traveling companions of the primary customer.
SELECT *
FROM
	(SELECT Tour.tourName, COUNT(*)
	FROM BookedTour, Tour
	WHERE BookedTour.tourId = Tour.tourId
	GROUP BY BookedTour.tourId, Tour.tourName
	ORDER BY COUNT(*) DESC)
WHERE ROWNUM = 1;

-- Q9 Report the total number of tours taken by people (primary customers and traveling companions). 
SELECT SUM(M.PARTY_COUNT) AS TOURS_TAKEN
FROM
(SELECT COUNT(TravelingWith.travelingWithId) + 1 AS PARTY_COUNT, TravelingWith.customerId AS CUS_ID
FROM Customer, TravelingWith
WHERE TravelingWith.customerId = Customer.customerId
GROUP BY TravelingWith.customerId) M;

-- Q10 Was done using triggers as the Professor asked us to do in the last class.
