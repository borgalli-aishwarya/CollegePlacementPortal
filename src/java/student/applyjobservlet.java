package student;

import modell.database;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/applyjobservlet")
public class applyjobservlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jobId = request.getParameter("jobId");

        HttpSession session = request.getSession();
        String studentEmail = (String) session.getAttribute("studentEmail");

        // Create database object
        database db = new database();

        Connection con = db.connectDB();

        if (con != null) {

            try {

                String sql = "INSERT INTO applications(job_id, student_email, status) VALUES(?,?,?)";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, Integer.parseInt(jobId));
                ps.setString(2, studentEmail);
                ps.setString(3, "Pending");

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("studentDashboard.jsp?msg=Applied Successfully");
                } else {
                    response.sendRedirect("jobs.jsp?msg=Application Failed");
                }

                ps.close();
                con.close();

            } catch (Exception e) {

                e.printStackTrace();
                response.getWriter().println(e);

            }

        } else {

            response.getWriter().println("Database Connection Failed!");

        }

    }
}