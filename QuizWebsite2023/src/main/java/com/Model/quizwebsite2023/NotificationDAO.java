package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {

    public static List<Notification> getNotificationsByMessage(String searchMessage) {
        List<Notification> notifications = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM NOTIFICATION";
            if (searchMessage != null) {
                searchMessage = searchMessage.toUpperCase();
                sql = "SELECT * FROM NOTIFICATION WHERE UPPER(MESSAGE) LIKE ?";
            }

            // Prepare the SQL query for retrieving notifications by message
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                if (searchMessage != null) {
                    statement.setString(1, "%" + searchMessage + "%");
                }

                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Process the result set and populate the list of notifications
                    while (resultSet.next()) {
                        Notification notification = new Notification();
                        notification.setNotificationId(resultSet.getInt("NOTIFICATIONID"));
                        notification.setMessage(resultSet.getString("MESSAGE"));
                        notification.setCreatedAt(resultSet.getTimestamp("CREATED_AT"));
                        notifications.add(notification);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return notifications;
    }


    public static boolean addNotification(Notification notification) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO NOTIFICATION (notificationID, MESSAGE) VALUES (notification_id_sequence.NEXTVAL, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, notification.getMessage());

                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

    public static boolean deleteNotification(int notificationId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM NOTIFICATION WHERE notificationID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, notificationId);

                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

}
