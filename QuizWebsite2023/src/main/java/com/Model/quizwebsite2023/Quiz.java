package com.Model.quizwebsite2023;

public class Quiz {
    private int quizId;
    private String courseId;
    private String quizName;
    private int QuestionNo;

    public int getQuestionNo() {
        return QuestionNo;
    }

    public void setQuestionNo(int questionNo) {
        QuestionNo = questionNo;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }
}
