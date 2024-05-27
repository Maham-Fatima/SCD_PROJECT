<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Quiz" %>
<%@ page import="com.Model.quizwebsite2023.QuizDAO" %>

<html>
<head>
    <title>View Quizzes</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/View.css">
    <!-- Add additional CSS files if needed -->
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
    <div class="view">
        <h2>View Quizzes</h2>
        <!-- Your search bar goes here -->
        <form action="ViewQuiz.jsp" method="get">
            Search by Name: <input type="text" name="searchName">
            <input type="submit" value="Search">
        </form>
        <!-- Display the quiz table -->
        <table>
            <tr>
                <th>Quiz ID</th>
                <th>Quiz Name</th>
                <th>Course ID</th>
                <th>Total Questions</th>
                <!-- Add additional columns based on your Quiz class -->
            </tr>
            <%-- Retrieve and display the quizzes based on the search --%>
            <% List<Quiz> quizzes = QuizDAO.getQuizzesByName(request.getParameter("searchName")); %>
            <% for (Quiz quiz : quizzes) { %>
            <tr>
                <td><%= quiz.getQuizId() %></td>
                <td><%= quiz.getQuizName() %></td>
                <td><%= quiz.getCourseId() %></td>
                <td><%= quiz.getQuestionNo() %></td>
                <!-- Add additional columns based on your Quiz class -->
            </tr>
            <% } %>
        </table>
    </div>
</main>

<footer>
    <p>Copyright 2023</p>
</footer>

</body>
</html>
