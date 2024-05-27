<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Notification" %>
<%@ page import="com.Model.quizwebsite2023.NotificationDAO" %>
<html>
<head>
    <title>Add Notification</title>
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
        <h2>Add Notification</h2>

        <form action="AddNotification.jsp" method="post">
            Message: <input type="text" name="notification" required><br>
            <input id="add" type="submit" value="Add Notification">
        </form>
    </div>
</main>
<%! String message = "Result appears here"; %>
<%
    try {
        // Get notification details from the form parameters
        String notificationMessage = request.getParameter("notification");

        // Create a NotificationDAO object and add the notification
            Notification notification = new Notification();
            notification.setMessage(notificationMessage);
            if (notification.getMessage() != null) {
            boolean notificationAdded = NotificationDAO.addNotification(notification);
            if (notificationAdded){
                message = "Notification added successfully!";
            } else {
                message = "Fail to add notification!";
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
