package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {


    public static List<Quiz> getQuizzesByCourseId(String courseId,String studentEmail) {
        List<Quiz> quizzes = new ArrayList<>();


        try (Connection connection = DatabaseConnection.getConnection()) {

            String sql = "SELECT * FROM QUIZ Q Join Enrollment E on q.courseId = E.courseId and E.studentEmail = ?";
            if(courseId != null){
                sql = "SELECT * FROM QUIZ Q Join Enrollment E on q.courseId = E.courseId and E.studentEmail = ? WHERE courseId = ?";
            }
            try (PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setString(1, studentEmail);
                if(courseId != null) {
                    statement.setString(2, courseId);
                }

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        System.out.println("quiz added");
                        Quiz quiz = new Quiz();
                        quiz.setQuizId(resultSet.getInt("quizId"));
                        quiz.setQuizName(resultSet.getString("quizName"));
                        quiz.setCourseId(resultSet.getString("courseId"));
                        quiz.setQuestionNo(resultSet.getInt("questionNo"));
                        quizzes.add(quiz);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return quizzes;
    }

    public static int addQuiz(Quiz quiz) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for inserting a new quiz and retrieving the generated key
            String sql = "INSERT INTO QUIZ (quizId, courseId, quizName, questionNo) VALUES (quiz_id_sequence.NEXTVAL, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, new String[]{"quizId"})) {
                statement.setString(1, quiz.getCourseId());
                statement.setString(2, quiz.getQuizName());
                statement.setInt(3, quiz.getQuestionNo());

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    // Retrieve the generated key (quizId)
                    ResultSet generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        System.out.println(generatedKeys.getInt(1));
                        return generatedKeys.getInt(1);
                    } else {
                        return -1;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        // Return a value (e.g., -1) indicating failure
        return -1;
    }



    public static boolean deleteQuiz(int quizId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for deleting a quiz by ID
            String sql = "DELETE FROM QUIZ WHERE quizId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, quizId);

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

    public static Quiz getQuizById(int quizId) {
        Quiz quiz = new Quiz();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM QUIZ WHERE quizId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, quizId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        quiz.setQuizId(resultSet.getInt("quizId"));
                        quiz.setQuizName(resultSet.getString("quizName"));
                        quiz.setCourseId(resultSet.getString("courseId"));
                        quiz.setQuestionNo(resultSet.getInt("questionNo"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return quiz;
    }
    public static List<Quiz> getQuizzesByName(String searchName) {
        List<Quiz> quizzes = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM QUIZ";
            if (searchName != null) {
                searchName = searchName.toUpperCase();
                sql = "SELECT * FROM QUIZ WHERE UPPER(QUIZNAME) LIKE ?";
            }

            // Prepare the SQL query for retrieving quizzes by name
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                if (searchName != null) {
                    statement.setString(1, "%" + searchName + "%");
                }

                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Process the result set and populate the list of quizzes
                    while (resultSet.next()) {
                        Quiz quiz = new Quiz();
                        quiz.setQuizId(resultSet.getInt("QUIZID"));
                        quiz.setQuizName(resultSet.getString("QUIZNAME"));
                        quiz.setQuestionNo(resultSet.getInt("QUESTIONNO"));
                        quiz.setCourseId(resultSet.getString("courseId"));
                        // Set additional attributes based on your Quiz class
                        quizzes.add(quiz);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return quizzes;
    }

    public static boolean updateQuiz(Quiz quiz) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for updating a quiz
            String sql = "UPDATE QUIZ SET courseId = ?, quizName = ? WHERE quizId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, quiz.getCourseId());
                statement.setString(2, quiz.getQuizName());
                statement.setInt(3, quiz.getQuizId());

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static boolean editQuiz(int quizId, String quizName, String courseId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for updating a quiz by ID
            String sql = "UPDATE QUIZ SET QUIZNAME = ?, COURSEID = ? WHERE QUIZID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, quizName);
                statement.setString(2,courseId);
                statement.setInt(3, quizId);

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

}
