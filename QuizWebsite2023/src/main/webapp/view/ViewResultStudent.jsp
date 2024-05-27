<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Result" %>
<%@ page import="com.Model.quizwebsite2023.ResultDAO" %>
<%@ page import="Controller.StudentGetCookie" %>

<html>
<head>
    <title>View Student Results</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/View.css">
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
        <h2>View Student Results</h2>
        <!-- Display the results table -->
        <table>
            <tr>
                <th>Quiz Name</th>
                <th>Course ID</th>
                <th>Attempt Date</th>
                <th>Score</th>
                <th>Status</th>
            </tr>
            <!-- Retrieve and display the student's quiz results -->
            <%
                List<Result> studentResults = ResultDAO.getStudentResultsByEmail(studentEmail);
                for (Result result : studentResults) {
            %>
            <tr>
                <td><%= result.getQuizName()%></td>
                <td><%= result.getCourseId()%></td>
                <td><%= result.getAttemptDate() != null ? result.getAttemptDate() : "N/A" %></td>
                <td><%= result.getScore()%></td>
                <td><%= result.getStatus()%></td>
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