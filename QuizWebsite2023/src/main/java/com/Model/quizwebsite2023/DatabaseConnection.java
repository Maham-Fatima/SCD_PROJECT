package com.Model.quizwebsite2023;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";
    private static final String DB_PASSWORD = "admin";

    // Load the JDBC driver when the class is loaded
    static {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver.");
        }
    }

    // Private constructor to prevent instantiation
    private DatabaseConnection() {}

    // Get a connection to the database
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
    }
}

