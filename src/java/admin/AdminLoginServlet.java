package admin;

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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check empty fields
        if (username == null || username.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            response.sendRedirect("admin_Login.jsp?error=1");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            // Connect to database
            database db = new database();

            con = db.connectDB();

            // Check database connection
            if (con == null) {

                response.sendRedirect("admin_Login.jsp?error=db");
                return;
            }

            // Check admin username and password
            String sql =
                    "SELECT id, username " +
                    "FROM admin " +
                    "WHERE username = ? AND password = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, username.trim());
            ps.setString(2, password.trim());

            rs = ps.executeQuery();

            // Login successful
            if (rs.next()) {

                HttpSession session = request.getSession();

                session.setAttribute(
                        "adminId",
                        rs.getInt("id")
                );

                session.setAttribute(
                        "adminUsername",
                        rs.getString("username")
                );

                response.sendRedirect("adminDashboard.jsp");

            } else {

                // Wrong username/password
                response.sendRedirect(
                        "admin_Login.jsp?error=invalid"
                );
            }

        } catch (Exception ex) {

            ex.printStackTrace();

            response.sendRedirect(
                    "admin_Login.jsp?error=exception"
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


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("admin_Login.jsp");
    }
}