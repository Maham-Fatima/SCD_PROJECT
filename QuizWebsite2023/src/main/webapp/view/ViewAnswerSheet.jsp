<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Question" %>
<%@ page import="com.Model.quizwebsite2023.QuestionDAO" %>

<html>
<head>
    <title>View Questions</title>
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
        <h2>View Answer Sheet</h2>

        <table>
            <tr>
                <th>Question ID</th>
                <th>Question Text</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Correct Option</th>
            </tr>
            <%-- Retrieve and display the questions based on the search --%>
            <%
                    String id = request.getParameter("quizId");
                    List<Question> questions = QuestionDAO.getQuestionsByQuizId(Integer.parseInt(id));

            %>
            <% for (Question question : questions) { %>
            <tr>
                <td><%= question.getQuestionId() %></td>
                <td><%= question.getQuizId() %></td>
                <td><%= question.getQuestionText() %></td>
                <td><%= question.getOptionA() %></td>
                <td><%= question.getOptionB() %></td>
                <td><%= question.getOptionC() %></td>
                <td><%= question.getOptionD() %></td>
                <td><%= question.getCorrectOption() %></td>
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
