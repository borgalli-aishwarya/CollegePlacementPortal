package modell;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class database {

    private Connection cn = null;
    private Statement st = null;

    public Connection connectDB() {

        try {

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to Database
            cn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/college_placement?useSSL=false&serverTimezone=UTC",
                    "root",
                    "Aishu@1726"
            );

            st = cn.createStatement();

            System.out.println("Database Connected Successfully");

            return cn;

        } catch (Exception ex) {

            ex.printStackTrace();
            return null;

        }

    }

    public String Query(String sql, String message) {

        try {

            if (cn == null) {
                connectDB();
            }

            st = cn.createStatement();
            st.executeUpdate(sql);

            return message;

        } catch (Exception ex) {

            ex.printStackTrace();
            return ex.getMessage();

        }

    }
}