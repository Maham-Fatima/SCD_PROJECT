package Controller;

import com.Model.quizwebsite2023.Question;
import com.Model.quizwebsite2023.QuestionDAO;
import com.Model.quizwebsite2023.Result;
import com.Model.quizwebsite2023.ResultDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/AttemptQuizServlet")
public class AttemptQuizController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the selected option from the form

        String selectedOption = request.getParameter("selectedOption");
        String email =request.getParameter("studentEmail");

        // Get the correct option from the session
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String questionId;

        // Compare the selected option with the correct option
        int score = (selectedOption.equals(request.getParameter("correctOption"))) ? 1 : 0;

        // Update the score in the session
        HttpSession session = request.getSession();
        int currentScore = (int) session.getAttribute("score");
        currentScore += score;
        session.setAttribute("score", currentScore);

        // Redirect to the next question or the result page
        int currentQuestionNo = Integer.parseInt(session.getAttribute("currentQuestionNo").toString());
        int totalQuestions = Integer.parseInt(session.getAttribute("numQuestions").toString());
        session.setAttribute("numQuestions",totalQuestions);

        if (currentQuestionNo < totalQuestions) {
            // Move to the next question
            currentQuestionNo++;
            questionId = "Q"+currentQuestionNo;
            session.setAttribute("currentQuestionNo",currentQuestionNo);
            response.sendRedirect("view/ViewQuestionStudent.jsp?studentEmail=" +
                    email+
                    "&quizId=" + quizId +
                    "&questionId=" + questionId );
        } else {
            // Finish the quiz and store the result in the database
            String studentEmail = request.getParameter("studentEmail");
            int finalScore = (int) session.getAttribute("score");
            String quizStatus = (finalScore >= totalQuestions/2) ? "Pass" : "Fail";
            Result result = new Result(studentEmail, quizId, finalScore, quizStatus);
            boolean output = ResultDAO.addResult(result);
            if(output) {
                // Redirect to the result page
                response.sendRedirect("view/result.jsp?studentEmail=" + studentEmail + "&quizId=" + quizId);
            }
            session.setAttribute("message","Quiz has been already attempted");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
            }
    }
}

