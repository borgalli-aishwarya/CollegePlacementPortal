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

        HttpSession session = request.getSession();

        Integer recruiterId =
                (Integer) session.getAttribute("recruiterId");

        if (recruiterId == null) {
            response.sendRedirect("recruiter_login.jsp");
            return;
        }

        String id = request.getParameter("id");

        try {

            database db = new database();
            Connection con = db.connectDB();

            // First delete applications associated with this job
            String deleteAppSql = "DELETE FROM applications WHERE job_id = ?";
            PreparedStatement psApp = con.prepareStatement(deleteAppSql);
            psApp.setInt(1, Integer.parseInt(id));
            psApp.executeUpdate();
            psApp.close();

            String sql =
                    "DELETE FROM jobs "
                    + "WHERE id = ? AND recruiter_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ps.setInt(2, recruiterId);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {

                response.sendRedirect(
                        "ManageJobsServlet?deleted=1"
                );

            } else {

                response.sendRedirect(
                        "ManageJobsServlet?deleted=0"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

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
        }
    }
}