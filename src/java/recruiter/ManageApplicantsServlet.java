package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modell.database;

@WebServlet("/ManageApplicantsServlet")
public class ManageApplicantsServlet extends HttpServlet {


    /* =========================================================
       GET
       LOAD APPLICANTS
       ========================================================= */

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session =
                request.getSession(false);


        /* =====================================================
           CHECK RECRUITER LOGIN
           ===================================================== */

        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    "recruiter_login.jsp"
            );

            return;
        }


        Integer recruiterId =
                (Integer)
                session.getAttribute("recruiterId");


        List<Map<String, Object>> applicants =
                new ArrayList<Map<String, Object>>();


        Connection con = null;

        PreparedStatement ps = null;

        ResultSet rs = null;


        try {

            database db =
                    new database();

            con =
                    db.connectDB();


            if (con == null) {

                request.setAttribute(
                        "error",
                        "Database connection failed."
                );

                request.getRequestDispatcher(
                        "manageApplicants.jsp"
                ).forward(request, response);

                return;
            }


            /* =================================================
               GET ONLY THIS RECRUITER'S APPLICANTS
               ================================================= */

            String sql =
                    "SELECT "
                    + "a.id AS application_id, "
                    + "a.status, "
                    + "a.interview_date, "
                    + "a.offer_details, "
                    + "a.applied_on, "

                    + "s.id AS student_id, "
                    + "s.name AS student_name, "
                    + "s.email AS student_email, "
                    + "s.mobile AS student_mobile, "
                    + "s.prn, "
                    + "s.college, "
                    + "s.branch, "
                    + "s.year, "
                    + "s.semester, "
                    + "s.resume_url, "

                    + "j.id AS job_id, "
                    + "j.title AS job_title, "
                    + "j.company "

                    + "FROM applications a "

                    + "INNER JOIN students s "
                    + "ON a.student_id = s.id "

                    + "INNER JOIN jobs j "
                    + "ON a.job_id = j.id "

                    + "WHERE j.recruiter_id = ? "

                    + "ORDER BY a.id DESC";


            ps =
                    con.prepareStatement(sql);


            ps.setInt(
                    1,
                    recruiterId
            );


            rs =
                    ps.executeQuery();


            /* =================================================
               READ APPLICANTS
               ================================================= */

            while (rs.next()) {


                Map<String, Object> applicant =
                        new HashMap<String, Object>();


                applicant.put(
                        "applicationId",
                        rs.getInt("application_id")
                );


                applicant.put(
                        "status",
                        rs.getString("status")
                );


                applicant.put(
                        "interviewDate",
                        rs.getDate("interview_date")
                );


                applicant.put(
                        "offerDetails",
                        rs.getString("offer_details")
                );


                applicant.put(
                        "appliedOn",
                        rs.getTimestamp("applied_on")
                );


                /* STUDENT */

                applicant.put(
                        "studentId",
                        rs.getInt("student_id")
                );


                applicant.put(
                        "studentName",
                        rs.getString("student_name")
                );


                applicant.put(
                        "studentEmail",
                        rs.getString("student_email")
                );


                applicant.put(
                        "studentMobile",
                        rs.getString("student_mobile")
                );


                applicant.put(
                        "prn",
                        rs.getString("prn")
                );


                applicant.put(
                        "college",
                        rs.getString("college")
                );


                applicant.put(
                        "branch",
                        rs.getString("branch")
                );


                applicant.put(
                        "year",
                        rs.getInt("year")
                );


                applicant.put(
                        "semester",
                        rs.getInt("semester")
                );


                /* RESUME */

                applicant.put(
                        "resumeUrl",
                        rs.getString("resume_url")
                );


                /* JOB */

                applicant.put(
                        "jobId",
                        rs.getInt("job_id")
                );


                applicant.put(
                        "jobTitle",
                        rs.getString("job_title")
                );


                applicant.put(
                        "company",
                        rs.getString("company")
                );


                applicants.add(
                        applicant
                );

            }


        } catch (Exception e) {


            e.printStackTrace();


            request.setAttribute(
                    "error",
                    "Unable to load applications: "
                    + e.getMessage()
            );


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


        request.setAttribute(
                "applicants",
                applicants
        );


        /* =====================================================
           SUCCESS MESSAGE
           ===================================================== */

        String success =
                request.getParameter("success");


        if ("shortlisted".equals(success)) {

            request.setAttribute(
                    "successMessage",
                    "Applicant shortlisted successfully."
            );

        }

        else if ("rejected".equals(success)) {

            request.setAttribute(
                    "successMessage",
                    "Applicant rejected successfully."
            );

        }

        else if ("selected".equals(success)) {

            request.setAttribute(
                    "successMessage",
                    "Applicant selected successfully."
            );

        }


        request.getRequestDispatcher(
                "manageApplicants.jsp"
        ).forward(request, response);

    }



    /* =========================================================
       POST
       SHORTLIST / REJECT / SELECT
       ========================================================= */

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session =
                request.getSession(false);


        /* =====================================================
           CHECK LOGIN
           ===================================================== */

        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect(
                    "recruiter_login.jsp"
            );

            return;
        }


        Integer recruiterId =
                (Integer)
                session.getAttribute("recruiterId");


        String action =
                request.getParameter("action");


        String applicationIdParameter =
                request.getParameter(
                        "applicationId"
                );


        if (applicationIdParameter == null ||
            action == null) {

            response.sendRedirect(
                    "ManageApplicantsServlet"
            );

            return;
        }


        try {


            int applicationId =
                    Integer.parseInt(
                            applicationIdParameter
                    );


            String newStatus;

            String successMessage;


            /* =================================================
               SHORTLIST
               ================================================= */

            if ("shortlist".equals(action)) {

                newStatus =
                        "Shortlisted";

                successMessage =
                        "shortlisted";

            }


            /* =================================================
               REJECT
               ================================================= */

            else if ("reject".equals(action)) {

                newStatus =
                        "Rejected";

                successMessage =
                        "rejected";

            }


            /* =================================================
               SELECT / APPROVE
               ================================================= */

            else if ("select".equals(action)) {

                newStatus =
                        "Selected";

                successMessage =
                        "selected";

            }


            else {

                response.sendRedirect(
                        "ManageApplicantsServlet"
                );

                return;

            }


            Connection con = null;

            PreparedStatement ps = null;


            try {


                database db =
                        new database();


                con =
                        db.connectDB();


                if (con == null) {

                    response.sendRedirect(
                            "ManageApplicantsServlet"
                    );

                    return;
                }


                /* =================================================
                   SECURITY:
                   UPDATE ONLY IF APPLICATION BELONGS TO
                   THIS RECRUITER
                   ================================================= */

                String sql =
                        "UPDATE applications a "

                        + "INNER JOIN jobs j "
                        + "ON a.job_id = j.id "

                        + "SET a.status = ? "

                        + "WHERE a.id = ? "

                        + "AND j.recruiter_id = ?";


                ps =
                        con.prepareStatement(sql);


                ps.setString(
                        1,
                        newStatus
                );


                ps.setInt(
                        2,
                        applicationId
                );


                ps.setInt(
                        3,
                        recruiterId
                );


                int result =
                        ps.executeUpdate();


                if (result > 0) {


                    response.sendRedirect(
                            "ManageApplicantsServlet?success="
                            + successMessage
                    );


                } else {


                    response.sendRedirect(
                            "ManageApplicantsServlet"
                    );

                }


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


        } catch (Exception e) {


            e.printStackTrace();


            response.sendRedirect(
                    "ManageApplicantsServlet"
            );

        }

    }

}