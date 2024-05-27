<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.StudentDAO" %>

<html>
<head>
    <title>Student Login</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/AdminLoginStyle.css">
</head>
<body>
<div id="login">
    <h1>Student Login</h1>
    <form action="StudentLogin.jsp" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <input id="login-button" type="submit" value="Login"><br>
        <a href="RegisterStudent.jsp">Don't have an account click here to register </a>
    </form>
</div>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email != null && password != null) {
        if (StudentDAO.authenticateStudent(email, password)) {
            System.out.println("Authentication succeeded");
            session.setAttribute("email",email);
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/setCookie");
            return;
        } else {
            System.out.println("Authentication failed");
        }
    }
%>

</body>
</html>
