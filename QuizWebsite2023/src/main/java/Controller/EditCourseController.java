package Controller;

import com.Model.quizwebsite2023.Course;
import com.Model.quizwebsite2023.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/EditCourseServlet")
public class EditCourseController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseId = req.getParameter("courseId");

        // Retrieve the course details based on the courseId
        Course course = CourseDAO.getCourseById(courseId);

        // Set the course details in the session
        HttpSession session = req.getSession();
        session.setAttribute("editCourse", course);

        // Redirect to the edit course JSP page
        resp.sendRedirect(req.getContextPath() + "/view/EditPage2.jsp");
    }
}

