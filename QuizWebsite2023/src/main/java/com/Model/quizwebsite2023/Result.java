package com.Model.quizwebsite2023;

import java.sql.Date;
import java.sql.Timestamp;

public class Result {
    private String studentEmail;
    private Timestamp attemptDate;
    private int quizId;
    private int score;
    private String status;

    private String courseId;

    public int getQuestionNo() {
        return QuestionNo;
    }

    public void setQuestionNo(int questionNo) {
        QuestionNo = questionNo;
    }

    private int QuestionNo;
    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getQuizName() {
        return QuizName;
    }

    public void setQuizName(String quizName) {
        QuizName = quizName;
    }

    private String QuizName;

    public Result(String studentEmail, int quizId, int score, String status) {
        this.studentEmail = studentEmail;
        long currentTimeMillis = System.currentTimeMillis();

        // Create a java.util.Date object using the current time
        Date currentDate = new Date(currentTimeMillis);
        this.attemptDate = new Timestamp(currentDate.getTime());
        this.quizId = quizId;
        this.score = score;
        this.status = status;
    }
    public Result(){

    }

    // Getter and Setter methods

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public Timestamp getAttemptDate() {
        return attemptDate;
    }

    public void setAttemptDate(Timestamp attemptDate) {
        this.attemptDate = attemptDate;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
