package Controller;

import com.Model.quizwebsite2023.Question;
import com.Model.quizwebsite2023.QuestionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AddQuestionServlet", value = "/AddQuestionServlet")
public class AddQuestionController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int numQuestions = Integer.parseInt(request.getParameter("numQuestions"));
        int currentQuestionNo = Integer.parseInt(request.getParameter("currentQuestionNo"));
        int quizId = Integer.parseInt(request.getParameter("quizId"));

        String questionText = request.getParameter("question");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctAnswer = request.getParameter("correctAnswer");

        // Create a Question object
        Question question = new Question();
        question.setQuizId(quizId);
        question.setQuestionId("Q" + currentQuestionNo);
        question.setQuestionText(questionText);
        question.setOptionA(optionA);
        question.setOptionB(optionB);
        question.setOptionC(optionC);
        question.setOptionD(optionD);
        question.setCorrectOption(correctAnswer);

        // Add the question to the database
        boolean questionAdded = QuestionDAO.addQuestion(question);

        if (questionAdded) {
            // Check if there are more questions to add
            if (currentQuestionNo < numQuestions) {
                // Increment currentQuestionNo and update session attributes
                currentQuestionNo += 1;
                HttpSession session = request.getSession();
                session.setAttribute("currentQuestionNo", currentQuestionNo);

                // Redirect to AddQuestion.jsp for the next question
                response.sendRedirect("/QuizWebsite2023/view/AddQuestion.jsp?quizId=" + quizId +
                        "&numQuestions=" + numQuestions +
                        "&currentQuestionNo=" + currentQuestionNo);
            } else {
                // All questions added, redirect to a success page or next step
                response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
            }
        } else {
            // Failed to add the question, redirect to an error page
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}

