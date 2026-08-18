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

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check recruiter login
        if (session == null ||
            session.getAttribute("recruiterId") == null) {

            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        // Get recruiter ID
        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        // Get job ID
        String id = request.getParameter("id");

        // Check job ID
        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect("ManageJobsServlet?deleted=0");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {

            int jobId = Integer.parseInt(id);

            // Connect database
            database db = new database();

            con = db.connectDB();

            if (con == null) {

                response.getWriter().println(
                        "<h3>Database connection failed.</h3>"
                );

                return;
            }

            /*
             * Delete only the job belonging to the
             * currently logged-in recruiter.
             */
            String sql =
                    "DELETE FROM jobs " +
                    "WHERE id = ? AND recruiter_id = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, jobId);
            ps.setInt(2, recruiterId);

            int result = ps.executeUpdate();

            if (result > 0) {

                // Job deleted successfully
                response.sendRedirect(
                        "ManageJobsServlet?deleted=1"
                );

            } else {

                // No matching job found
                response.sendRedirect(
                        "ManageJobsServlet?deleted=0"
                );
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "ManageJobsServlet?deleted=0"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html;charset=UTF-8");

            response.getWriter().println(
                    "<h3>Error deleting job</h3>"
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
                e.printStackTrace();
            }

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