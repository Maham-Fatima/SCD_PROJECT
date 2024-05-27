package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/setCookie")
    public class StudentCookie extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Set a cookie with the user's email
            HttpSession session = request.getSession();
            Cookie cookie = new Cookie("StudentEmail", (String) session.getAttribute("email"));
            cookie.setDomain("localhost");
            cookie.setPath("/QuizWebsite2023");
            response.addCookie(cookie);
            // Set the cookie's max age (in seconds) - this example sets it to expire in 1 hour
            cookie.setMaxAge(60 * 60);

            // Add the cookie to the response
            response.addCookie(cookie);

            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/StudentPanel.jsp");
            // Other processing or forwarding...
        }
    }
