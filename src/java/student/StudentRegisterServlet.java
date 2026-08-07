package student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modell.database;

@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String prn = request.getParameter("prn");
        String college = request.getParameter("college");
        String branch = request.getParameter("branch");
        String year = request.getParameter("year");
        String semester = request.getParameter("semester");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

        try {

            database db = new database();
            Connection con = db.connectDB();

            if (con == null) {
                response.getWriter().println("<h3>Database Connection Failed</h3>");
                return;
            }

            System.out.println("Database Connected");

            String sql = "INSERT INTO students(name,email,mobile,prn,college,branch,year,semester,dob,gender,password) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, prn);
            ps.setString(5, college);
            ps.setString(6, branch);

            ps.setInt(7, Integer.parseInt(year));
            ps.setInt(8, Integer.parseInt(semester));

            ps.setString(9, dob);
            ps.setString(10, gender);
            ps.setString(11, password);

            System.out.println("Executing Insert...");

            int result = ps.executeUpdate();

            System.out.println("Rows Inserted = " + result);

            ps.close();
            con.close();

            if (result > 0) {
                response.sendRedirect("student_login.jsp");
            } else {
                response.getWriter().println("<h3>Registration Failed!</h3>");
            }

        } catch (NumberFormatException e) {

            response.getWriter().println("<h3>Year or Semester is not numeric.</h3>");
            e.printStackTrace(response.getWriter());

        } catch (Exception e) {

            response.getWriter().println("<h3>Exception Occurred</h3>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
        }
    }
}