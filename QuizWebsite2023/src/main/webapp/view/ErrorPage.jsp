<%--
  Created by IntelliJ IDEA.
  User: Maham
  Date: 16/11/2023
  Time: 12:49 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>

<html>
<head>
    <title>Error Page</title>
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
</style>
<body>
<main class="container">
    <h2>Error occur</h2>
    <p>Error Description:<%= exception%>></p>
</main>
</body>
</html>
