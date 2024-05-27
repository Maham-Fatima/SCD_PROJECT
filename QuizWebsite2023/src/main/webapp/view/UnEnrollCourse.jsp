<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Enrollment" %>
<%@ page import="com.Model.quizwebsite2023.EnrollmentDAO" %>
<%@ page import="Controller.StudentGetCookie" %>

<html>
<head>
    <title>View Courses</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
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
    <div class="delete">
        <h2>View Courses</h2>
        <!-- Your search bar goes here -->
        <form action="UnEnrollCourse.jsp" method="get">
            Search by course Id: <input type="text" name="searchName">
            <input type="submit" value="Search">
        </form>
        <!-- Display the course table -->
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Enrollment Date</th>
                <th>Action</th>
            </tr>
            <%-- Retrieve and display the courses with enrollment status --%>
            <%
                List<Enrollment> enrolledCourses;
                if (request.getParameter("searchName") != null) {
                    enrolledCourses = EnrollmentDAO.getEnrolledCoursesByEmail(studentEmail, request.getParameter("searchName"));
                } else {
                    enrolledCourses = EnrollmentDAO.getEnrolledCoursesByEmail(studentEmail, ""); // Pass an empty string or null
                }
            %>
            <% for (Enrollment enrollment : enrolledCourses) { %>
            <tr>
                <td><%= enrollment.getCourseId()%></td>
                <td><%= enrollment.getCourseName()%></td>
                <td><%= enrollment.getEnrollmentDate() != null ? enrollment.getEnrollmentDate() : "N/A" %></td>
                <td>
                    <form action="http://localhost:8080/QuizWebsite2023/unEnrollCourse" method="get">
                        <input type="hidden" name="courseId" value="<%= enrollment.getCourseId() %>">
                        <input type="submit" value="Unenroll">
                    </form>
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
