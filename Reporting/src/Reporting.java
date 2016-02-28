import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Reporting {
    private static final Logger logger = Logger.getLogger(Reporting.class.getName());
    static {
        // If you need the logger you can enable it here
        logger.setLevel(Level.OFF);
    }

    private static void printUsage() {
        System.out.println(
                "1 – Report Customer Information\n" +
                "2 – Report Tour Guide Information \n" +
                "3 – Report Booked Tour Information\n" +
                "4 – Update Booked Tour Vehicle\n"
        );
    }

    public static void main(String ... args) {
        if (args.length < 3) {
            printUsage();
            System.exit(0);
        }
        final String USERID = args[0];
        final String PASSWORD = args[1];
        final int userOption = Integer.parseInt(args[2]);

        logger.log(Level.INFO, "Starting");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            // This uncaught error will cause main to fail which is what we want
            throw new IllegalStateException("Where is your Oracle JDBC Driver?", e);
        }

        logger.log(Level.INFO, "Oracle JDBC Driver Registered!");
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@oracle.wpi.edu:1521:WPI11grxx", USERID, PASSWORD);
            logger.log(Level.INFO, "Oracle JDBC Driver Connected!");

            try {
                switch (userOption) {
                    case 1:
                        reportCustomerInformation(connection);
                        break;
                    case 2:
                        reportTourGuideInformation(connection);
                        break;
                    case 3:
                        reportBookedTour(connection);
                        break;
                    case 4:
                        updateBookedTourVehicle(connection);
                        break;
                    default:
                        throw new IllegalArgumentException("Invalid user option: " + userOption);
                }
            } catch (SQLException e) {
                throw new IllegalStateException("Failed to run your query", e);
            }

        } catch (SQLException e) {
            // This uncaught error will cause main to fail which is what we want
            throw new IllegalStateException("Creating Connection Failed! Check output console", e);
        } finally {
           CloseThisUtility.closeThis(connection);
        }
    }

    private static void reportCustomerInformation(Connection connection) throws SQLException {
        final int id = UserInputUtility.getAnIntFromUser("Enter Customer ID: ");
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT Customer.* FROM Customer WHERE Customer.customerId = ?");
            statement.setInt(1, id);
            ResultSet resultSet = null;
            try {
                resultSet = statement.executeQuery();
                logger.info("ResultSet returned");
                while (resultSet.next()) {
                    System.out.println("Customer Information");
                    System.out.println("ID: " + resultSet.getInt("customerId"));
                    System.out.println("First name: " + resultSet.getString("firstName"));
                    System.out.println("Last name: " + resultSet.getString("lastName"));
                    System.out.println("Address: " + resultSet.getString("address"));
                    System.out.println("Phone: " + resultSet.getString("phone"));
                    System.out.println("Age: " + resultSet.getInt("age"));
                }
            } finally {
                CloseThisUtility.closeThis(resultSet);
            }
        } finally {
            CloseThisUtility.closeThis(statement);
        }
    }

    private static void reportTourGuideInformation(Connection connection) throws SQLException {
        final int id = UserInputUtility.getAnIntFromUser("Enter Tour Guide Driver License: ");
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT Guide.* FROM Guide WHERE Guide.driverLicense = ?");
            statement.setInt(1, id);
            ResultSet resultSet = null;
            try {
                resultSet = statement.executeQuery();
                logger.info("ResultSet returned");
                while (resultSet.next()) {
                    System.out.println("Tour Guide Information");
                    System.out.println("Driver Licence: " + resultSet.getInt("driverLicense"));
                    System.out.println("First name: " + resultSet.getString("firstName"));
                    System.out.println("Last name: " + resultSet.getString("lastName"));
                    System.out.println("Title: " + resultSet.getString("title"));
                    System.out.println("Vehicle Type: " + resultSet.getString("vehicleType"));
                }
            } finally {
                CloseThisUtility.closeThis(resultSet);
            }
        } finally {
            CloseThisUtility.closeThis(statement);
        }
    }

    private static void reportBookedTour(Connection connection) throws SQLException {
        final int id = UserInputUtility.getAnIntFromUser("Enter Booked Tour ID: ");
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(
                    "SELECT bt.*, c.firstName AS cFirstName, c.lastName AS cLastName, c.age AS cAge, c.customerId, t.*, g.firstName AS gFirstName, g.lastName AS gLastName " +
                            "FROM BookedTour bt, Customer c, Tour t, Guide g " +
                            "WHERE bt.bookedTourId = ? " +
                            "AND bt.customerId = c.customerId " +
                            "AND t.tourId = bt.tourId " +
                            "AND g.driverLicense = bt.driverLicense"
            );
            statement.setInt(1, id);
            ResultSet resultSet = null;
            try {
                resultSet = statement.executeQuery();
                logger.info("ResultSet returned");
                while (resultSet.next()) {
                    System.out.println("Booked Tour Information");
                    System.out.println("Booked Tour ID: " + resultSet.getInt("bookedTourId"));
                    System.out.println("Customer Name: " + resultSet.getString("cFirstName") + " " + resultSet.getString("cLastName"));
                    System.out.println("Customer Age: " + resultSet.getInt("cAge"));
                    System.out.println("People Traveling With");
                    for (Map.Entry<String, Integer> customerId : reportPeopleTravelingWith(connection, resultSet.getInt("customerId")).entrySet()) {
                        System.out.println("\t" + customerId.getKey() + " " + customerId.getValue());
                    }
                    System.out.println("Tour Name: " + resultSet.getString("tourName"));
                    System.out.println("Purchase Date: " + resultSet.getDate("purchaseDate"));
                    System.out.println("Travel Date: " + resultSet.getDate("travelDate"));
                    System.out.println("Tour Guide Name: " + resultSet.getString("gFirstName") + " "  + resultSet.getString("gLastName"));
                    System.out.println("Licence Plate: " + resultSet.getString("licensePlate"));
                    System.out.println("Total Price: " + resultSet.getDouble("totalPrice"));
                }
            } finally {
                CloseThisUtility.closeThis(resultSet);
            }
        } finally {
            CloseThisUtility.closeThis(statement);
        }
    }

    private static Map<String, Integer> reportPeopleTravelingWith(Connection connection, int customerID) throws SQLException {
        final Map<String, Integer> nameAgeMap = new HashMap<String, Integer>();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(
                    "SELECT TravelingWith.* " +
                            "FROM TravelingWith " +
                            "WHERE TravelingWith.customerId = ?"
            );
            statement.setInt(1, customerID);
            ResultSet resultSet = null;
            try {
                resultSet = statement.executeQuery();
                logger.info("ResultSet returned");
                while (resultSet.next()) {
                    nameAgeMap.put(resultSet.getString("firstName") + " " + resultSet.getString("lastName"), resultSet.getInt("age"));
                }
            } finally {
                CloseThisUtility.closeThis(resultSet);
            }
        } finally {
            CloseThisUtility.closeThis(statement);
        }
        return nameAgeMap;
    }

    private static void updateBookedTourVehicle(Connection connection) throws SQLException {
        final int id = UserInputUtility.getAnIntFromUser("Enter Booked Tour ID: ");
        final String newLicencePlate = UserInputUtility.getAStringFromUser("Enter the new vehicle License Plate: ");
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(
                    "UPDATE BookedTour " +
                            "SET BookedTour.licensePlate = ? " +
                            "WHERE BookedTour.bookedTourId = ?"
            );
            statement.setString(1, newLicencePlate);
            statement.setInt(2, id);
            statement.execute();
        } finally {
            CloseThisUtility.closeThis(statement);
        }
    }



    /**
     * Utility class for getting user input from the system input.
     */
    private static class UserInputUtility {
        private static int getAnIntFromUser(String prompt) {
            do {
                try {
                    final Scanner reader = new Scanner(System.in);  // Reading from System.in
                    System.out.println(prompt);
                    return reader.nextInt(); // Scans the next token of the input as an int.
                } catch (InputMismatchException e) {
                    System.err.println("Not an integer.");
                }
            } while (!Thread.currentThread().isInterrupted());
            throw new RuntimeException("Thread was interrupted");
        }

        private static String getAStringFromUser(String prompt) {
            final Scanner reader = new Scanner(System.in);  // Reading from System.in
            System.out.println(prompt);
            return reader.next();
        }
    }


    /**
     * A silly utility class for closing things without throwing exceptions
     * Stupid hack because java 1.6 doesn't support try with resource statements.
     * Also, the autoclosable interface wasn't introduced until java 1.7 otherwise this
     * ridiculousness wouldn't be necessary
     */
    private static class CloseThisUtility {

        private static void closeThis(ResultSet resultSet) {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (Exception e) {
                    // Don't care
                }
            }
        }

        private static void closeThis(Statement statement) {
            if (statement != null) {
                try {
                    statement.close();
                } catch (Exception e) {
                    // Don't care
                }
            }
        }

        private static void closeThis(Connection connection) {
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                    // Don't care
                }
            }
        }
    }

}