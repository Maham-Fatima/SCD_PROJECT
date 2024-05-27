package com.Model.quizwebsite2023;
import java.sql.*;

public class Login {
    public static int i=1;
    public static boolean authenticateAdmin(String Email, String Password) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query
            String sql = "SELECT * FROM ADMINREGISTRATION where EMAIL = ? and PASSWORD = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                System.out.println("Inside Email: " + Email);
                System.out.println("Password: " + Password);
                statement.setString(1, Email);
                statement.setString(2, Password);

                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // If a record is found, authentication is successful
                    boolean hasRow = resultSet.next();
                    System.out.println("result:"+hasRow);
                    return hasRow;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return false;
    }
}
