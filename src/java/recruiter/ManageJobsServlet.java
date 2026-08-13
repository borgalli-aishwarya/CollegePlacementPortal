package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modell.database;
import modell.job;

@WebServlet("/ManageJobsServlet")
public class ManageJobsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        if (recruiterId == null) {
            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        List<job> jobs = new ArrayList<>();

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql =
                    "SELECT * FROM jobs "
                    + "WHERE recruiter_id = ? "
                    + "ORDER BY id DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, recruiterId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                job j = new job();

                j.setId(rs.getInt("id"));
                j.setRecruiterId(
                        rs.getInt("recruiter_id"));
                j.setTitle(
                        rs.getString("title"));
                j.setCompany(
                        rs.getString("company"));
                j.setRoleType(
                        rs.getString("role_type"));
                j.setRequirements(
                        rs.getString("requirements"));
                j.setTechnicalSkills(
                        rs.getString("technical_skills"));
                j.setDurationMonths(
                        rs.getInt("duration_months"));
                j.setStipendSalary(
                        rs.getString("stipend_salary"));
                j.setDeadline(
                        rs.getDate("deadline"));

                jobs.add(j);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load jobs: "
                    + e.getMessage());
        }

        request.setAttribute("jobs", jobs);


        // SUCCESS MESSAGES

        String deleted =
                request.getParameter("deleted");

        String updated =
                request.getParameter("updated");

        String success =
                request.getParameter("success");


        if ("1".equals(deleted)) {

            request.setAttribute(
                    "successMessage",
                    "Job deleted successfully!");

        } else if ("1".equals(updated)) {

            request.setAttribute(
                    "successMessage",
                    "Job updated successfully!");

        } else if ("1".equals(success)) {

            request.setAttribute(
                    "successMessage",
                    "Job added successfully!");
        }


        request.getRequestDispatcher(
                "managejobs.jsp")
                .forward(request, response);
    }
}