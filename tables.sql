CREATE TABLE Guide (
	driverLicense NUMBER(10) PRIMARY KEY,
	firstName VCHAR(16) NOT NULL,
	lastName VCHAR(16) NOT NULL,
	phone VCHAR(16) NOT NULL,
	vehicleType CHAR(10) NOT NULL,
	title CHAR(12) NOT NULL,
	salary NUMBER(10, 2) NOT NULL,
	hireDate DATE NOT NULL,
	CONSTRAINT vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT titleVal check(title in ('junior guide', 'guide', 'senior guide')),
	CONSTRAINT salaryVal check(salary >= 0)
);

CREATE TABLE Vehicle (
	licensePlate CHAR(6) PRIMARY KEY,
	vehicleType CHAR(10) NOT NULL,
	make VCHAR(100) NOT NULL,
	model VCHAR(100) NOT NULL,
	year NUMBER(4) NOT NULL,
	maxPassengers NUMBER(3) NOT NULL,
	CONSTRAINT vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT yearVal check(year >= 0),
	CONSTRAINT maxPassengersVal check(maxPassengers >= 1)
);

CREATE TABLE Tour (
	tourId NUMBER(10) PRIMARY KEY,
	tourName VCHAR(100) NOT NULL,
	description VCHAR(1000) NOT NULL,
	city VCHAR(64) NOT NULL,
	state VCHAR(64) NOT NULL,
	duration NUMBER(5) NOT NULL,
	vehicleType CHAR(10) NOT NULL,
	adultCost NUMBER(5, 2) NOT NULL,
	childCost NUMBER(5, 2) NOT NULL,
	CONSTRAINT vehicleTypeVal check(vehicleType in ('car', 'amphibious', 'bus')),
	CONSTRAINT adultCostCheck check(adultCost >= 0),
	CONSTRAINT childCostCheck check(childCost >= 0)
);

CREATE TABLE Location (
	locationId NUMBER(10) PRIMARY KEY,
	locationName VCHAR(100) NOT NULL,
	type CHAR(10) NOT NULL,
	address VCHAR(100) NOT NULL,
	longitude NUMBER(4, 2) NOT NULL,
	laditude NUMBER(4, 2) NOT NULL,
	CONSTRAINT typeVal check(type in ('historic', 'museum', 'resturant'))
);

CREATE TABLE Traveling (
	tourId NUMBER(10) FOREIGN KEY REFERENCES Tour(tourId),
	locationId NUMBER(10) FOREIGN KEY REFERENCES Location(locationId),
	CONSTRAINT pk PRIMARY KEY(tourId, locationId)
);

CREATE TABLE Customer (
	customerId NUMBER(10) PRIMARY KEY,
	firstName VCHAR(16) NOT NULL,
	lastName VCHAR(16) NOT NULL,
	age NUMBER(3) NOT NULL
);

CREATE TABLE BookedTour (
	bookedTourId NUMBER(10) PRIMARY KEY,
	purchaseDate DATE NOT NULL,
	travelDate DATE NOT NULL,
	totalPrice NUMBER(6, 2) NOT NULL,
	tourId NUMBER(10) FOREIGN KEY REFERENCES Tour(tourId),
	driverLicense NUMBER(10) NOT NULL,
	licensePlate CHAR(6) FOREIGN KEY REFERENCES Vehicle(licensePlate),
	customerId NUMBER(10) FOREIGN KEY REFERENCES Customer(customerId)
);