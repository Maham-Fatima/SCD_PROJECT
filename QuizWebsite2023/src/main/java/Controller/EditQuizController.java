package Controller;

import com.Model.quizwebsite2023.Quiz;
import com.Model.quizwebsite2023.QuizDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet("/EditQuizServlet")
public class EditQuizController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String quizId = req.getParameter("quizId");

        // Retrieve the quiz details based on the quizId
        Quiz quiz = QuizDAO.getQuizById(Integer.parseInt(quizId));

        // Set the quiz details in the session
        HttpSession session = req.getSession();
        session.setAttribute("editQuiz", quiz);

        // Redirect to the edit quiz JSP page
        resp.sendRedirect(req.getContextPath() + "/view/EditQuiz2.jsp");
    }
}

