<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Quiz" %>

<html>
<head>
    <title>Edit Quiz</title>
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
        <h2>Edit Quiz</h2>
        <form action="http://localhost:8080/QuizWebsite2023/UpdateQuizServlet" method="get">
            <%-- Retrieve the quiz details from the session --%>
            <% Quiz quiz = (Quiz) session.getAttribute("editQuiz"); %>
            Quiz ID: <input type="text" name="quizId" value="<%= quiz.getQuizId() %>" readonly><br>
            Quiz Name: <input type="text" name="quizName" value="<%= quiz.getQuizName() %>"><br>
            Course ID: <input type="text" name="courseId" value="<%= quiz.getCourseId() %>"><br>

            <input type="submit" value="Update">
        </form>
    </div>
</main>

<footer>
    <p>Copyright 2023</p>
</footer>

</body>
</html>
