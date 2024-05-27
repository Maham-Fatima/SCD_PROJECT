package com.Model.quizwebsite2023;

import java.sql.Timestamp;

public class Notification {
    private int notificationId;
    private String message;
    private Timestamp CreatedAt;
    // Constructors, getters, and setters

    // Example constructor

    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        CreatedAt = createdAt;
    }
}

