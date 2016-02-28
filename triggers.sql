CREATE OR REPLACE TRIGGER limitSeniorGuideSalaryOnInsert 
BEFORE INSERT OR UPDATE ON Guide
FOR EACH ROW
WHEN (NEW.title = 'senior guide' AND NEW.salary < 50000)
DECLARE
	invalid_salary EXCEPTION;
BEGIN
	RAISE invalid_salary;
END;
/

CREATE OR REPLACE TRIGGER limitBusCreationYear
BEFORE INSERT OR UPDATE ON Vehicle
FOR EACH ROW
WHEN (NEW.vehicleType = 'bus' AND NEW.year < 2010)
DECLARE
	invalid_year EXCEPTION;
BEGIN
	RAISE invalid_year;
END;
/

CREATE OR REPLACE TRIGGER limitBostonVehicle
BEFORE INSERT OR UPDATE ON Tour
FOR EACH ROW
WHEN (NEW.city = 'Boston' AND NEW.vehicleType != 'amphibious')
DECLARE
	invalid_vehicle_type EXCEPTION;
BEGIN
	RAISE invalid_vehicle_type;
END;
/

CREATE OR REPLACE TRIGGER autoSetBookedTourDate
BEFORE INSERT ON BookedTour
FOR EACH ROW
BEGIN
	:NEW.purchaseDate := DATEADD(month, 3, GETDATE()
END;
/

CREATE OR REPLACE TRIGGER doNotDoubleBookGuide
BEFORE INSERT OR UPDATE ON BookedTour
FOR EACH ROW
DECLARE
	numberOfToursGivenOnSameDay NUMBER(10);
	invalid_tour_guide EXCEPTION;
BEGIN
	numberOfToursGivenOnSameDay := 0;
	
	SELECT COUNT(BookedTour.travelDate) INTO numberOfToursGivenOnSameDay
	FROM BookedTour
	WHERE BookedTour.driverLicense = :NEW.driverLicense
	AND BookedTour.travelDate = :NEW.travelDate
	GROUP BY BookedTour.travelDate;
	
	IF (numberOfToursGivenOnSameDay > 0) THEN
		RAISE invalid_tour_guide;
	END IF;
END;
/