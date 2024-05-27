<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Notification" %>
<%@ page import="com.Model.quizwebsite2023.NotificationDAO" %>

<html>
<head>
    <title>Delete Notification</title>
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
        <h2>Delete Notification</h2>
        <!-- Your search bar goes here -->
        <form action="DeleteNotification.jsp" method="get">
            Search by Message: <input type="text" name="searchMessage">
            <input type="submit" value="Search">
        </form>
        <!-- Display the notification table -->
        <table>
            <tr>
                <th>Notification ID</th>
                <th>Message</th>
                <th>Created At</th>
                <th>Action</th>
            </tr>
            <%-- Retrieve and display the notifications based on the search --%>
            <% List<Notification> notifications = NotificationDAO.getNotificationsByMessage(request.getParameter("searchMessage")); %> %>
            <% for (Notification notification : notifications) { %>
            <tr>
                <td><%= notification.getNotificationId() %></td>
                <td><%= notification.getMessage() %></td>
                <td><%= notification.getCreatedAt() %></td>
                <td>
                    <form action="http://localhost:8080/QuizWebsite2023/DeleteNotificationServlet" method="get">
                        <input type="hidden" name="notificationId" value="<%= notification.getNotificationId() %>">
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
