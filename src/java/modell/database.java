package modell;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class database {

    private Connection cn = null;
    private Statement st = null;

    public Connection connectDB() {

        try {

            // MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database connection
            cn = DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/college_placement?useSSL=false&serverTimezone=UTC",
                    "root",
                    "Aishu@1726"
            );

            System.out.println("Database Connected Successfully");

            return cn;

        } catch (Exception ex) {

            System.out.println("Database Connection Failed");
            ex.printStackTrace();

            return null;
        }
    }

    public String Query(String sql, String message) {

        try {

            if (cn == null || cn.isClosed()) {
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