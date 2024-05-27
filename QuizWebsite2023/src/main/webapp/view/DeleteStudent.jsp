<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Student" %>
<%@ page import="com.Model.quizwebsite2023.StudentDAO" %>

<html>
<head>
    <title>Delete Student</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
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
                <li><a href="Admin.html" target="_blank">Home</a></li>
                <li><a href="About.html" target="_blank">About</a></li>
                <li><a href="Contact.html" target="_blank">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="delete">
    <h2>Delete Student</h2>
    <!-- Your search bar goes here -->
    <form action="DeleteStudent.jsp" method="get">
        Search by Name: <input type="text" name="searchName">
        <input type="submit" value="Search">
    </form>
    <!-- Display the student table -->
    <table>
        <tr>
            <th>Student Email</th>
            <th>Student Name</th>
            <th>Action</th>
        </tr>
        <%-- Retrieve and display the students based on the search --%>
        <% List<Student> students = StudentDAO.getStudentsByName(request.getParameter("searchName")); %>
        <% for (Student student : students) { %>
        <tr>
            <td><%= student.getStudentEmail() %></td>
            <td><%= student.getStudentName() %></td>
            <td>
                <form action="http://localhost:8080/QuizWebsite2023/DeleteStudentServlet" method="get">
                    <input type="hidden" name="studentEmail" value="<%= student.getStudentEmail() %>">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    </div>
</main>

<footer>
    <p>copyright 2023</p>
</footer>
</body>
</html>
