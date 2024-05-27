<%@ page import="com.Model.quizwebsite2023.Course" %>
<%@ page import="com.Model.quizwebsite2023.CourseDAO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<html>
<head>
    <title>Add Quiz</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/add.css">
</head>
<body>

<header>
    <div class="bar">
        <nav>
            <div class="logo">
                <img src="../resources/pics/websiteLogo.png" alt="logo">
            </div>

            <ul>
                <li><a href="Admin.html" target="_blank">Home</a></li>
                <li><a href="About.html" target="_blank">About</a></li>
                <li><a href="Contact.html" target="_blank">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="add">
        <h2>Add Quiz</h2>
        <form action="http://localhost:8080/QuizWebsite2023/AddQuizServlet" method="post">

            Select Course:
            <select name="courseId" required>
                <% List<Course> courses = CourseDAO.getCoursesByName(null); %>
                <% for (Course course : courses) { %>
                <option value="<%= course.getCourseId() %>"><%= course.getCourseName() %></option>
                <% } %>
            </select><br>
            Quiz Name: <input type="text" name="quizName" required><br>
            Question No: <input type="number" name="questionNo" required><br>
            <input id="add" type="submit" value="Add Quiz">
        </form>
    </div>
</main>

<footer>
    <p>copyright 2023</p>
</footer>
</body>
</html>
