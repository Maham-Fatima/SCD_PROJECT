package Controller;

import com.Model.quizwebsite2023.Quiz;
import com.Model.quizwebsite2023.QuizDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AddQuizServlet", value = "/AddQuizServlet")
public class AddQuizController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        String quizName = request.getParameter("quizName");
        int questionNo = Integer.parseInt(request.getParameter("questionNo"));
        Quiz quiz = new Quiz();
        quiz.setCourseId(courseId);
        quiz.setQuizName(quizName);
        quiz.setQuestionNo(questionNo);
        System.out.println("inside servlet");
        int quizAdded = QuizDAO.addQuiz(quiz);
        System.out.println("After DAO");
        int i=0;
        if (quizAdded>=0) {
            // Store quizId in session for later use

            request.getSession().setAttribute("quizId", quizAdded);
            request.getSession().setAttribute("numQuestions", questionNo);
            request.getSession().setAttribute("currentQuestionNo", i+1);
            System.out.println("inside quizADded");
            response.sendRedirect("/QuizWebsite2023/view/AddQuestion.jsp");
        } else {
            response.sendRedirect("/QuizWebsite2023/view/ErrorPage.jsp");
        }
    }
}