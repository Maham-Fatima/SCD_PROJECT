package Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.Model.quizwebsite2023.QuizDAO;

@WebServlet("/DeleteQuizServlet")
public class DeleteQuizController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the quizId parameter from the request
        int quizId = Integer.parseInt(request.getParameter("quizId"));

        // Call the QuizDAO.deleteQuiz method
        boolean quizDeleted = QuizDAO.deleteQuiz(quizId);

        // You can set attributes or send a response as needed
        if (quizDeleted) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to delete the Quiz.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
