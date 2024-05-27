<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Quiz" %>
<%@ page import="com.Model.quizwebsite2023.QuizDAO" %>
<%@ page import="com.Model.quizwebsite2023.ResultDAO" %>
<%@ page import="Controller.StudentGetCookie" %>

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
                <li><a href="StudentPanel.jsp" target="_blank">Home</a></li>
                <li><a href="About.html" target="_blank">About</a></li>
                <li><a href="Contact.html" target="_blank">Contact</a></li>
                <li><a href="StudentViewNotification.jsp" target="_blank">Notification</a></li>
            </ul>
        </nav>
    </div>
</header>
<%
    // Retrieve the user's email from the cookie using the StudentGetCookie servlet
    StudentGetCookie studentGetCookie = new StudentGetCookie();
    studentGetCookie.doGet(request, response);
    String studentEmail = studentGetCookie.getEmail();
%>
<main>
    <div class="view">
        <h2>View Quizzes</h2>
        <!-- Your search bar goes here -->
        <form action="AttemptQuizStudent.jsp" method="get">
            Search by course Id: <input type="text" name="searchName">
            <input type="submit" value="Search">
        </form>
        <!-- Display the quiz table -->
        <table>
            <tr>
                <th>Quiz Name</th>
                <th>Course ID</th>
                <th>Total Questions</th>
                <th>Status</th>

            </tr>
            <%-- Retrieve and display the quizzes based on the search --%>
            <% List<Quiz> quizzes;
                if (request.getParameter("searchName") != null) {
                    quizzes = QuizDAO.getQuizzesByCourseId(request.getParameter("searchName"), studentEmail);
                } else {
                    System.out.println(studentEmail);
                    quizzes = QuizDAO.getQuizzesByCourseId(null, studentEmail);
                }
            %>
            <% for (Quiz quiz : quizzes) { %>
            <tr>
                <td><%= quiz.getQuizName() %></td>
                <td><%= quiz.getCourseId() %></td>
                <td><%= quiz.getQuestionNo() %></td>
                <td>
                    <%! String message; %>
                    <%-- Check if the quiz has been attempted --%>
                    <%

                        boolean quizAttempted = ResultDAO.isQuizAttempted(studentEmail, quiz.getQuizId());
                        if (quizAttempted) {
                           message ="Attempted";
                        } else {
                            message = "Not Attempted";
                        }
                    %>
                    <%= message%>
                </td>

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
