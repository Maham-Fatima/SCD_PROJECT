<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Enrollment" %>
<%@ page import="com.Model.quizwebsite2023.EnrollmentDAO" %>
<%@ page import="Controller.StudentGetCookie" %>

<html>
<head>
    <title>View Enrolled Courses</title>
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
        <h2>View Enrolled Courses</h2>
        <!-- Display the course table -->
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Enrollment Date</th>
            </tr>
            <!-- Retrieve and display the courses with enrollment status -->
            <%
                List<Enrollment> enrolledCourses = EnrollmentDAO.getEnrolledCoursesByEmail(studentEmail, "");
                for (Enrollment enrollment : enrolledCourses) {
            %>
            <tr>
                <td><%= enrollment.getCourseId()%></td>
                <td><%= enrollment.getCourseName()%></td>
                <td><%= enrollment.getEnrollmentDate() != null ? enrollment.getEnrollmentDate() : "N/A" %></td>
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
