<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 26/11/2023
  Time: 7:30 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<html>
<head>
    <title>Failure Message</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
</head>
<style>
    body {
        background-image:
                url('/resources/pics/Background.png');
        background-size: 100% auto;
    }
    .container {
        background-color: #dddddd;
        display: flex;
        flex-direction: column;
        padding: 20px; /* Adjusted padding */
        width: 40vw;
        height: 60vh;
        color:black;
        margin: auto;
        align-items: center;
    }
    .head{
        color: maroon;
    }
</style>
<body>

<main class="container">
    <h2 class="head">Alert</h2>
    <p> <%=session.getAttribute("message")%></p>
</main>
</body>
</html>