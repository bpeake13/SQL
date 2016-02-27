import java.sql.*;

public class Reporting {

    public static void main(String ... args) {
        final String USERID = args[0];
        final String PASSWORD = args[1];

        System.out.println("-------Oracle JDBC Connection Testing ---------");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            // This uncaught error will cause main to fail which is what we want
            throw new IllegalStateException("Where is your Oracle JDBC Driver?", e);
        }

        System.out.println("Oracle JDBC Driver Registered!");
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@oracle.wpi.edu:1521:WPI11grxx", USERID, PASSWORD);
            System.out.println("Oracle JDBC Driver Connected!");

            // Performing the query
            Statement stmt = null;
            try {
                stmt = connection.createStatement();
                final String str = "SELECT * FROM CUSTOMER";
                ResultSet rset;
                try {
                    rset = stmt.executeQuery(str);
                    // Process the results
                    while (rset.next()) {
                        final int custID = rset.getInt("ID");
                        final String custName = rset.getString("name");
                        final String city = rset.getString("city");
                        final int age = rset.getInt("age");
                        System.out.println("ID: " + custID + "   Name: " + custName + "   City: " + city + "   Age: " + age);
                    } // end while
                } catch (SQLException e) {
                    throw new IllegalStateException("Acquiring or Processing the ResultSet Failed", e);
                } finally {
                    // We want to always do this whether an exception is thrown or not
                    try {
                        stmt.close();
                    } catch (Exception e) { // This is really bad practice but we have no other choice in java 1.6
                        // We don't care about this exception.
                        // e.printStackTrace(); // You can do this if you really feel like it but you don't need to.
                    }
                }

            } catch (SQLException e) {
                throw new IllegalStateException("Creating the statement failed", e);
            } finally {
                // We want to always do this whether an exception is thrown or not
                try {
                    stmt.close();
                } catch (Exception e) { // This is really bad practice but we have no other choice in java 1.6
                    // We don't care about this exception.
                    // e.printStackTrace(); // You can do this if you really feel like it but you don't need to.
                }
            }

        } catch (SQLException e) {
            // This uncaught error will cause main to fail which is what we want
            throw new IllegalStateException("Creating Connection Failed! Check output console", e);
        } finally {
            // We want to always do this whether an exception is thrown or not
            try {
                connection.close();
            } catch (Exception e) { // This is really bad practice but we have no other choice in java 1.6
                // We don't care about this exception.
                // e.printStackTrace(); // You can do this if you really feel like it but you don't need to.
            }
        }
    }
}