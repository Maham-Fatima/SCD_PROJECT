<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Course" %>
<%@ page import="com.Model.quizwebsite2023.CourseDAO" %>

<html>
<head>
    <title>View Courses</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
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
                <li><a href="Admin.html" target="_blank">Home</a></li>
                <li><a href="About.html" target="_blank">About</a></li>
                <li><a href="Contact.html" target="_blank">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="view">
        <h2>View Courses</h2>
        <!-- Your search bar goes here -->
        <form action="ViewCourse.jsp" method="get">
            Search by Name: <input type="text" name="searchName">
            <input type="submit" value="Search">
        </form>
        <!-- Display the course table -->
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
            </tr>
            <%-- Retrieve and display the courses based on the search --%>
            <% List<Course> courses = CourseDAO.getCoursesByName(request.getParameter("searchName")); %>
            <% for (Course course : courses) { %>
            <tr>
                <td><%= course.getCourseId() %></td>
                <td><%= course.getCourseName() %></td>
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
