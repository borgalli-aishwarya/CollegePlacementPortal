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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.sendRedirect("admin_Login.jsp?error=1");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            database db = new database();
            con = db.connectDB();

            if (con == null) {
                response.sendRedirect("admin_Login.jsp?error=db");
                return;
            }

            // Check admin table by username or email
            String sql = "SELECT id, username FROM admin WHERE (username = ? OR username = ?) AND password = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email.trim());
            ps.setString(2, email.split("@")[0]);
            ps.setString(3, password.trim());

            rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminId", rs.getInt("id"));
                session.setAttribute("adminUser", rs.getString("username"));
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("admin_Login.jsp?error=invalid");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("admin_Login.jsp?error=exception");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin_Login.jsp");
    }
}
