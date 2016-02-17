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
	adultCost NUMBER(5, 2) NOT NULL,
	childCost NUMBER(5, 2) NOT NULL,
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