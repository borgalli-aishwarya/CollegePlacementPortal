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

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            /* ================= DATABASE CONNECTION ================= */

            database db = new database();

            con = db.connectDB();

            if (con == null) {

                response.sendRedirect(
                        "student_login.jsp?error=db"
                );

                return;
            }


            /* ================= LOGIN QUERY ================= */

            String sql =
                    "SELECT id, name, email " +
                    "FROM students " +
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
                        "studentId",
                        rs.getInt("id")
                );

                session.setAttribute(
                        "studentName",
                        rs.getString("name")
                );

                session.setAttribute(
                        "studentEmail",
                        rs.getString("email")
                );


                /* Open student dashboard */

                response.sendRedirect(
                        "studentDashboard.jsp"
                );

            }


            /* ================= LOGIN FAILED ================= */

            else {

                /*
                 * Wrong email OR wrong password
                 */

                response.sendRedirect(
                        "student_login.jsp?error=1"
                );

            }


        } catch (Exception ex) {

            ex.printStackTrace();

            response.sendRedirect(
                    "student_login.jsp?error=db"
            );


        } finally {

            /* ================= CLOSE RESULTSET ================= */

            try {

                if (rs != null) {
                    rs.close();
                }

            } catch (Exception e) {
            }


            /* ================= CLOSE STATEMENT ================= */

            try {

                if (ps != null) {
                    ps.close();
                }

            } catch (Exception e) {
            }


            /* ================= CLOSE CONNECTION ================= */

            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {
            }

        }

    }
}