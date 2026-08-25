
package newpackage;

import java.sql.*;

public class AdminDashboardBean {

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private static final String USER =
            "system";

    private static final String PASSWORD =
            "manager";


    // =========================================================
    // DATABASE CONNECTION
    // =========================================================

    private Connection getConnection()
            throws SQLException, ClassNotFoundException {

        Class.forName(
                "oracle.jdbc.driver.OracleDriver"
        );

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );
    }


    // =========================================================
    // TOTAL USERS
    // =========================================================

    public int getTotalUsers() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENT_USERS";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }
public int getCurrentMonthUsers() {

    int total = 0;

    String sql =
            "SELECT COUNT(*) " +
            "FROM EVENT_USERS " +
            "WHERE DATE_REGISTERED >= TRUNC(SYSDATE,'MM')";

    try (
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {

        if (rs.next()) {
            total = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return total;
}


public int getPreviousMonthUsers() {

    int total = 0;

    String sql =
            "SELECT COUNT(*) " +
            "FROM EVENT_USERS " +
            "WHERE DATE_REGISTERED >= ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
            "AND DATE_REGISTERED < TRUNC(SYSDATE,'MM')";

    try (
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {

        if (rs.next()) {
            total = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return total;
}

    // =========================================================
    // TOTAL EVENT MANAGERS
    // =========================================================

    public int getTotalEventManagers() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENT_MANAGERS";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // TOTAL EVENTS
    // =========================================================

    public int getTotalEvents() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENTS";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // TOTAL BOOKINGS
    // =========================================================

    public int getTotalBookings() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM BOOKINGS";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // TOTAL ACCESSORIES
    // =========================================================

    public int getTotalAccessories() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM ACCESSORIES";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // TOTAL REVENUE
    // =========================================================

    public double getTotalRevenue() {

        double total = 0.0;

        String sql =
                "SELECT NVL(SUM(TOTAL_AMOUNT), 0) " +
                "FROM BOOKINGS " +
                "WHERE UPPER(NVL(STATUS,'UNKNOWN')) " +
                "<> 'CANCELLED'";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // CURRENT MONTH MANAGERS
    // =========================================================

    public int getCurrentMonthManagers() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENT_MANAGERS " +
                "WHERE DATE_ADDED >= TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // PREVIOUS MONTH MANAGERS
    // =========================================================

    public int getPreviousMonthManagers() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENT_MANAGERS " +
                "WHERE DATE_ADDED >= " +
                "ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND DATE_ADDED < TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // CURRENT MONTH EVENTS
    // =========================================================

    public int getCurrentMonthEvents() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENTS " +
                "WHERE EVENT_DATE >= TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // PREVIOUS MONTH EVENTS
    // =========================================================

    public int getPreviousMonthEvents() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM EVENTS " +
                "WHERE EVENT_DATE >= " +
                "ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND EVENT_DATE < TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // CURRENT MONTH BOOKINGS
    // =========================================================

    public int getCurrentMonthBookings() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE >= TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // PREVIOUS MONTH BOOKINGS
    // =========================================================

    public int getPreviousMonthBookings() {

        int total = 0;

        String sql =
                "SELECT COUNT(*) " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE >= " +
                "ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND BOOKING_DATE < TRUNC(SYSDATE,'MM')";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // CURRENT MONTH REVENUE
    // =========================================================

    public double getCurrentMonthRevenue() {

        double total = 0.0;

        String sql =
                "SELECT NVL(SUM(TOTAL_AMOUNT),0) " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE >= TRUNC(SYSDATE,'MM') " +
                "AND UPPER(NVL(STATUS,'UNKNOWN')) " +
                "<> 'CANCELLED'";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // PREVIOUS MONTH REVENUE
    // =========================================================

    public double getPreviousMonthRevenue() {

        double total = 0.0;

        String sql =
                "SELECT NVL(SUM(TOTAL_AMOUNT),0) " +
                "FROM BOOKINGS " +
                "WHERE BOOKING_DATE >= " +
                "ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) " +
                "AND BOOKING_DATE < TRUNC(SYSDATE,'MM') " +
                "AND UPPER(NVL(STATUS,'UNKNOWN')) " +
                "<> 'CANCELLED'";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {
                total = rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }


    // =========================================================
    // ADMIN NAME
    // =========================================================

    public String getAdminName() {

        String name = "Admin User";

        String sql =
                "SELECT NAME " +
                "FROM ADMIN " +
                "WHERE ROWNUM = 1";

        try (
                Connection con = getConnection();
                PreparedStatement ps =
                        con.prepareStatement(sql);
                ResultSet rs =
                        ps.executeQuery()
        ) {

            if (rs.next()) {

                String dbName =
                        rs.getString("NAME");

                if (dbName != null &&
                    !dbName.trim().isEmpty()) {

                    name = dbName;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return name;
    }
}

