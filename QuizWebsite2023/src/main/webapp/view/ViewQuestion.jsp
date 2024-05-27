<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.quizwebsite2023.Question" %>
<%@ page import="com.Model.quizwebsite2023.QuestionDAO" %>
<%@ include file="ErrorPage.jsp" %>
<html>
<head>
    <title>View Questions</title>
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
        <h2>View Questions</h2>
        <!-- Your search bar goes here -->
        <form action="ViewQuestion.jsp" method="get">
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
            </tr>
            <%-- Retrieve and display the questions based on the search --%>
            <%  String search=request.getParameter("searchQuizId");
                int id = 0;
                List<Question> questions = null;
                if(search != null)
                {
                    id = Integer.parseInt(search);
                    questions = QuestionDAO.getQuestionsByQuizId(id);
                }else{
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
