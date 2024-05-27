<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Question" %>
<%@ page import="com.Model.quizwebsite2023.QuestionDAO" %>

<html>
<head>
    <title>Edit Question</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/EditStyle.css">
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
    <div class="edit">
        <h2>Edit Question</h2>
        <!-- Your search bar goes here -->
        <form action="EditQuestion.jsp" method="get">
            Search by Quiz ID: <input type="text" name="searchQuizId">
            <input type="submit" value="Search">
        </form>
        <!-- Display the question table -->
        <table>
            <tr>
                <th>Question ID</th>
                <th>Quiz ID</th>
                <th>Question Text</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Correct Option</th>
                <th>Action</th>
            </tr>
            <!-- Retrieve and display the questions based on the search -->
            <%
                String searchQuizId = request.getParameter("searchQuizId");
                List<Question> questions = null;

                if (searchQuizId != null) {
                    questions = QuestionDAO.getQuestionsByQuizId(Integer.parseInt(searchQuizId));
                } else {
                    questions = QuestionDAO.getAllQuestions();
                }
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
                <td>
                    <form action="http://localhost:8080/QuizWebsite2023/EditQuestionServlet" method="get">
                        <input type="hidden" name="questionId" value="<%= question.getQuestionId() %>">
                        <input type="hidden" name="quizId" value="<%= question.getQuizId() %>">
                        <input type="submit" value="Edit">
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
