package newpackage;

import java.sql.*;

public class AdminDashboardBean {

    public int getTotalUsers() {

        int total = 0;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE",
                "system",
                "manager"
            );

            Statement stmt = con.createStatement();

            String query = "SELECT COUNT(*) FROM EVENT_USERS";

            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                total = rs.getInt(1);
            }

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }

        return total;
    }

    public int getTotalEventManagers() {
        return 0;
    }

    public int getTotalEvents() {
        return 0;
    }

    public int getTotalBookings() {
        return 0;
    }

    public int getTotalAccessories() {
        return 0;
    }
}