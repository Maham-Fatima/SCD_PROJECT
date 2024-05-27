<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp"%>
<%@ page import="com.Model.quizwebsite2023.Question" %>
<%@ page import="com.Model.quizwebsite2023.QuestionDAO" %>

<html>
<head>
    <title>Display Question</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/AttemptQuiz.css">
</head>
<body>
<main>
<%
    String studentEmail = request.getParameter("studentEmail");
    int quizId = Integer.parseInt(request.getParameter("quizId"));
    String questionId = request.getParameter("questionId");
    Question question = QuestionDAO.getQuestion(quizId, questionId);
    session.setAttribute("currentQuestionNo",session.getAttribute("currentQuestionNo"));
    session.setAttribute("numQuestions",session.getAttribute("numQuestions"));
    session.setAttribute("score",session.getAttribute("score"));
%>

<div class="add">
    <h2>Question <%= session.getAttribute("currentQuestionNo") %> of <%= session.getAttribute("numQuestions") %></h2>
    <form action="http://localhost:8080/QuizWebsite2023/AttemptQuizServlet" method="post">
        <label><%= question.getQuestionText() %></label><br>
        <input type="radio" name="selectedOption" value="A"> <%= question.getOptionA() %><br>
        <input type="radio" name="selectedOption" value="B"> <%= question.getOptionB() %><br>
        <input type="radio" name="selectedOption" value="C"> <%= question.getOptionC() %><br>
        <input type="radio" name="selectedOption" value="D"> <%= question.getOptionD() %><br>

        <input type="hidden" name="quizId" value="<%= question.getQuizId() %>">
        <input type="hidden" name="correctOption" value="<%= question.getCorrectOption() %>">
        <input type="hidden" name="questionId" value="<%= question.getQuestionId() %>">
        <input type="hidden" name="studentEmail" value="<%= studentEmail %>">


        <input type="submit" value="Next">
    </form>
</div>
</main>


</body>
</html>
