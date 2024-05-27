<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Feedback" %>
<%@ page import="com.Model.quizwebsite2023.FeedbackDAO" %>

<html>
<head>
    <title>View Feedback</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
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
                <li><a href="Admin.html" target="_blank">Home</a></li>
                <li><a href="About.html" target="_blank">About</a></li>
                <li><a href="Contact.html" target="_blank">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <div class="view">
        <h2>View Feedback</h2>
        <!-- Your search form goes here -->
        <form action="ViewFeedBack.jsp" method="get">
            <select name="searchOption">
                <option value="quizId">Search by Quiz ID</option>
                <option value="studentEmail">Search by Student Email</option>
                <option value="courseName">Search by Course Name</option>
            </select>
            <input type="text" name="searchValue">
            <input type="submit" value="Search">
        </form>
        <!-- Display the feedback table -->
        <table>
            <tr>
                <th>Student Email</th>
                <th>Quiz ID</th>
                <th>Feedback Text</th>
                <th>Rating</th>
                <th>Feedback Time</th>
            </tr>
            <%-- Retrieve and display the feedback based on the search --%>
            <%
                String searchOption = request.getParameter("searchOption");
                String searchValue = request.getParameter("searchValue");
                List<Feedback> feedbacks = null;
                if (searchOption != null && searchValue != null && !searchValue.isEmpty()) {
                    try {
                        if ("quizId".equals(searchOption)) {
                            feedbacks = FeedbackDAO.getFeedbacksByQuizId(Integer.parseInt(searchValue));
                        } else if ("studentEmail".equals(searchOption)) {
                            feedbacks = FeedbackDAO.getFeedbacksByStudentMail(searchValue);
                        } else if ("courseName".equals(searchOption)) {
                            feedbacks = FeedbackDAO.getFeedbacksByCourseName(searchValue);
                        }
                    } catch (NumberFormatException e) {
                        // Handle the case where searchValue is not a valid integer
                        e.printStackTrace(); // Log or handle the exception as needed
                    }
                } else {
                    feedbacks = FeedbackDAO.getAllFeedbacks();
                }
            %>

            <% assert feedbacks != null;
                for (Feedback feedback : feedbacks) { %>
            <tr>
                <td><%= feedback.getStudentEmail() %></td>
                <td><%= feedback.getQuizId() %></td>
                <td><%= feedback.getFeedbackText() %></td>
                <td><%= feedback.getRating() %></td>
                <td><%= feedback.getFeedbackTime() %></td>
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
