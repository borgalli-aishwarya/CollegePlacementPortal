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

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check recruiter login
        if (session == null
                || session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiterLogin.jsp");
            return;
        }

        // Get recruiter ID
        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        // Get company name from session
        String companyName =
                (String) session.getAttribute("companyName");

        // Get form values
        String title =
                request.getParameter("title");

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


        // Basic validation
        if (title == null
                || title.trim().isEmpty()
                || roleType == null
                || roleType.trim().isEmpty()
                || companyName == null
                || companyName.trim().isEmpty()) {

            response.getWriter().println(
                    "<h3>Required job details are missing.</h3>"
            );

            return;
        }


        Connection con = null;
        PreparedStatement ps = null;


        try {

            // Database connection
            database db = new database();

            con = db.connectDB();


            if (con == null) {

                response.getWriter().println(
                        "<h3>Database Connection Failed</h3>"
                );

                return;
            }


            // SQL query
            String sql =
                    "INSERT INTO jobs "
                    + "(recruiter_id, title, company, role_type, "
                    + "requirements, technical_skills, "
                    + "duration_months, stipend_salary, deadline) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";


            ps = con.prepareStatement(sql);


            // Recruiter ID
            ps.setInt(1, recruiterId);


            // Job title
            ps.setString(
                    2,
                    title.trim()
            );


            // Company
            ps.setString(
                    3,
                    companyName.trim()
            );


            // Role type
            ps.setString(
                    4,
                    roleType
            );


            // Requirements
            ps.setString(
                    5,
                    requirements
            );


            // Technical skills
            ps.setString(
                    6,
                    technicalSkills
            );


            // Duration
            if (duration == null
                    || duration.trim().isEmpty()) {

                ps.setNull(
                        7,
                        java.sql.Types.INTEGER
                );

            } else {

                ps.setInt(
                        7,
                        Integer.parseInt(duration)
                );
            }


            // Salary / stipend
            ps.setString(
                    8,
                    salary
            );


            // Deadline
            if (deadline == null
                    || deadline.trim().isEmpty()) {

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


            // Execute INSERT
            int result =
                    ps.executeUpdate();


            // Successful job posting
            if (result > 0) {

                response.sendRedirect(
                        "ManageJobsServlet?success=1"
                );

            } else {

                response.getWriter().println(
                        "<h3>Job Posting Failed</h3>"
                );
            }


        } catch (NumberFormatException e) {

            response.getWriter().println(
                    "<h3>Invalid Duration</h3>"
            );

            response.getWriter().println(
                    "<p>Duration must contain a valid number.</p>"
            );


        } catch (IllegalArgumentException e) {

            response.getWriter().println(
                    "<h3>Invalid Deadline</h3>"
            );

            response.getWriter().println(
                    "<p>Please select a valid application deadline.</p>"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h3>Error While Posting Job</h3>"
            );

            response.getWriter().println(
                    "<pre>"
            );

            e.printStackTrace(
                    response.getWriter()
            );

            response.getWriter().println(
                    "</pre>"
            );


        } finally {

            // Close PreparedStatement
            try {

                if (ps != null) {
                    ps.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }


            // Close Connection
            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}