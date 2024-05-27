package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
    public static boolean authenticateStudent(String email, String password) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query
            String sql = "SELECT * FROM Student WHERE studentEmail  = ? AND PASSWORD = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                System.out.println("Inside Email: " + email);
                System.out.println("Password: " + password);
                statement.setString(1, email);
                statement.setString(2, password);

                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // If a record is found, authentication is successful
                    boolean hasRow = resultSet.next();
                    System.out.println("result:" + hasRow);
                    return hasRow;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return false;
    }


    public static List<Student> getStudentsByName(String searchName) {
        List<Student> students = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM STUDENT";
            if (searchName != null) {
                searchName = searchName.toUpperCase();
                sql = "SELECT * FROM STUDENT WHERE UPPER(STUDENTNAME) LIKE ?";
            }
            // Prepare the SQL query for retrieving students by name
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                if (searchName != null) {
                    statement.setString(1, searchName);
                }
                // Execute the query
                try (ResultSet resultSet = statement.executeQuery()) {
                    // Process the result set and populate the list of students
                    while (resultSet.next()) {
                        Student student = new Student();
                        student.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        student.setStudentName(resultSet.getString("STUDENTNAME"));
                        student.setPassword(resultSet.getString("PASSWORD"));
                        student.setAge(resultSet.getInt("AGE"));
                        student.setStartDate(resultSet.getDate("STARTDATE"));
                        student.setGender(resultSet.getString("GENDER"));
                        students.add(student);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return students;
    }

    public static boolean addStudent(Student student) {
        try (Connection connection = DatabaseConnection.getConnection()) {
                // Prepare the SQL query for inserting a new student
                String sql = "INSERT INTO STUDENT (STUDENTEMAIL, STUDENTNAME, PASSWORD, AGE, STARTDATE, GENDER) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, student.getStudentEmail());
                    statement.setString(2, student.getStudentName());
                    statement.setString(3, student.getPassword());
                    statement.setInt(4, student.getAge());
                    statement.setDate(5, student.getStartDate());

                    statement.setString(6, student.getGender());

                    // Execute the query
                    int rowsAffected = statement.executeUpdate();

                    return rowsAffected > 0;
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately in a real-world application
                return false;
            }
        }



    public static boolean deleteStudent(String studentEmail) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for deleting a student by email
            String sql = "DELETE FROM STUDENT WHERE STUDENTEMAIL = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

    public static Student getStudentByEmail(String studentEmail) {
        Student student = new Student();

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM STUDENT WHERE STUDENTEMAIL = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentEmail);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        System.out.println("found");
                        student.setStudentEmail(resultSet.getString("STUDENTEMAIL"));
                        student.setStudentName(resultSet.getString("STUDENTNAME"));
                        student.setPassword(resultSet.getString("PASSWORD"));
                        student.setAge(resultSet.getInt("AGE"));
                        student.setGender(resultSet.getString("GENDER"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
        }

        return student;
    }

    public static boolean editStudent(Student student) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for updating a student
            String sql = "UPDATE STUDENT SET STUDENTNAME = ?, PASSWORD = ?, AGE = ?, GENDER = ? WHERE STUDENTEMAIL = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, student.getStudentName());
                statement.setString(2, student.getPassword());
                statement.setInt(3, student.getAge());
                statement.setString(4, student.getGender());
                statement.setString(5, student.getStudentEmail());

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
