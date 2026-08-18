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

        response.setContentType("text/html;charset=UTF-8");

        // ================= SESSION =================

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        String companyName =
                (String) session.getAttribute("companyName");

        // ================= FORM VALUES =================

        String title = request.getParameter("title");

        String roleType = request.getParameter("roleType");

        String otherRole = request.getParameter("otherRole");

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

        // ================= ROLE CHECK =================

        if (roleType == null ||
                roleType.trim().isEmpty() ||
                roleType.equals("Select Role")) {

            response.getWriter().println(
                    "<h3>Please select a Role.</h3>"
            );
            return;
        }

        // If Other is selected, use manually entered role
        if (roleType.equals("Other")) {

            if (otherRole == null ||
                    otherRole.trim().isEmpty()) {

                response.getWriter().println(
                        "<h3>Please enter your role.</h3>"
                );
                return;
            }

            roleType = otherRole.trim();
        }

        // ================= BASIC VALIDATION =================

        if (title == null ||
                title.trim().isEmpty()) {

            response.getWriter().println(
                    "<h3>Please enter Job Title.</h3>"
            );
            return;
        }

        if (companyName == null ||
                companyName.trim().isEmpty()) {

            response.getWriter().println(
                    "<h3>Company name is missing from session.</h3>"
            );
            return;
        }

        // ================= DATABASE =================

        Connection con = null;
        PreparedStatement ps = null;

        try {

            database db = new database();

            con = db.connectDB();

            if (con == null) {

                response.getWriter().println(
                        "<h3>Database Connection Failed</h3>"
                );

                return;
            }

            // ================= INSERT =================

            String sql =
                    "INSERT INTO jobs "
                    + "(recruiter_id, title, company, role_type, "
                    + "requirements, technical_skills, "
                    + "duration_months, stipend_salary, deadline) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sql);

            // recruiter_id
            ps.setInt(1, recruiterId);

            // title
            ps.setString(2, title.trim());

            // company
            ps.setString(3, companyName.trim());

            // role
            ps.setString(4, roleType);

            // requirements
            ps.setString(5, requirements);

            // technical skills
            ps.setString(6, technicalSkills);

            // duration
            if (duration == null ||
                    duration.trim().isEmpty()) {

                ps.setNull(
                        7,
                        java.sql.Types.INTEGER
                );

            } else {

                ps.setInt(
                        7,
                        Integer.parseInt(duration.trim())
                );
            }

            // salary
            ps.setString(8, salary);

            // deadline
            if (deadline == null ||
                    deadline.trim().isEmpty()) {

                ps.setNull(
                        9,
                        java.sql.Types.DATE
                );

            } else {

                ps.setDate(
                        9,
                        java.sql.Date.valueOf(deadline)
                );
            }

            // ================= EXECUTE =================

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        "ManageJobsServlet?success=1"
                );

            } else {

                response.getWriter().println(
                        "<h3>Job Posting Failed.</h3>"
                );
            }

        } catch (NumberFormatException e) {

            response.getWriter().println(
                    "<h3>Invalid Duration</h3>"
            );

            response.getWriter().println(
                    "<p>Duration must be a number, for example 6.</p>"
            );

        } catch (IllegalArgumentException e) {

            response.getWriter().println(
                    "<h3>Invalid Deadline</h3>"
            );

            response.getWriter().println(
                    "<p>Please select a valid date.</p>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error While Posting Job</h3>"
            );

            response.getWriter().println("<pre>");

            e.printStackTrace(
                    response.getWriter()
            );

            response.getWriter().println("</pre>");

        } finally {

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