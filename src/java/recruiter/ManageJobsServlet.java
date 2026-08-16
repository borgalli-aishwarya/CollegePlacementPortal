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

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        List<job> jobs = new ArrayList<job>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            database db = new database();
            con = db.connectDB();

            if (con == null) {
                request.setAttribute(
                        "error",
                        "Database connection failed."
                );

                request.getRequestDispatcher(
                        "managejobs.jsp"
                ).forward(request, response);

                return;
            }

            /*
             * Show ALL jobs.
             */
            String sql =
                    "SELECT id, recruiter_id, title, company, " +
                    "role_type, requirements, technical_skills, " +
                    "duration_months, stipend_salary, deadline " +
                    "FROM jobs " +
                    "ORDER BY id DESC";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                job j = new job();

                j.setId(rs.getInt("id"));
                j.setRecruiterId(rs.getInt("recruiter_id"));
                j.setTitle(rs.getString("title"));
                j.setCompany(rs.getString("company"));
                j.setRoleType(rs.getString("role_type"));
                j.setRequirements(rs.getString("requirements"));
                j.setTechnicalSkills(
                        rs.getString("technical_skills")
                );
                j.setDurationMonths(
                        rs.getInt("duration_months")
                );
                j.setStipendSalary(
                        rs.getString("stipend_salary")
                );
                j.setDeadline(
                        rs.getDate("deadline")
                );

                jobs.add(j);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load jobs: " + e.getMessage()
            );

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (Exception e) {}

            try {
                if (ps != null) ps.close();
            } catch (Exception e) {}

            try {
                if (con != null) con.close();
            } catch (Exception e) {}
        }

        request.setAttribute("jobs", jobs);

        request.getRequestDispatcher(
                "managejobs.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        String action = request.getParameter("action");

        Connection con = null;
        PreparedStatement ps = null;

        try {

            database db = new database();
            con = db.connectDB();

            if (con == null) {
                response.sendRedirect(
                        "ManageJobsServlet?error=db"
                );
                return;
            }

            /*
             * DELETE JOB
             */
            if ("delete".equals(action)) {

                int jobId = Integer.parseInt(
                        request.getParameter("id")
                );

                /*
                 * First delete applications belonging
                 * to this job.
                 */
                String deleteApplications =
                        "DELETE FROM applications " +
                        "WHERE job_id = ? " +
                        "AND job_id IN " +
                        "(SELECT id FROM jobs " +
                        " WHERE id = ? AND recruiter_id = ?)";

                ps = con.prepareStatement(
                        deleteApplications
                );

                ps.setInt(1, jobId);
                ps.setInt(2, jobId);
                ps.setInt(3, recruiterId);

                ps.executeUpdate();

                ps.close();

                /*
                 * Then delete the job.
                 */
                String deleteJob =
                        "DELETE FROM jobs " +
                        "WHERE id = ? AND recruiter_id = ?";

                ps = con.prepareStatement(deleteJob);

                ps.setInt(1, jobId);
                ps.setInt(2, recruiterId);

                int result = ps.executeUpdate();

                if (result > 0) {

                    response.sendRedirect(
                            "ManageJobsServlet?deleted=1"
                    );

                } else {

                    response.sendRedirect(
                            "ManageJobsServlet?error=delete"
                    );
                }

                return;
            }


            /*
             * UPDATE JOB
             */
            if ("update".equals(action)) {

                int jobId = Integer.parseInt(
                        request.getParameter("id")
                );

                String title =
                        request.getParameter("title");

                String company =
                        request.getParameter("company");

                String roleType =
                        request.getParameter("roleType");

                String requirements =
                        request.getParameter("requirements");

                String technicalSkills =
                        request.getParameter("technicalSkills");

                String duration =
                        request.getParameter("duration");

                String salary =
                        request.getParameter("salary");

                String deadline =
                        request.getParameter("deadline");


                String sql =
                        "UPDATE jobs SET " +
                        "title=?, company=?, role_type=?, " +
                        "requirements=?, technical_skills=?, " +
                        "duration_months=?, stipend_salary=?, " +
                        "deadline=? " +
                        "WHERE id=? AND recruiter_id=?";

                ps = con.prepareStatement(sql);

                ps.setString(1, title);
                ps.setString(2, company);
                ps.setString(3, roleType);
                ps.setString(4, requirements);
                ps.setString(5, technicalSkills);

                if (duration == null ||
                    duration.trim().isEmpty()) {

                    ps.setNull(
                            6,
                            java.sql.Types.INTEGER
                    );

                } else {

                    ps.setInt(
                            6,
                            Integer.parseInt(duration)
                    );
                }

                ps.setString(7, salary);

                if (deadline == null ||
                    deadline.trim().isEmpty()) {

                    ps.setNull(
                            8,
                            java.sql.Types.DATE
                    );

                } else {

                    ps.setDate(
                            8,
                            java.sql.Date.valueOf(deadline)
                    );
                }

                ps.setInt(9, jobId);
                ps.setInt(10, recruiterId);

                int result = ps.executeUpdate();

                if (result > 0) {

                    response.sendRedirect(
                            "ManageJobsServlet?updated=1"
                    );

                } else {

                    response.sendRedirect(
                            "ManageJobsServlet?error=update"
                    );
                }

                return;
            }

            response.sendRedirect("ManageJobsServlet");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "ManageJobsServlet?error=exception"
            );

        } finally {

            try {
                if (ps != null) ps.close();
            } catch (Exception e) {}

            try {
                if (con != null) con.close();
            } catch (Exception e) {}
        }
    }
}