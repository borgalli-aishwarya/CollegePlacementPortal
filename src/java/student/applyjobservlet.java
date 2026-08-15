package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modell.database;

@WebServlet(name = "applyjobservlet", urlPatterns = {"/applyjobservlet", "/ApplyJobServlet"})
@MultipartConfig
public class applyjobservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer studentId = (Integer) session.getAttribute("studentId");

        if (studentId == null) {
            response.sendRedirect("student_login.jsp");
            return;
        }

        String jobIdStr = request.getParameter("jobId");
        if (jobIdStr == null || jobIdStr.trim().isEmpty()) {
            response.sendRedirect("jobs.jsp");
            return;
        }
        int jobId = Integer.parseInt(jobIdStr.trim());

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql = "INSERT INTO applications(student_id,job_id,status) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);
            ps.setInt(2, jobId);
            ps.setString(3, "Applied");

            int i = ps.executeUpdate();

            if (i > 0) {

                response.sendRedirect("view_applications.jsp");

            } else {

                response.getWriter().println("Application Failed.");

            }

            ps.close();
            con.close();

        } catch (Exception ex) {

            ex.printStackTrace();
            response.getWriter().println(ex.getMessage());

        }

    }
}