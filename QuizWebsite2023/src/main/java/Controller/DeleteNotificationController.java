package Controller;

import com.Model.quizwebsite2023.NotificationDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteNotificationServlet")
public class DeleteNotificationController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int notificationId = Integer.parseInt(request.getParameter("notificationId"));

        boolean notificationDeleted = NotificationDAO.deleteNotification(notificationId);

        if (notificationDeleted) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message","Failed to delete the Notification.");
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
