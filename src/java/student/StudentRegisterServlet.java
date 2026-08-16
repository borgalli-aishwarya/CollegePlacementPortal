package student;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import modell.database;

@WebServlet("/StudentRegisterServlet")

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,
    maxFileSize = 5 * 1024 * 1024,
    maxRequestSize = 6 * 1024 * 1024
)

public class StudentRegisterServlet extends HttpServlet {


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        response.setContentType("text/html;charset=UTF-8");


        /* =====================================================
           GET FORM VALUES
           ===================================================== */

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String mobile =
                request.getParameter("mobile");

        String prn =
                request.getParameter("prn");

        String college =
                request.getParameter("college");

        String branch =
                request.getParameter("branch");

        String year =
                request.getParameter("year");

        String semester =
                request.getParameter("semester");

        String dob =
                request.getParameter("dob");

        String gender =
                request.getParameter("gender");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");


        /* =====================================================
           CHECK PASSWORD
           ===================================================== */

        if (!password.equals(confirmPassword)) {

            response.getWriter().println(
                "<h3>Password and Confirm Password do not match.</h3>"
            );

            return;
        }


        /* =====================================================
           GET RESUME
           ===================================================== */

        Part resumePart =
                request.getPart("resume");


        if (resumePart == null ||
            resumePart.getSize() == 0) {

            response.getWriter().println(
                "<h3>Please upload your resume.</h3>"
            );

            return;
        }


        /* =====================================================
           GET FILE NAME
           ===================================================== */

        String submittedFileName =
                resumePart.getSubmittedFileName();


        if (submittedFileName == null ||
            submittedFileName.trim().isEmpty()) {

            response.getWriter().println(
                "<h3>Invalid resume file.</h3>"
            );

            return;
        }


        /* =====================================================
           GET EXTENSION
           ===================================================== */

        String originalFileName =
                new File(submittedFileName)
                        .getName();

        String extension = "";

        int dotIndex =
                originalFileName.lastIndexOf(".");


        if (dotIndex >= 0) {

            extension =
                    originalFileName
                    .substring(dotIndex)
                    .toLowerCase();

        }


        /* =====================================================
           ALLOWED FILE TYPES
           ===================================================== */

        if (!extension.equals(".pdf") &&
            !extension.equals(".doc") &&
            !extension.equals(".docx")) {

            response.getWriter().println(
                "<h3>Only PDF, DOC and DOCX files are allowed.</h3>"
            );

            return;
        }


        /* =====================================================
           CREATE UNIQUE FILE NAME
           ===================================================== */

        String newFileName =
                UUID.randomUUID().toString()
                + extension;


        /* =====================================================
           CREATE UPLOAD DIRECTORY
           ===================================================== */

        String uploadPath =
                getServletContext()
                .getRealPath("/uploads/resumes");


        File uploadDirectory =
                new File(uploadPath);


        if (!uploadDirectory.exists()) {

            uploadDirectory.mkdirs();

        }


        /* =====================================================
           SAVE FILE
           ===================================================== */

        File resumeFile =
                new File(
                    uploadDirectory,
                    newFileName
                );


        resumePart.write(
                resumeFile.getAbsolutePath()
        );


        /*
         * Save relative URL in database.
         */
        String resumeUrl =
                "uploads/resumes/" + newFileName;


        /* =====================================================
           DATABASE
           ===================================================== */

        Connection con = null;

        PreparedStatement ps = null;


        try {

            database db =
                    new database();

            con =
                    db.connectDB();


            if (con == null) {

                response.getWriter().println(
                    "<h3>Database Connection Failed</h3>"
                );

                return;
            }


            /* =================================================
               INSERT STUDENT
               ================================================= */

            String sql =
                    "INSERT INTO students "
                    + "(name,email,mobile,prn,college,branch,"
                    + "year,semester,dob,gender,password,resume_url) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";


            ps =
                    con.prepareStatement(sql);


            ps.setString(1, name);

            ps.setString(2, email);

            ps.setString(3, mobile);

            ps.setString(4, prn);

            ps.setString(5, college);

            ps.setString(6, branch);

            ps.setInt(
                    7,
                    Integer.parseInt(year)
            );

            ps.setInt(
                    8,
                    Integer.parseInt(semester)
            );

            ps.setString(9, dob);

            ps.setString(10, gender);

            ps.setString(11, password);

            ps.setString(12, resumeUrl);


            int result =
                    ps.executeUpdate();


            /* =================================================
               SUCCESS
               ================================================= */

            if (result > 0) {

                response.sendRedirect(
                        "student_login.jsp"
                );

            } else {

                response.getWriter().println(
                    "<h3>Registration Failed!</h3>"
                );

            }


        } catch (NumberFormatException e) {

            response.getWriter().println(
                "<h3>Year or Semester is not numeric.</h3>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "<h3>Registration Error</h3>"
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