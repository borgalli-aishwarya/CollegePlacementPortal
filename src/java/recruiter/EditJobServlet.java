package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modell.database;

@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {

    // =========================================================
    // LOAD EDIT JOB PAGE
    // =========================================================
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check recruiter login
        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        String id = request.getParameter("id");

        // Check job ID
        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect("ManageJobsServlet");
            return;
        }

        int jobId;

        try {

            jobId = Integer.parseInt(id.trim());

        } catch (NumberFormatException e) {

            response.sendRedirect("ManageJobsServlet");
            return;
        }

        database db = new database();

        try (Connection con = db.connectDB()) {

            if (con == null) {

                response.getWriter().println(
                        "<h3>Database connection failed.</h3>"
                );

                return;
            }

            /*
             * IMPORTANT:
             * The recruiter ID is included so that a recruiter
             * cannot edit another recruiter's job.
             */
            String sql =
                    "SELECT id, title, company, role_type, " +
                    "requirements, technical_skills, " +
                    "duration_months, stipend_salary, deadline " +
                    "FROM jobs " +
                    "WHERE id = ? AND recruiter_id = ?";

            try (PreparedStatement ps =
                    con.prepareStatement(sql)) {

                ps.setInt(1, jobId);
                ps.setInt(2, recruiterId);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        // Job ID
                        request.setAttribute(
                                "id",
                                rs.getInt("id")
                        );

                        // Job title
                        request.setAttribute(
                                "title",
                                rs.getString("title")
                        );

                        // Company
                        request.setAttribute(
                                "company",
                                rs.getString("company")
                        );

                        // Role type
                        request.setAttribute(
                                "roleType",
                                rs.getString("role_type")
                        );

                        // Requirements
                        request.setAttribute(
                                "requirements",
                                rs.getString("requirements")
                        );

                        // Technical skills
                        request.setAttribute(
                                "technicalSkills",
                                rs.getString("technical_skills")
                        );

                        /*
                         * Duration can be NULL.
                         *
                         * This is useful for full-time jobs where
                         * duration is not applicable.
                         */
                        int duration =
                                rs.getInt("duration_months");

                        if (rs.wasNull()) {

                            request.setAttribute(
                                    "duration",
                                    null
                            );

                        } else {

                            request.setAttribute(
                                    "duration",
                                    duration
                            );
                        }

                        // Salary / stipend
                        request.setAttribute(
                                "salary",
                                rs.getString("stipend_salary")
                        );

                        // Deadline
                        request.setAttribute(
                                "deadline",
                                rs.getDate("deadline")
                        );

                        // Open edit page
                        request.getRequestDispatcher(
                                "editjob.jsp"
                        ).forward(request, response);

                    } else {

                        // Job does not belong to this recruiter
                        response.sendRedirect(
                                "ManageJobsServlet"
                        );
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h3>Error loading job</h3>"
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
        }
    }


    // =========================================================
    // UPDATE JOB
    // =========================================================
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check recruiter login
        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");


        // =====================================================
        // GET FORM VALUES
        // =====================================================

        String id = request.getParameter("id");

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


        // =====================================================
        // VALIDATE JOB ID
        // =====================================================

        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect(
                    "ManageJobsServlet?updated=0"
            );

            return;
        }

        int jobId;

        try {

            jobId = Integer.parseInt(id.trim());

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "ManageJobsServlet?updated=0"
            );

            return;
        }


        // =====================================================
        // BASIC VALIDATION
        // =====================================================

        if (title == null || title.trim().isEmpty()) {

            response.sendRedirect(
                    "EditJobServlet?id=" + jobId +
                    "&error=Job title is required"
            );

            return;
        }


        if (roleType == null || roleType.trim().isEmpty()) {

            response.sendRedirect(
                    "EditJobServlet?id=" + jobId +
                    "&error=Role type is required"
            );

            return;
        }


        if (requirements == null) {
            requirements = "";
        }

        if (technicalSkills == null) {
            technicalSkills = "";
        }

        if (salary == null) {
            salary = "";
        }


        // =====================================================
        // PREPARE DURATION
        // =====================================================

        Integer durationValue = null;

        if (duration != null &&
            !duration.trim().isEmpty()) {

            try {

                durationValue =
                        Integer.parseInt(
                                duration.trim()
                        );

                if (durationValue < 1) {

                    response.sendRedirect(
                            "EditJobServlet?id=" + jobId +
                            "&error=Duration must be at least 1 month"
                    );

                    return;
                }

            } catch (NumberFormatException e) {

                response.sendRedirect(
                        "EditJobServlet?id=" + jobId +
                        "&error=Duration must be a number"
                );

                return;
            }
        }


        // =====================================================
        // PREPARE DEADLINE
        // =====================================================

        Date deadlineValue = null;

        if (deadline != null &&
            !deadline.trim().isEmpty()) {

            try {

                deadlineValue =
                        Date.valueOf(
                                deadline.trim()
                        );

            } catch (IllegalArgumentException e) {

                response.sendRedirect(
                        "EditJobServlet?id=" + jobId +
                        "&error=Invalid deadline"
                );

                return;
            }
        }


        // =====================================================
        // UPDATE DATABASE
        // =====================================================

        database db = new database();

        String sql =
                "UPDATE jobs SET " +
                "title = ?, " +
                "role_type = ?, " +
                "requirements = ?, " +
                "technical_skills = ?, " +
                "duration_months = ?, " +
                "stipend_salary = ?, " +
                "deadline = ? " +
                "WHERE id = ? " +
                "AND recruiter_id = ?";


        try (Connection con = db.connectDB()) {

            if (con == null) {

                response.getWriter().println(
                        "<h3>Database connection failed.</h3>"
                );

                return;
            }

            try (PreparedStatement ps =
                    con.prepareStatement(sql)) {

                // Title
                ps.setString(
                        1,
                        title.trim()
                );

                // Role
                ps.setString(
                        2,
                        roleType.trim()
                );

                // Requirements
                ps.setString(
                        3,
                        requirements.trim()
                );

                // Technical skills
                ps.setString(
                        4,
                        technicalSkills.trim()
                );


                // Duration
                if (durationValue == null) {

                    ps.setNull(
                            5,
                            Types.INTEGER
                    );

                } else {

                    ps.setInt(
                            5,
                            durationValue
                    );
                }


                // Salary
                ps.setString(
                        6,
                        salary.trim()
                );


                // Deadline
                if (deadlineValue == null) {

                    ps.setNull(
                            7,
                            Types.DATE
                    );

                } else {

                    ps.setDate(
                            7,
                            deadlineValue
                    );
                }


                // Job ID
                ps.setInt(
                        8,
                        jobId
                );


                // Recruiter ID
                ps.setInt(
                        9,
                        recruiterId
                );


                // Execute update
                int result =
                        ps.executeUpdate();


                // =================================================
                // RESULT
                // =================================================

                if (result > 0) {

                    response.sendRedirect(
                            "ManageJobsServlet?updated=1"
                    );

                } else {

                    response.sendRedirect(
                            "ManageJobsServlet?updated=0"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h3>Error updating job</h3>"
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
        }
    }
}