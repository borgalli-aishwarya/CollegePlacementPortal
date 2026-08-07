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

@WebServlet("/recruiterloginservlet")
public class recruiterloginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql = "SELECT * FROM recruiters WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute("recruiterId", rs.getInt("id"));
                session.setAttribute("companyName", rs.getString("company_name"));
                session.setAttribute("recruiterEmail", rs.getString("email"));

                response.sendRedirect("recruiterDashboard.jsp");

            } else {

                response.sendRedirect("recruiterLogin.jsp");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception ex) {

            ex.printStackTrace();
            response.getWriter().println(ex.getMessage());

        }
    }
}