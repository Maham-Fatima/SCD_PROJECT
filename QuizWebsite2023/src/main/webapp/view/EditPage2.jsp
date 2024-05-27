<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 15/11/2023
  Time: 7:24 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Course" %>
<html>
<head>
    <title>Update Course</title>
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
        <h2>Update Course</h2>
        <form action="http://localhost:8080/QuizWebsite2023/UpdateCourseServlet" method="get">
            <%-- Retrieve the course details from the session --%>
            <% Course course = (Course) session.getAttribute("editCourse"); %>
            Course ID: <input type="text" name="courseId" value="<%= course.getCourseId() %>" readonly><br>
            Course Name: <input type="text" name="courseName" value="<%= course.getCourseName() %>"><br>
            <input type="submit" value="Update">
        </form>
    </div>
</main>
<footer>
    <p>copyright 2023</p>
</footer>

</body>
</html>

