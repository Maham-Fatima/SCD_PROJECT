package com.Model.quizwebsite2023;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResultDAO {

    public static boolean addResult(Result result) {
        if(!isQuizAttempted(result.getStudentEmail(), result.getQuizId()) ){
            String sql = "INSERT INTO Result (studentEmail, attempt_date, quizId, score, status) VALUES (?, ?, ?, ?, ?)";

            try (Connection connection = DatabaseConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setString(1, result.getStudentEmail());
                statement.setTimestamp(2, result.getAttemptDate());
                statement.setInt(3, result.getQuizId());
                statement.setInt(4, result.getScore());
                statement.setString(5, result.getStatus());

                int rowsAffected = statement.executeUpdate();
                return rowsAffected > 0;

            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately in a real-world application
                return false;
            }
        }
        return false;
    }
    public static boolean isQuizAttempted(String studentEmail, int quizId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM RESULT WHERE studentEmail = ? AND quizId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);
                statement.setInt(2, quizId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    // If there is at least one row in the result set, the quiz has been attempted
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static List<Result> getStudentResultsByEmail(String studentEmail) {
        List<Result> studentResults = new ArrayList<>();
        String SELECT_RESULTS_BY_EMAIL = "SELECT * FROM Result r Join Quiz q on r.quizId = q.quizId WHERE r.studentEmail = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESULTS_BY_EMAIL)) {

            preparedStatement.setString(1, studentEmail);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Result result = new Result();
                    result.setQuizId(resultSet.getInt("quizId"));
                    result.setQuizName(resultSet.getString("quizName"));
                    result.setCourseId(resultSet.getString("courseId"));
                    result.setAttemptDate(resultSet.getTimestamp("attempt_date"));
                    result.setScore(resultSet.getInt("score"));
                    result.setStatus(resultSet.getString("status"));
                    // Add other properties if needed

                    studentResults.add(result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }

        return studentResults;
    }

    public static List<Result> getStudentResults() {
        List<Result> studentResults = new ArrayList<>();
        String SELECT_RESULTS = "SELECT * FROM Result r Join Quiz q on r.quizId = q.quizId";
        try (Connection connection = DatabaseConnection.getConnection();
             Statement preparedStatement = connection.prepareStatement(SELECT_RESULTS )) {

            try (ResultSet resultSet = preparedStatement.executeQuery(SELECT_RESULTS )) {
                while (resultSet.next()) {
                    Result result = new Result();
                    result.setQuizId(resultSet.getInt("quizId"));
                    result.setQuizName(resultSet.getString("quizName"));
                    result.setCourseId(resultSet.getString("courseId"));
                    result.setAttemptDate(resultSet.getTimestamp("attempt_date"));
                    result.setScore(resultSet.getInt("score"));
                    result.setStatus(resultSet.getString("status"));
                    result.setStudentEmail(resultSet.getString("studentEmail"));
                    result.setQuestionNo(resultSet.getInt("QuestionNo"));
                    // Add other properties if needed

                    studentResults.add(result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your application
        }

        return studentResults;
    }
}
