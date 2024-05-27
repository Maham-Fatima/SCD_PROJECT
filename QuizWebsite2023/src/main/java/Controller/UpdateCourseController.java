package Controller;

import com.Model.quizwebsite2023.CourseDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateCourseServlet", value = "/UpdateCourseServlet")
public class UpdateCourseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        String courseName = request.getParameter("courseName");
        boolean updated = false;
        // Update the course in the database
        updated = CourseDAO.EditCourse(courseId, courseName);
        PrintWriter out = response.getWriter();
        if (updated)
        {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to update the course.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }

}