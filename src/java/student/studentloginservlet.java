package student;

import javax.servlet.*;
import javax.servlet.http.*;


import java.io.IOException;

public class studentloginservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // TODO: StudentsDAO.validateLogin(email, password)
        if(email.equals("student@test.com") && password.equals("1234")) {
            HttpSession session = request.getSession();
            session.setAttribute("studentEmail", email);
            response.sendRedirect("studentDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid login!");
            request.getRequestDispatcher("student_login.jsp").forward(request, response);
        }
    }
}
