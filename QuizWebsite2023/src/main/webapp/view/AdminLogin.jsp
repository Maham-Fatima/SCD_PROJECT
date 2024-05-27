<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Login" %>

<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/AdminLoginStyle.css">
</head>
<body>
<div id="login">
    <h1>Admin Login</h1>
<form action="AdminLogin.jsp" method="post">
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <input id="login-button" type="submit" value="Login">
</form>
</div>
<%
    //Login login = new Login();
    String email = request.getParameter("email");
    String password = request.getParameter("password");


    if (email != null && password != null) {


        if (Login.authenticateAdmin(email, password)) {
            System.out.println("Authentication succeeded");
            response.sendRedirect("Admin.html");
            return;
        } else {
            System.out.println("Authentication failed");
        }
    }

%>
</body>
</html>
