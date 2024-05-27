package Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.Model.quizwebsite2023.CourseDAO;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the courseId parameter from the request
        String courseId = request.getParameter("courseId");
        System.out.println("servlet");
        // Call the CourseDAO.deleteCourse method
        boolean courseDeleted = CourseDAO.deleteCourse(courseId);

        // You can set attributes or send a response as needed
        if (courseDeleted) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to delete the course.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
