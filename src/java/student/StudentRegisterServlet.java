package student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class StudentRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // TODO: StudentsDAO.insertStudent(name, email, password)
        System.out.println("Registering student: " + name + ", " + email);

        response.sendRedirect("student_login.jsp");
    }
}
