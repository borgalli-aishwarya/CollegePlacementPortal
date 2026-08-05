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
            Class.forName("com.mysql.jdbc.Driver");

            // Database Connection
            cn = DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1:3306/college_placement",
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

            st = cn.createStatement();
            st.executeUpdate(sql);

            return message;

        } catch (Exception ex) {

            ex.printStackTrace();
            return ex.getMessage();

        }

    }

}