SELECT Vehicle.*
FROM Vehicle, Guide
WHERE Vehicle.vehicleType = Guide.vehicleType
AND Guide.driverLicense = 12345678;
