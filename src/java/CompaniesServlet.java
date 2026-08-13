package ;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modell.database;

@WebServlet("/CompaniesServlet")
public class CompaniesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Company> companies = new ArrayList<>();

        try {

            database db = new database();
            Connection con = db.connectDB();

            if (con == null) {
                throw new Exception("Database connection failed");
            }

            String sql = "SELECT company_name, industry, location, email "
                       + "FROM recruiters "
                       + "WHERE status = 'Approved'";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Company company = new Company();

                company.setName(rs.getString("company_name"));
                company.setIndustry(rs.getString("industry"));
                company.setLocation(rs.getString("location"));
                company.setEmail(rs.getString("email"));

                companies.add(company);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load companies."
            );
        }

        request.setAttribute("companiesList", companies);

        request.getRequestDispatcher("companies.jsp")
               .forward(request, response);
    }
}