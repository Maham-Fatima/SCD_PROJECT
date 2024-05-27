package Controller;

import com.Model.quizwebsite2023.EnrollmentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/unEnrollCourse")
public class UnEnrollCourseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentGetCookie studentGetCookie = new StudentGetCookie();
        studentGetCookie.doGet(req, resp);
        String studentEmail = studentGetCookie.getEmail();
        boolean result = EnrollmentDAO.unEnrollCourse(studentEmail,req.getParameter("courseId"));
        if (result) {
            resp.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("message","Failed to unenroll the course.");
            resp.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }

    }
}
