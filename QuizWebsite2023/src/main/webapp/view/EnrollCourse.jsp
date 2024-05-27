<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Course" %>
<%@ page import="com.Model.quizwebsite2023.CourseDAO" %>
<%@ page import="com.Model.quizwebsite2023.EnrollmentDAO" %>
<%@ page import="Controller.StudentGetCookie" %>

<html>
<head>
    <title>Enroll Course</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/EditStyle.css">
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
    <div class="edit">
        <h2>Enroll Course</h2>

        <!-- Display courses in a table -->
        <table >
            <thead>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <!-- Loop through the courses and display each course in a row -->
            <% List<Course> courses = CourseDAO.getCoursesByName(null);
                for (Course course : courses) { %>
            <tr>
                <td><%= course.getCourseId() %></td>
                <td><%= course.getCourseName() %></td>
                <td>
                    <!-- Form to enroll in a specific course -->
                    <form action="EnrollCourse.jsp" method="post">
                        <!-- Hidden input fields for student email and course ID -->
                        <input type="hidden" name="studentEmail" value="<%= studentEmail %>">
                        <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">

                        <!-- Enroll button -->
                        <input type="submit" value="Enroll in Course">
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <!-- Handle the enrollment logic here -->
    <%
        String message = "Result appears here";
        try {
            // Get enrollment details from the form parameters
            String courseId = request.getParameter("courseId");

            // Check if both student email and course ID are provided
            if (studentEmail != null && courseId != null) {
                // Enroll the student in the selected course
                boolean enrolled = EnrollmentDAO.enrollStudent(studentEmail, courseId);
                if (enrolled) {
                    message = "Enrolled successfully!";
                } else {
                    message = "Failed to enroll in the course.";
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
</main>

<footer>
    <p>copyright 2023</p>
</footer>

</body>
</html>
