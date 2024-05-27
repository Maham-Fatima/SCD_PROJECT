<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Feedback" %>
<%@ page import="com.Model.quizwebsite2023.FeedbackDAO" %>
<%@ page import="Controller.StudentGetCookie" %>
<html>
<head>
    <title>Add Feedback</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/add.css">
</head>

<body>
<%
    StudentGetCookie studentGetCookie = new StudentGetCookie();
    studentGetCookie.doGet(request, response);
    String studentEmail = studentGetCookie.getEmail();
%>
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
    <div class="add">
        <h2>Add Feedback</h2>

        <form action="AddFeedback.jsp" method="post">
            Student Email: <input type="text" name="studentEmail" value="<%= studentEmail%>" readonly><br>
            Quiz ID: <input type="text" name="quizId" value="<%= request.getParameter("quizId")%>" readonly><br>
            Feedback Text: <textarea name="feedbackText" required></textarea><br>
            Rating: <input type="text" name="rating" required><br>
            <input id="add" type="submit" value="Add Feedback">
        </form>
    </div>
</main>
<%! String message = "Result appears here"; %>
<%
    try {
        // Get feedback details from the form parameters
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String feedbackText = request.getParameter("feedbackText");
        double rating = Double.parseDouble(request.getParameter("rating"));

        // Create a Feedback object and add the feedback
        if(feedbackText != null) {
            Feedback feedback = new Feedback();
            feedback.setStudentEmail(studentEmail);
            feedback.setQuizId(quizId);
            feedback.setFeedbackText(feedbackText);
            feedback.setRating(rating);
            boolean feedbackAdded = FeedbackDAO.addFeedback(feedback);
            if (feedbackAdded) {
                message = "Feedback added successfully!";
            } else {
                message = "Failed to add the feedback.";
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
