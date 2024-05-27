package com.Model.quizwebsite2023;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class EnrollmentDAO {

    public static boolean enrollStudent(String studentEmail, String courseId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for enrolling a student in a course
            String sql = "INSERT INTO Enrollment (studentEmail, courseId) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);
                statement.setString(2, courseId);

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

    public static List<Enrollment> getEnrolledCoursesByEmail(String studentEmail,String courseId) {
        List<Enrollment> enrolledCourses = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {

                // Prepare the SQL query for retrieving enrolled courses by student email
            String sql = "SELECT * FROM Enrollment e join Course c on e.courseId = c.courseId and  studentEmail = ? ";
            if(!Objects.equals(courseId, "")){
                sql = "SELECT * FROM Enrollment e join Course c on e.courseId = c.courseId and  studentEmail = ? and c.courseId=?";
            }
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);
                if (!Objects.equals(courseId, "")){
                    statement.setString(2, courseId);

                }
                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Process the result set and populate the list of enrolled courses
                    while (resultSet.next()) {
                        Enrollment enrollment = new Enrollment();
                        enrollment.setCourseId(resultSet.getString("courseId"));
                        enrollment.setCourseName(resultSet.getString("courseName"));
                        enrollment.setEnrollmentDate(resultSet.getTimestamp("enrollment_date"));
                        enrolledCourses.add(enrollment);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return enrolledCourses;
    }

    public static boolean unEnrollCourse(String studentEmail, String courseId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for un enrolling a student from a course
            String sql = "DELETE FROM Enrollment WHERE studentEmail = ? AND courseId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);
                statement.setString(2, courseId);

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

