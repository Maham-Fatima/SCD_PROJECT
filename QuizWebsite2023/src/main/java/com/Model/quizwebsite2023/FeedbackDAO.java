package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {

    public static List<Feedback> getFeedbacksByStudentMail(String studentEmail) {
        List<Feedback> feedbacks = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM FEEDBACK WHERE STUDENTEMAIL = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Feedback feedback = new Feedback();
                        feedback.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        feedback.setQuizId(resultSet.getInt("QUIZID"));
                        feedback.setFeedbackText(resultSet.getString("FEEDBACKTEXT"));
                        feedback.setRating(resultSet.getDouble("RATING"));
                        feedback.setFeedbackTime(resultSet.getTimestamp("FEEDBACKTIME"));
                        feedbacks.add(feedback);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return feedbacks;
    }

    public static List<Feedback> getFeedbacksByQuizId(int quizId) {
        List<Feedback> feedbacks = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM FEEDBACK WHERE QUIZID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, quizId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Feedback feedback = new Feedback();
                        feedback.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        feedback.setQuizId(resultSet.getInt("QUIZID"));
                        feedback.setFeedbackText(resultSet.getString("FEEDBACKTEXT"));
                        feedback.setRating(resultSet.getDouble("RATING"));
                        feedback.setFeedbackTime(resultSet.getTimestamp("FEEDBACKTIME"));
                        feedbacks.add(feedback);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return feedbacks;
    }

    public static List<Feedback> getFeedbacksByCourseName(String courseName) {
        List<Feedback> feedbacks = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT F.* FROM FEEDBACK F " +
                    "JOIN QUIZ Q ON F.QUIZID = Q.QUIZID " +
                    "JOIN COURSE C ON Q.COURSEID = C.COURSEID " +
                    "WHERE C.COURSENAME LIKE ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, "%" + courseName + "%");

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Feedback feedback = new Feedback();
                        feedback.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        feedback.setQuizId(resultSet.getInt("QUIZID"));
                        feedback.setFeedbackText(resultSet.getString("FEEDBACKTEXT"));
                        feedback.setRating(resultSet.getDouble("RATING"));
                        feedback.setFeedbackTime(resultSet.getTimestamp("FEEDBACKTIME"));
                        feedbacks.add(feedback);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return feedbacks;
    }
    public static boolean addFeedback(Feedback feedback) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for inserting a new feedback
            String sql = "INSERT INTO FEEDBACK (STUDENTEMAIL, QUIZID, FEEDBACKTEXT, RATING) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, feedback.getStudentEmail());
                statement.setInt(2, feedback.getQuizId());
                statement.setString(3, feedback.getFeedbackText());
                statement.setDouble(4, feedback.getRating());

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                // Retrieve the generated feedbackId
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM FEEDBACK";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Feedback feedback = new Feedback();
                        feedback.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        feedback.setQuizId(resultSet.getInt("QUIZID"));
                        feedback.setFeedbackText(resultSet.getString("FEEDBACKTEXT"));
                        feedback.setRating(resultSet.getDouble("RATING"));
                        feedback.setFeedbackTime(resultSet.getTimestamp("FEEDBACKTIME"));
                        feedbacks.add(feedback);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return feedbacks;
    }
    // Add methods for updating, and deleting feedback entries if needed
}
