package student;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modell.database;

@WebServlet("/UpdateResumeServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 15 * 1024 * 1024
)
public class UpdateResumeServlet extends HttpServlet {

    // Permanent upload location on your computer
    private static final String UPLOAD_FOLDER =
            System.getProperty("user.home")
            + java.io.File.separator
            + "CampusPlacementPortal"
            + java.io.File.separator
            + "resumes";


    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // ==========================================
        // CHECK STUDENT LOGIN
        // ==========================================

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect(
                    "student_login.jsp"
            );

            return;
        }


        // ==========================================
        // GET STUDENT ID
        // ==========================================

        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId"
                );


        // ==========================================
        // GET UPLOADED FILE
        // ==========================================

        Part resumePart =
                request.getPart("resume");


        if (resumePart == null ||
            resumePart.getSize() == 0) {

            response.sendRedirect(
                    "studentDashboard.jsp?error=Please select a resume"
            );

            return;
        }


        // ==========================================
        // GET ORIGINAL FILE NAME
        // ==========================================

        String originalFileName =
                Paths.get(
                        resumePart.getSubmittedFileName()
                )
                .getFileName()
                .toString();


        // ==========================================
        // GET FILE EXTENSION
        // ==========================================

        String extension = "";

        int dotIndex =
                originalFileName.lastIndexOf(".");


        if (dotIndex >= 0) {

            extension =
                    originalFileName
                    .substring(dotIndex)
                    .toLowerCase();
        }


        // ==========================================
        // ALLOW PDF, DOC AND DOCX
        // ==========================================

        if (!extension.equals(".pdf") &&
            !extension.equals(".doc") &&
            !extension.equals(".docx")) {

            response.sendRedirect(
                    "studentDashboard.jsp?error=Only PDF, DOC and DOCX files are allowed"
            );

            return;
        }


        Connection con = null;
        PreparedStatement ps = null;

        try {

            // ==========================================
            // CREATE PERMANENT UPLOAD DIRECTORY
            // ==========================================

            Path uploadDirectory =
                    Paths.get(UPLOAD_FOLDER);


            if (!Files.exists(uploadDirectory)) {

                Files.createDirectories(
                        uploadDirectory
                );
            }


            // ==========================================
            // CHECK DIRECTORY
            // ==========================================

            if (!Files.isDirectory(uploadDirectory)) {

                response.getWriter().println(
                        "<h3>Resume upload directory is not valid.</h3>"
                );

                return;
            }


            // ==========================================
            // GENERATE UNIQUE FILE NAME
            // ==========================================

            String newFileName =
                    UUID.randomUUID()
                    .toString()
                    + extension;


            Path filePath =
                    uploadDirectory.resolve(
                            newFileName
                    );


            // ==========================================
            // SAVE FILE
            // ==========================================

            try (InputStream inputStream =
                    resumePart.getInputStream()) {

                Files.copy(
                        inputStream,
                        filePath
                );
            }


            // ==========================================
            // STORE FILE NAME IN DATABASE
            // ==========================================

            /*
             * We store the unique file name.
             *
             * Example:
             * 8f4d9c2a-1234-4567.pdf
             */

            String resumeUrl =
                    newFileName;


            // ==========================================
            // DATABASE CONNECTION
            // ==========================================

            database db =
                    new database();

            con =
                    db.connectDB();


            if (con == null) {

                // Delete uploaded file if DB connection fails
                try {
                    Files.deleteIfExists(filePath);
                } catch (Exception ignored) {
                }

                response.getWriter().println(
                        "<h3>Database Connection Failed</h3>"
                );

                return;
            }


            // ==========================================
            // UPDATE STUDENT RESUME
            // ==========================================

            String sql =
                    "UPDATE students "
                    + "SET resume_url = ? "
                    + "WHERE id = ?";


            ps =
                    con.prepareStatement(sql);


            ps.setString(
                    1,
                    resumeUrl
            );


            ps.setInt(
                    2,
                    studentId
            );


            int result =
                    ps.executeUpdate();


            // ==========================================
            // CHECK RESULT
            // ==========================================

            if (result > 0) {

                response.sendRedirect(
                        "studentDashboard.jsp?success=Resume uploaded successfully"
                );

            } else {

                // Database update failed
                try {
                    Files.deleteIfExists(filePath);
                } catch (Exception ignored) {
                }

                response.sendRedirect(
                        "studentDashboard.jsp?error=Resume upload failed"
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h3>Resume Upload Error</h3>"
            );

            response.getWriter().println(
                    "<p>"
                    + e.getMessage()
                    + "</p>"
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

            // ==========================================
            // CLOSE PREPARED STATEMENT
            // ==========================================

            try {

                if (ps != null) {
                    ps.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


            // ==========================================
            // CLOSE DATABASE CONNECTION
            // ==========================================

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