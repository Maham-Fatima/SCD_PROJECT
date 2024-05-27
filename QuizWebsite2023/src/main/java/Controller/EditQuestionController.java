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
import java.util.Arrays;

@WebServlet("/EditQuestionServlet")
public class EditQuestionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String questionId = req.getParameter("questionId");

        // Retrieve the question details based on the questionId
        Question question = QuestionDAO.getQuestionById(questionId);

        // Set the question details in the session
        HttpSession session = req.getSession();
        session.setAttribute("editQuestion", question);

        // Redirect to the edit question JSP page
        resp.sendRedirect(req.getContextPath() + "/view/EditQuestion2.jsp");
    }
}

