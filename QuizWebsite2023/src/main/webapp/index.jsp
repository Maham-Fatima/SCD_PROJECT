<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 14/11/2023
  Time: 1:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="view/ErrorPage.jsp"%>
<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" type="text/css" href="resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="resources/css/indexStyle.css">

</head>

<body>

<header>
    <div class="bar">
        <nav>
            <div class="logo">
                <img src="resources/pics/websiteLogo.png" alt="logo">
            </div>

            <ul>
                <li><a href="view/About.html" target="_blank">About</a></li>
                <li><a href="view/Contact.html" target="_blank">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>
<main>
    <div id="Main-Login">
    <form>
        <button id="admin" type="button" onclick="location.href='view/AdminLogin.jsp'">Admin Login</button>
        <button id="student" type="button" onclick="location.href='view/StudentLogin.jsp'">Student Login</button>
    </form>
    </div>
</main>
<footer>
    <p>copyright 2023</p>
</footer>

</body>
</html>
