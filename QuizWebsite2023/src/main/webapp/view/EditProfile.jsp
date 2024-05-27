<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Student" %>
<%@ page import="com.Model.quizwebsite2023.StudentDAO" %>
<%@ page import="Controller.StudentGetCookie" %>


<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/EditStyle.css">
</head>

<body>

<%
    StudentGetCookie studentGetCookie = new StudentGetCookie();
    studentGetCookie.doGet(request, response);
    String studentEmail = studentGetCookie.getEmail();
    Student student = StudentDAO.getStudentByEmail(studentEmail);
%>
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
<main class="edit">
    <h2>Edit Student Details</h2>

    <form action="http://localhost:8080/QuizWebsite2023/EditStudentServlet" method="get">
        <!-- Display existing student details in the form -->
        <input type="hidden" name="studentEmail" value="<%= student.getStudentEmail() %>">
        Student Name: <input type="text" name="studentName" value="<%= student.getStudentName() %>" required><br>
        Password: <input type="password" name="password" value="<%= student.getPassword() %>" required><br>
        Age: <input type="number" name="age" value="<%= student.getAge() %>" required><br>
        Gender: <input type="text" name="gender" value="<%= student.getGender() %>" required><br>

        <input type="submit" value="Save Changes">
    </form>
</main>
<footer>
    <p>copyright 2023</p>
</footer>
</body>
</html>
