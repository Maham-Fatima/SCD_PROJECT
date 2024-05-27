package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    public static List<Question> getQuestionsByQuizId(int quizId) {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM Question";
        if (quizId > 0 ){
            sql = "SELECT * FROM QUESTION WHERE quizId = ?";
        }
        try (Connection connection = DatabaseConnection.getConnection()) {

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, quizId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Question question = new Question();
                        question.setQuestionId(resultSet.getString("questionId"));
                        question.setQuizId(resultSet.getInt("quizId"));
                        question.setQuestionText(resultSet.getString("questionText"));
                        question.setOptionA(resultSet.getString("optionA"));
                        question.setOptionB(resultSet.getString("optionB"));
                        question.setOptionC(resultSet.getString("optionC"));
                        question.setOptionD(resultSet.getString("optionD"));
                        question.setCorrectOption(resultSet.getString("correctOption"));
                        questions.add(question);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return questions;
    }
    public static Question getQuestion(int quizId, String questionId) {
        Question question = new Question();
        String sql = "SELECT * FROM QUESTION WHERE quizId = ? and questionId = ?";

        try (Connection connection = DatabaseConnection.getConnection()) {

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, quizId);
                statement.setString(2, questionId);
                try (ResultSet resultSet = statement.executeQuery()) {
                        resultSet.next();
                        question.setQuestionId(questionId);
                        question.setQuizId(quizId);
                        question.setQuestionText(resultSet.getString("questionText"));
                        question.setOptionA(resultSet.getString("optionA"));
                        question.setOptionB(resultSet.getString("optionB"));
                        question.setOptionC(resultSet.getString("optionC"));
                        question.setOptionD(resultSet.getString("optionD"));
                        question.setCorrectOption(resultSet.getString("correctOption"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return question;
    }

    public static boolean addQuestion(Question question) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for inserting a new question
            String sql = "INSERT INTO QUESTION (questionId, quizId, questionText, optionA, optionB, optionC, optionD, correctOption) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, question.getQuestionId());
                statement.setInt(2, question.getQuizId());
                statement.setString(3, question.getQuestionText());
                statement.setString(4, question.getOptionA());
                statement.setString(5, question.getOptionB());
                statement.setString(6, question.getOptionC());
                statement.setString(7, question.getOptionD());
                statement.setString(8, question.getCorrectOption());

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static boolean editQuestion(String questionId, int quizId, String questionText, String optionA,
                                       String optionB, String optionC, String optionD, String correctOption) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "UPDATE QUESTION SET questionText=?, optionA=?, optionB=?, optionC=?, optionD=?, correctOption=? " +
                    "WHERE questionId=? AND quizId=?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, questionText);
                statement.setString(2, optionA);
                statement.setString(3, optionB);
                statement.setString(4, optionC);
                statement.setString(5, optionD);
                statement.setString(6, correctOption);
                statement.setString(7, questionId);
                statement.setInt(8, quizId);

                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM QUESTION";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Question question = new Question();
                    question.setQuestionId(resultSet.getString("questionId"));
                    question.setQuizId(resultSet.getInt("quizId"));
                    question.setQuestionText(resultSet.getString("questionText"));
                    question.setOptionA(resultSet.getString("optionA"));
                    question.setOptionB(resultSet.getString("optionB"));
                    question.setOptionC(resultSet.getString("optionC"));
                    question.setOptionD(resultSet.getString("optionD"));
                    question.setCorrectOption(resultSet.getString("correctOption"));
                    questions.add(question);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return questions;
    }
    public static Question getQuestionById(String questionId) {
        Question question = new Question();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM QUESTION WHERE questionId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, questionId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        question.setQuestionId(resultSet.getString("questionId"));
                        question.setQuizId(resultSet.getInt("quizId"));
                        question.setQuestionText(resultSet.getString("questionText"));
                        question.setOptionA(resultSet.getString("optionA"));
                        question.setOptionB(resultSet.getString("optionB"));
                        question.setOptionC(resultSet.getString("optionC"));
                        question.setOptionD(resultSet.getString("optionD"));
                        question.setCorrectOption(resultSet.getString("correctOption"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return question;
    }

    // Add other methods for updating, deleting, and retrieving a question by ID as needed

}
