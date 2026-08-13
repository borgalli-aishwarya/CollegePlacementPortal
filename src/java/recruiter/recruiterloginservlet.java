package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modell.database;

@WebServlet("/recruiterloginservlet")
public class recruiterloginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            database db = new database();
            con = db.connectDB();

            // Check database connection
            if (con == null) {
                response.getWriter().println(
                        "<h3>Database connection failed.</h3>"
                );
                return;
            }

            String sql = "SELECT id, company_name, email, status "
                       + "FROM recruiters "
                       + "WHERE email=? AND password=?";

            ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {

                // Create session
                HttpSession session = request.getSession();

                // Store recruiter information
                session.setAttribute("recruiterId", rs.getInt("id"));
                session.setAttribute(
                        "companyName",
                        rs.getString("company_name")
                );
                session.setAttribute(
                        "recruiterEmail",
                        rs.getString("email")
                );
                session.setAttribute(
                        "recruiterStatus",
                        rs.getString("status")
                );

                // Login successful
                response.sendRedirect("recruiterDashboard.jsp");

            } else {

                // Login failed
                response.sendRedirect("recruiter_login.jsp");
            }

        } catch (Exception ex) {

            ex.printStackTrace();

            response.getWriter().println("<h3>Login Error</h3>");
            response.getWriter().println("<pre>");
            ex.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
            }
        }
    }
}