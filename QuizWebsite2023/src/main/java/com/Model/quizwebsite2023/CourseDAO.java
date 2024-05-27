package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {


        public static List<Course> getCoursesByName(String searchName) {
            List<Course> courses = new ArrayList<>();

            try (Connection connection = DatabaseConnection.getConnection()) {
                String sql = "SELECT * FROM COURSE";
                if (searchName != null){
                    searchName=searchName.toUpperCase();
                    sql = "SELECT * FROM COURSE WHERE UPPER(COURSENAME) LIKE ?";
                }
                // Prepare the SQL query for retrieving courses by name
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    if(searchName!=null) {
                        statement.setString(1, searchName);
                    }
                    // Execute the query
                    try (ResultSet resultSet = statement.executeQuery()) {
                        // Process the result set and populate the list of courses
                        while (resultSet.next()) {
                            Course course = new Course();
                            course.setCourseId(resultSet.getString("COURSEID"));
                            course.setCourseName(resultSet.getString("COURSENAME"));
                            courses.add(course);
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            }

            return courses;
        }

    public static boolean addCourse(Course course) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for inserting a new course
            String sql = "INSERT INTO COURSE (COURSEID, COURSENAME) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, course.getCourseId());
                statement.setString(2, course.getCourseName());
                System.out.println(course.getCourseId());
                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }
    public static boolean deleteCourse(String courseId) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for deleting a course by ID
            String sql = "DELETE FROM COURSE WHERE COURSEID = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, courseId);

                // Execute the query
                int rowsAffected = statement.executeUpdate();

                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            return false;
        }
    }

        public static Course getCourseById(String courseId) {
            Course course = new Course();

            try (Connection connection = DatabaseConnection.getConnection()) {
                String sql = "SELECT * FROM COURSE WHERE COURSEID = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, courseId);

                    try (ResultSet resultSet = statement.executeQuery()) {
                        if (resultSet.next()) {
                            course.setCourseId(resultSet.getString("COURSEID"));
                            course.setCourseName(resultSet.getString("COURSENAME"));
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately in a real-world application
            }

            return course;
        }


    public static boolean EditCourse(String courseId,String courseName) {
        try (Connection connection = DatabaseConnection.getConnection()) {
            // Prepare the SQL query for deleting a course by ID
            String sql = "UPDATE COURSE set COURSENAME = ? where CourseId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, courseName);
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

