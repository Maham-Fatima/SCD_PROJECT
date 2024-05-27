<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Notification" %>
<%@ page import="com.Model.quizwebsite2023.NotificationDAO" %>
<html>
<head>
    <title>View Notifications</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/StdNavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/View.css">
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
    <div class="view">
        <h2>View Notifications</h2>
        <!-- Your search bar goes here -->
        <form action="StudentViewNotification.jsp" method="get">
            Search by Message: <input type="text" name="searchMessage">
            <input type="submit" value="Search">
        </form>
        <!-- Display the notification table -->
        <table>
            <tr>
                <th>Message</th>
                <th>Created At</th>
            </tr>
            <%-- Retrieve and display the notifications based on the search --%>
            <% List<Notification> notifications = NotificationDAO.getNotificationsByMessage(request.getParameter("searchMessage")); %>
            <% for (Notification notification : notifications) { %>
            <tr>
                <td><%= notification.getMessage() %></td>
                <td><%= notification.getCreatedAt() %></td>
            </tr>
            <% } %>
        </table>
    </div>
</main>

<footer>
    <p>Copyright 2023</p>
</footer>

</body>
</html>
