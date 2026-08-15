package student;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class UpdateResumeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer studentId = (Integer) session.getAttribute("studentId");

        if (studentId == null) {
            response.sendRedirect("student_login.jsp");
            return;
        }

        Part filePart = request.getPart("resume");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("updateresume.jsp?error=empty");
            return;
        }

        String fileName = extractFileName(filePart);
        if (fileName == null || !fileName.toLowerCase().endsWith(".pdf")) {
            response.sendRedirect("updateresume.jsp?error=format");
            return;
        }

        // Save directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "resumes";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String savedFileName = "resume_student_" + studentId + "_" + System.currentTimeMillis() + ".pdf";
        String filePath = uploadPath + File.separator + savedFileName;
        filePart.write(filePath);

        String dbResumeUrl = "uploads/resumes/" + savedFileName;

        Connection con = null;
        PreparedStatement ps = null;

        try {
            database db = new database();
            con = db.connectDB();

            if (con != null) {
                String sql = "UPDATE students SET resume_url = ? WHERE id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, dbResumeUrl);
                ps.setInt(2, studentId);
                ps.executeUpdate();
            }

            session.setAttribute("resumeUrl", dbResumeUrl);
            response.sendRedirect("studentDashboard.jsp?resumeUpdated=1");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("updateresume.jsp?error=db");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            String[] items = contentDisp.split(";");
            for (String s : items) {
                if (s.trim().startsWith("filename")) {
                    return s.substring(s.indexOf("=") + 2, s.length() - 1);
                }
            }
        }
        return "";
    }
}
