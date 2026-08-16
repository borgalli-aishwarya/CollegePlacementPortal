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

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            database db = new database();

            con = db.connectDB();

            /* ================= DATABASE CHECK ================= */

            if (con == null) {

                response.sendRedirect(
                        "recruiter_login.jsp?error=db"
                );

                return;
            }

            /* ================= LOGIN QUERY ================= */

            String sql =
                    "SELECT id, company_name, email, status " +
                    "FROM recruiters " +
                    "WHERE email=? AND password=?";

            ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();


            /* ================= LOGIN SUCCESS ================= */

            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "recruiterId",
                        rs.getInt("id")
                );

                session.setAttribute(
                        "companyName",
                        rs.getString("company_name")
                );

                session.setAttribute(
                        "recruiterEmail",
                        rs.getString("email")
                );

                session.setAttribute(
                        "recruiterStatus",
                        rs.getString("status")
                );


                /* Go to recruiter dashboard */

                response.sendRedirect(
                        "recruiterDashboard.jsp"
                );

            }


            /* ================= LOGIN FAILED ================= */

            else {

                /*
                 * Wrong email OR wrong password
                 */

                response.sendRedirect(
                        "recruiter_login.jsp?error=1"
                );

            }


        } catch (Exception ex) {

            ex.printStackTrace();

            response.sendRedirect(
                    "recruiter_login.jsp?error=db"
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

    }
}