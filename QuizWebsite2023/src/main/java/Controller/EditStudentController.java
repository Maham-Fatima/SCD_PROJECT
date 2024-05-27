package Controller;


import com.Model.quizwebsite2023.Student;
import com.Model.quizwebsite2023.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/EditStudentServlet")
public class EditStudentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentEmail = request.getParameter("studentEmail");
        String studentName = request.getParameter("studentName");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");

        // Create a Student object with the updated details
        Student updatedStudent = new Student();
        updatedStudent.setStudentEmail(studentEmail);
        updatedStudent.setStudentName(studentName);
        updatedStudent.setPassword(password);
        updatedStudent.setAge(age);
        updatedStudent.setGender(gender);

        // Call the DAO function to edit student details
        boolean success = StudentDAO.editStudent(updatedStudent);

        // Redirect back to the edit page with a success message
        if (success) {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Success.jsp");
        } else {
            response.sendRedirect("http://localhost:8080/QuizWebsite2023/view/Failure.jsp");
        }
    }
}
