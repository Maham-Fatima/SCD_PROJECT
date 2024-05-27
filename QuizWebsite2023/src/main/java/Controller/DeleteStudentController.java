package Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.Model.quizwebsite2023.StudentDAO;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the studentEmail parameter from the request
        String studentEmail = request.getParameter("studentEmail");

        // Call the StudentDAO.deleteStudent method
        boolean studentDeleted = StudentDAO.deleteStudent(studentEmail);


        if (studentDeleted) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to delete the Student.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
