package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modell.database;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer recruiterId = (Integer) session.getAttribute("recruiterId");

        if (recruiterId == null) {
            response.sendRedirect("recruiterLogin.jsp");
            return;
        }

        String title = request.getParameter("title");
        String company = request.getParameter("companyName");
        String roleType = request.getParameter("roleType");
        String requirements = request.getParameter("requirements");
        String technicalSkills = request.getParameter("technicalSkills");
        String duration = request.getParameter("duration");
        String salary = request.getParameter("salary");
        String deadline = request.getParameter("deadline");

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql = "INSERT INTO jobs(recruiter_id,title,company,role_type,requirements,technical_skills,duration_months,stipend_salary,deadline) VALUES(?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, recruiterId);
            ps.setString(2, title);
            ps.setString(3, company);
            ps.setString(4, roleType);
            ps.setString(5, requirements);
            ps.setString(6, technicalSkills);
            ps.setInt(7, Integer.parseInt(duration));
            ps.setString(8, salary);
            ps.setString(9, deadline);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("recruiterDashboard.jsp");
            } else {
                response.getWriter().println("Job Posting Failed");
            }

            ps.close();
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println(ex.getMessage());
        }
    }
}