INSERT INTO Guide (driverLicence, firstName, lastName, phone, vehicleType, title, salary, hireDate)
 VALUES (12345678, 'Steve', 'Jobs', '18005553020', 'amphibious', 'senior guide', 3000.50, to_date('20060725','YYYYMMDD'));
 
-- END Guides

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
-- End Tours

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
-- End Locations
 
 
