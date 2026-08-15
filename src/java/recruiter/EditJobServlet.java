package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modell.database;

@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
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

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("ManageJobsServlet");
            return;
        }

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql =
                    "SELECT * FROM jobs "
                    + "WHERE id = ? AND recruiter_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ps.setInt(2, recruiterId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute(
                        "id", rs.getInt("id"));

                request.setAttribute(
                        "title", rs.getString("title"));

                request.setAttribute(
                        "company", rs.getString("company"));

                request.setAttribute(
                        "roleType", rs.getString("role_type"));

                request.setAttribute(
                        "requirements",
                        rs.getString("requirements"));

                request.setAttribute(
                        "technicalSkills",
                        rs.getString("technical_skills"));

                request.setAttribute(
                        "duration",
                        rs.getInt("duration_months"));

                request.setAttribute(
                        "salary",
                        rs.getString("stipend_salary"));

                request.setAttribute(
                        "deadline",
                        rs.getDate("deadline"));

                request.getRequestDispatcher(
                        "editjob.jsp"
                ).forward(request, response);

            } else {

                response.sendRedirect(
                        "ManageJobsServlet");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

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
        String title = request.getParameter("title");
        String roleType = request.getParameter("roleType");
        String requirements = request.getParameter("requirements");
        String technicalSkills =
                request.getParameter("technicalSkills");
        String duration = request.getParameter("duration");
        String salary = request.getParameter("salary");
        String deadline = request.getParameter("deadline");

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql =
                    "UPDATE jobs SET "
                    + "title = ?, "
                    + "role_type = ?, "
                    + "requirements = ?, "
                    + "technical_skills = ?, "
                    + "duration_months = ?, "
                    + "stipend_salary = ?, "
                    + "deadline = ? "
                    + "WHERE id = ? AND recruiter_id = ?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, roleType);
            ps.setString(3, requirements);
            ps.setString(4, technicalSkills);
            if (duration == null || duration.trim().isEmpty()) {
                ps.setNull(5, java.sql.Types.INTEGER);
            } else {
                ps.setInt(5, Integer.parseInt(duration.trim()));
            }
            ps.setString(6, salary);
            if (deadline == null || deadline.trim().isEmpty()) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, java.sql.Date.valueOf(deadline.trim()));
            }
            ps.setInt(8, Integer.parseInt(id));
            ps.setInt(9, recruiterId);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {

                response.sendRedirect(
                        "ManageJobsServlet?updated=1");

            } else {

                response.sendRedirect(
                        "ManageJobsServlet?updated=0");
            }

        } catch (NumberFormatException e) {

            response.getWriter().println(
                    "Duration must be a number."
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error updating job: "
                    + e.getMessage()
            );
        }
    }
}