<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Question" %>

<html>
<head>
    <title>Update Question</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/NavBarStyle.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/AddQuestion.css">
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
        <h2>Edit Question</h2>
        <form action="http://localhost:8080/QuizWebsite2023/UpdateQuestionServlet" method="get">
            <%-- Retrieve the question details from the session --%>
            <% Question question = (Question) session.getAttribute("editQuestion"); %>
            Question ID: <input type="text" name="questionId" value="<%= question.getQuestionId() %>" readonly><br>
            Quiz ID: <input type="text" name="quizId" value="<%= question.getQuizId() %>" readonly><br>
            Question Text: <input type="text" name="question" value="<%= question.getQuestionText() %>"><br>
            Option A: <input type="text" name="optionA" value="<%= question.getOptionA() %>"><br>
            Option B: <input type="text" name="optionB" value="<%= question.getOptionB() %>"><br>
            Option C: <input type="text" name="optionC" value="<%= question.getOptionC() %>"><br>
            Option D: <input type="text" name="optionD" value="<%= question.getOptionD() %>"><br>
            Correct Option: <input type="text" name="correctOption" value="<%= question.getCorrectOption() %>"><br>
            <input type="submit" value="Update">
        </form>
    </div>
</main>

<footer>
    <p>copyright 2023</p>
</footer>

</body>
</html>
