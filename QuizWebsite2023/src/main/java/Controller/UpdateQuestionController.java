package Controller;

import com.Model.quizwebsite2023.QuestionDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateQuestionServlet", value = "/UpdateQuestionServlet")
public class UpdateQuestionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String questionId = request.getParameter("questionId");
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String questionText = request.getParameter("questionText");
        String optionA = request.getParameter("optionA");
        String optionB = request.getParameter("optionB");
        String optionC = request.getParameter("optionC");
        String optionD = request.getParameter("optionD");
        String correctOption = request.getParameter("correctOption");

        boolean updated = QuestionDAO.editQuestion(questionId, quizId, questionText, optionA, optionB, optionC, optionD, correctOption);

        if (updated) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to update the question.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
