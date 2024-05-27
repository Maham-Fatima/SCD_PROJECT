<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 14/11/2023
  Time: 1:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp" %>
<%@ page import="com.Model.quizwebsite2023.Course" %>
<%@ page import="com.Model.quizwebsite2023.CourseDAO" %>
<html>
<head>
    <title>Add Course</title>
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
    <h2>Add Course</h2>

    <form action="AddCourse.jsp" method="post">
        Course ID: <input type="text" name="courseId" required><br>
        Course Name: <input type="text" name="courseName" required><br>
        <input id="add" type="submit" value="Add Course">
    </form>
    </div>
</main>
<%! String message = "Result appears here"; %>
<%
    try {
        // Get course details from the form parameters
        String courseId = request.getParameter("courseId");
        String courseName = request.getParameter("courseName");
        // Create a CourseDAO object and add the course
        Course course = new Course();
        course.setCourseId(courseId);
        course.setCourseName(courseName);
        if (course.getCourseId() != null) {

            boolean courseAdded = CourseDAO.addCourse(course);
            if (courseAdded) {
                message = "Course added successfully!";
            } else {
                message = "Failed to add the course.";
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // Handle exceptions appropriately in a real-world application
    }
%>
<script>
    var message = "<%= message %>";
    if (message !== "Result appears here") {
        alert(message);
    }
</script>
<footer>
    <p>copyright 2023</p>
</footer>
</body>
</html>
