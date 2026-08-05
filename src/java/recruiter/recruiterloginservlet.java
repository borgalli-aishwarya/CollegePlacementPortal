package recruiter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class recruiterloginservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // TODO: RecruitersDAO.validateLogin(email, password)
        if(email.equals("hr@company.com") && password.equals("1234")) {
            HttpSession session = request.getSession();
            session.setAttribute("recruiterEmail", email);
            response.sendRedirect("recruiterDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid login!");
            request.getRequestDispatcher("recruiter_login.jsp").forward(request, response);
        }
    }
}
