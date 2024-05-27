<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 14/11/2023
  Time: 1:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Student" %>
<%@ page import="com.Model.quizwebsite2023.StudentDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<html>
<head>
    <title>Add Student</title>
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
    <h2>Add Student</h2>
    <form action="AddStudent.jsp" method="post" onsubmit="return validateStudentForm()">
        Student Email: <input type="email" name="studentEmail" required><br>
        Student Name: <input type="text" name="studentName" required><br>
        Password: <input type="password" name="password" required><br>
        Age: <input type="number" name="age" required><br>
        Gender:
        <select name="gender" required>
            <option value="M">Male</option>
            <option value="F">Female</option>
            <option value="O">Other</option>
            <
        </select><br>

        <input type="submit" value="Add Student">
    </form>
    </div>
</main>

<%! String message = "Result appears here"; %>
<%
    try {
        // Get student details from the form parameters
        String studentEmail = request.getParameter("studentEmail");
        String studentName = request.getParameter("studentName");
        String password = request.getParameter("password");
        String ageString = request.getParameter("age");
        int age =0;
        if (ageString != null && !ageString.isEmpty()) {
            age = Integer.parseInt(ageString);
        }
        String gender = request.getParameter("gender");

        if (studentEmail != null) {
        // Create a StudentDAO object and add the student
        Student student = new Student();
        student.setStudentEmail(studentEmail);
        student.setStudentName(studentName);
        student.setPassword(password);
        student.setAge(age);
        java.sql.Date currentDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        student.setStartDate(currentDate);
        student.setGender(gender);

            boolean studentAdded = StudentDAO.addStudent(student);
            if (studentAdded) {
                message = "Student added successfully!";
            } else {
                message = "Failed to add the student.";
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
