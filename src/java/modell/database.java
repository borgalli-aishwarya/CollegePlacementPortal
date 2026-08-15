package modell;

import java.sql.Connection;
import java.sql.DriverManager;

public class database {

    public Connection connectDB() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/college_placement"
                + "?useSSL=false"
                + "&allowPublicKeyRetrieval=true"
                + "&serverTimezone=UTC",
                "root",
                "Aishu@1726"
            );

            System.out.println("Database Connected Successfully");

            return con;

        } catch (Exception e) {

            System.out.println("Database Connection Failed");
            e.printStackTrace();

            return null;
        }
    }
}