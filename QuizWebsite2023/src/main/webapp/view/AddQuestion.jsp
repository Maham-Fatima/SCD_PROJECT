<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="ErrorPage.jsp" %>
<html>
<head>
    <title>Add Question</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/AddQuestion.css">
</head>
<body>
<%
    // Retrieve values from the session
    int numQuestions = (int) session.getAttribute("numQuestions");
    int currentQuestionNo = (int) session.getAttribute("currentQuestionNo");
%>
<div class="add">
<h2>Add Question <%= currentQuestionNo %> of <%= numQuestions %></h2>

<form action="http://localhost:8080/QuizWebsite2023/AddQuestionServlet" method="get">
    Question <%= currentQuestionNo %>: <input type="text" name="question" required><br>
    Option A: <input type="text" name="optionA" required><br>
    Option B: <input type="text" name="optionB" required><br>
    Option C: <input type="text" name="optionC" required><br>
    Option D: <input type="text" name="optionD" required><br>
    Correct Answer: <select name="correctAnswer" required>
    <option value="A">A</option>
    <option value="B">B</option>
    <option value="C">C</option>
    <option value="D">D</option>
</select><br><br>

    <input type="hidden" name="quizId" value="<%= session.getAttribute("quizId") %>">
    <input type="hidden" name="numQuestions" value="<%= numQuestions %>">
    <input type="hidden" name="currentQuestionNo" value="<%= currentQuestionNo %>">

    <input type="submit" value="Next">
</form>
</div>
</body>
</html>
