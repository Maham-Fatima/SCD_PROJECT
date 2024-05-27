<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 14/11/2023
  Time: 1:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>

<html>
<head>
    <title>Login page</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/indexStyle.css">

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
<main>
    <div id="Main-Login">
        <form>

            <button id="feedback" type="button" onclick="location.href='AddFeedback.jsp?&quizId=' + <%= request.getParameter("quizId")%>">Give Feedback</button>
            <button id="back" type="button" onclick="location.href='ViewQuizzesStudent.jsp'">Go back</button>
            <button id="answerSheet" type="button" onclick="location.href='ViewAnswerSheet.jsp&quizId=' + <%= request.getParameter("quizId")%>">View Answers</button>
        </form>
    </div>
</main>
<footer>
    <p>copyright 2023</p>
</footer>

</body>
</html>
