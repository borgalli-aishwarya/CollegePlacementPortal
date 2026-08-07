package student;

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

@WebServlet("/studentloginservlet")
public class studentloginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            database db = new database();
            Connection con = db.connectDB();

            if (con == null) {
                response.getWriter().println("Database Connection Failed");
                return;
            }

            String sql = "SELECT * FROM students WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("studentId", rs.getInt("id"));
                session.setAttribute("studentName", rs.getString("name"));
                session.setAttribute("studentEmail", rs.getString("email"));

                response.sendRedirect("studentDashboard.jsp");

            } else {

                response.getWriter().println("Invalid Email or Password");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception ex) {

            ex.printStackTrace();
            ex.printStackTrace(response.getWriter());

        }

    }
}