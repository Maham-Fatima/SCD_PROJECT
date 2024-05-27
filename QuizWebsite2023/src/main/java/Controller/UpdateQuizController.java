package Controller;

import com.Model.quizwebsite2023.QuizDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateQuizServlet", value = "/UpdateQuizServlet")
public class UpdateQuizController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        String quizName = request.getParameter("quizName");
        String courseId = request.getParameter("courseId");
        boolean updated = false;
        // Update the quiz in the database
        updated = QuizDAO.editQuiz(quizId, quizName, courseId);
        PrintWriter out = response.getWriter();
        if (updated) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to update the Quiz.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
