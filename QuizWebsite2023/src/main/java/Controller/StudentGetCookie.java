package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/getCookie")
public class StudentGetCookie extends HttpServlet {
    String userEmail;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the user's email from the cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("StudentEmail")) {
                    userEmail = cookie.getValue();
                    // Use the userEmail as needed
                    break;
                }
            }
        }
    }
    public String getEmail(){
        return userEmail;
    }
}

