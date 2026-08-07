package recruiter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modell.database;

@WebServlet("/RecruiterRegisterServlet")
public class RecruiterRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String company = request.getParameter("companyName");
        String hr = request.getParameter("hrName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String jobTitle = request.getParameter("jobTitle");
        String website = request.getParameter("website");
        String industry = request.getParameter("industry");
        String location = request.getParameter("location");
        String logo = request.getParameter("logo");
        String password = request.getParameter("password");

        try {

            database db = new database();
            Connection con = db.connectDB();

            String sql = "INSERT INTO recruiters(company_name, hr_contact_person, email, phone, job_title, website_url, industry, location, logo_url, password) VALUES(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, company);
            ps.setString(2, hr);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, jobTitle);
            ps.setString(6, website);
            ps.setString(7, industry);
            ps.setString(8, location);
            ps.setString(9, logo);
            ps.setString(10, password);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {
                response.sendRedirect("recruiter_login.jsp");
            } else {
                response.getWriter().println("Registration Failed");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().println(ex.getMessage());
        }
    }
}