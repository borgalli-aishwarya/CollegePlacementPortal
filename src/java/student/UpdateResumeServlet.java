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

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check student login
        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("student_login.jsp");
            return;
        }

        Integer studentId =
                (Integer) session.getAttribute("studentId");

        Part resumePart = request.getPart("resume");

        // Check whether file was selected
        if (resumePart == null ||
            resumePart.getSize() == 0) {

            response.sendRedirect(
                    "studentDashboard.jsp?error=Please select a resume"
            );
            return;
        }

        String originalFileName =
                Paths.get(resumePart.getSubmittedFileName())
                      .getFileName()
                      .toString();

        // Get file extension
        String extension = "";

        int dotIndex = originalFileName.lastIndexOf(".");

        if (dotIndex >= 0) {
            extension =
                    originalFileName.substring(dotIndex)
                    .toLowerCase();
        }

        // Allow only PDF, DOC and DOCX
        if (!extension.equals(".pdf") &&
            !extension.equals(".doc") &&
            !extension.equals(".docx")) {

            response.sendRedirect(
                    "studentDashboard.jsp?error=Only PDF, DOC and DOCX files are allowed"
            );
            return;
        }

        try {

            /*
             * Create upload directory inside
             * the deployed web application.
             */
            String uploadPath =
                    getServletContext().getRealPath(
                            "/uploads/resumes"
                    );

            if (uploadPath == null) {

                response.getWriter().println(
                        "<h3>Unable to create upload directory.</h3>"
                );

                return;
            }

            Path uploadDirectory =
                    Paths.get(uploadPath);

            // Create folder automatically
            Files.createDirectories(uploadDirectory);


            /*
             * Generate unique file name.
             * This prevents two students having
             * the same resume file name.
             */
            String newFileName =
                    UUID.randomUUID().toString()
                    + extension;


            Path filePath =
                    uploadDirectory.resolve(newFileName);


            /*
             * Save uploaded file.
             */
            try (InputStream inputStream =
                    resumePart.getInputStream()) {

                Files.copy(
                        inputStream,
                        filePath
                );
            }


            /*
             * Store only the web path in database.
             *
             * Example:
             * uploads/resumes/abc123.pdf
             */
            String resumeUrl =
                    "uploads/resumes/" + newFileName;


            /*
             * Update student's resume_url.
             */
            database db = new database();

            Connection con =
                    db.connectDB();

            if (con == null) {

                response.getWriter().println(
                        "<h3>Database Connection Failed</h3>"
                );

                return;
            }


            String sql =
                    "UPDATE students " +
                    "SET resume_url = ? " +
                    "WHERE id = ?";


            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, resumeUrl);
            ps.setInt(2, studentId);


            int result =
                    ps.executeUpdate();


            ps.close();
            con.close();


            if (result > 0) {

                response.sendRedirect(
                        "studentDashboard.jsp?success=Resume uploaded successfully"
                );

            } else {

                response.sendRedirect(
                        "studentDashboard.jsp?error=Resume upload failed"
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h3>Resume Upload Error</h3>"
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