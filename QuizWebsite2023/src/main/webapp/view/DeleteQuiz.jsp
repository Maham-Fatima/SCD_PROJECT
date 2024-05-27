<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Quiz" %>
<%@ page import="com.Model.quizwebsite2023.QuizDAO" %>

<html>
<head>
    <title>Delete Quiz</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/DeleteStyle.css">
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
    <div class="delete">
        <h2>Delete Quiz</h2>
        <!-- Your search bar goes here -->
        <form action="DeleteQuiz.jsp" method="get">
            Search by Name: <input type="text" name="searchName">
            <input type="submit" value="Search">
        </form>
        <!-- Display the quiz table -->
        <table>
            <tr>
                <th>Quiz ID</th>
                <th>Quiz Name</th>
                <th>Action</th>
            </tr>
            <%-- Retrieve and display the quizzes based on the search --%>
            <% List<Quiz> quizzes = QuizDAO.getQuizzesByName(request.getParameter("searchName")); %>
            <% for (Quiz quiz : quizzes) { %>
            <tr>
                <td><%= quiz.getQuizId() %></td>
                <td><%= quiz.getQuizName() %></td>
                <td>
                    <form action="http://localhost:8080/QuizWebsite2023/DeleteQuizServlet" method="get">
                        <input type="hidden" name="quizId" value="<%= quiz.getQuizId() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</main>

<footer>
    <p>copyright 2023</p>
</footer>
</body>
</html>
