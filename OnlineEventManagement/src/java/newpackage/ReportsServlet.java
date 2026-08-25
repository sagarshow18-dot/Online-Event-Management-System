
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportsServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String dateRange = request.getParameter("dateRange");
        String managerFilter = request.getParameter("manager");

        if (dateRange == null || dateRange.isEmpty()) {
            dateRange = "ALL";
        }

        if (managerFilter == null || managerFilter.isEmpty()) {
            managerFilter = "ALL";
        }

        // CSV export
        if ("csv".equalsIgnoreCase(action)) {
            exportCSV(response, dateRange, managerFilter);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            /*
             * ==========================================
             * COMMON DATE FILTER
             * ==========================================
             */
            String bookingDateCondition = buildDateCondition(
                    "b.BOOKING_DATE",
                    dateRange
            );

            String eventDateCondition = buildDateCondition(
                    "e.EVENT_DATE",
                    dateRange
            );


            /*
             * ==========================================
             * TOTAL EVENTS
             * ==========================================
             */

            String eventCountSql =
                    "SELECT COUNT(*) " +
                    "FROM EVENTS e " +
                    "WHERE 1=1 " +
                    eventDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                eventCountSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            ps = con.prepareStatement(eventCountSql);

            int parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            int totalEvents = 0;

            if (rs.next()) {
                totalEvents = rs.getInt(1);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * TOTAL BOOKINGS
             * ==========================================
             */

            String bookingCountSql =
                    "SELECT COUNT(*) " +
                    "FROM BOOKINGS b " +
                    "LEFT JOIN EVENTS e " +
                    "ON b.EVENT_ID = e.EVENT_ID " +
                    "WHERE 1=1 " +
                    bookingDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                bookingCountSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            ps = con.prepareStatement(bookingCountSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            int totalBookings = 0;

            if (rs.next()) {
                totalBookings = rs.getInt(1);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * TOTAL USERS
             * ==========================================
             */

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM EVENT_USERS"
            );

            rs = ps.executeQuery();

            int totalUsers = 0;

            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * TOTAL REVENUE
             * ==========================================
             */

            String revenueSql =
                    "SELECT NVL(SUM(b.TOTAL_AMOUNT),0) " +
                    "FROM BOOKINGS b " +
                    "LEFT JOIN EVENTS e " +
                    "ON b.EVENT_ID = e.EVENT_ID " +
                    "WHERE (UPPER(b.STATUS) <> 'CANCELLED' " +
                    "OR b.STATUS IS NULL) " +
                    bookingDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                revenueSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            ps = con.prepareStatement(revenueSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            double totalRevenue = 0.0;

            if (rs.next()) {
                totalRevenue = rs.getDouble(1);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * BOOKING STATUS
             * ==========================================
             */

            String statusSql =
                    "SELECT UPPER(NVL(b.STATUS,'UNKNOWN')) AS BOOKING_STATUS, " +
                    "COUNT(*) AS STATUS_COUNT " +
                    "FROM BOOKINGS b " +
                    "LEFT JOIN EVENTS e " +
                    "ON b.EVENT_ID = e.EVENT_ID " +
                    "WHERE 1=1 " +
                    bookingDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                statusSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            statusSql +=
                    " GROUP BY UPPER(NVL(b.STATUS,'UNKNOWN')) " +
                    " ORDER BY BOOKING_STATUS";

            ps = con.prepareStatement(statusSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            int confirmedBookings = 0;
            int pendingBookings = 0;
            int cancelledBookings = 0;
            int completedBookings = 0;

            while (rs.next()) {

                String status =
                        rs.getString("BOOKING_STATUS");

                int count =
                        rs.getInt("STATUS_COUNT");

                if ("CONFIRMED".equals(status)) {
                    confirmedBookings = count;

                } else if ("PENDING".equals(status)) {
                    pendingBookings = count;

                } else if ("CANCELLED".equals(status)) {
                    cancelledBookings = count;

                } else if ("COMPLETED".equals(status)) {
                    completedBookings = count;
                }
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * MANAGER LIST
             * ==========================================
             */

            List<String> managerList =
                    new ArrayList<>();

            ps = con.prepareStatement(
                    "SELECT NAME " +
                    "FROM EVENT_MANAGERS " +
                    "WHERE NAME IS NOT NULL " +
                    "ORDER BY NAME"
            );

            rs = ps.executeQuery();

            while (rs.next()) {
                managerList.add(
                        rs.getString("NAME")
                );
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * MONTHLY BOOKINGS
             * ==========================================
             */

            List<Map<String, Object>> monthlyBookings =
                    new ArrayList<>();

            String monthlyBookingSql =
                    "SELECT TO_CHAR(b.BOOKING_DATE,'Mon YYYY') AS MONTH_NAME, " +
                    "TO_CHAR(b.BOOKING_DATE,'YYYYMM') AS SORT_MONTH, " +
                    "COUNT(*) AS BOOKING_COUNT " +
                    "FROM BOOKINGS b " +
                    "LEFT JOIN EVENTS e " +
                    "ON b.EVENT_ID = e.EVENT_ID " +
                    "WHERE b.BOOKING_DATE IS NOT NULL " +
                    bookingDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                monthlyBookingSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            monthlyBookingSql +=
                    " GROUP BY " +
                    "TO_CHAR(b.BOOKING_DATE,'Mon YYYY'), " +
                    "TO_CHAR(b.BOOKING_DATE,'YYYYMM') " +
                    "ORDER BY SORT_MONTH";

            ps = con.prepareStatement(monthlyBookingSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            while (rs.next()) {

                Map<String, Object> item =
                        new HashMap<>();

                item.put(
                        "month",
                        rs.getString("MONTH_NAME")
                );

                item.put(
                        "count",
                        rs.getInt("BOOKING_COUNT")
                );

                monthlyBookings.add(item);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * MONTHLY REVENUE
             * ==========================================
             */

            List<Map<String, Object>> monthlyRevenue =
                    new ArrayList<>();

            String monthlyRevenueSql =
                    "SELECT TO_CHAR(b.BOOKING_DATE,'Mon YYYY') AS MONTH_NAME, " +
                    "TO_CHAR(b.BOOKING_DATE,'YYYYMM') AS SORT_MONTH, " +
                    "NVL(SUM(b.TOTAL_AMOUNT),0) AS MONTH_REVENUE " +
                    "FROM BOOKINGS b " +
                    "LEFT JOIN EVENTS e " +
                    "ON b.EVENT_ID = e.EVENT_ID " +
                    "WHERE b.BOOKING_DATE IS NOT NULL " +
                    "AND (UPPER(b.STATUS) <> 'CANCELLED' " +
                    "OR b.STATUS IS NULL) " +
                    bookingDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                monthlyRevenueSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            monthlyRevenueSql +=
                    " GROUP BY " +
                    "TO_CHAR(b.BOOKING_DATE,'Mon YYYY'), " +
                    "TO_CHAR(b.BOOKING_DATE,'YYYYMM') " +
                    "ORDER BY SORT_MONTH";

            ps = con.prepareStatement(monthlyRevenueSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(parameterIndex++, managerFilter);
            }

            rs = ps.executeQuery();

            double revenueTotal = 0.0;
            int revenuePeriods = 0;
            double bestRevenue = -1.0;
            String bestMonth = "N/A";

            while (rs.next()) {

                String month =
                        rs.getString("MONTH_NAME");

                double revenue =
                        rs.getDouble("MONTH_REVENUE");

                Map<String, Object> item =
                        new HashMap<>();

                item.put("month", month);
                item.put("revenue", revenue);

                monthlyRevenue.add(item);

                revenueTotal += revenue;
                revenuePeriods++;

                if (revenue > bestRevenue) {
                    bestRevenue = revenue;
                    bestMonth = month;
                }
            }

            double averageMonthlyRevenue = 0.0;

            if (revenuePeriods > 0) {
                averageMonthlyRevenue =
                        revenueTotal / revenuePeriods;
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * TOP PERFORMING EVENTS
             * ==========================================
             */

            List<Map<String, Object>> topEvents =
                    new ArrayList<>();

            String topEventsSql =
                    "SELECT * FROM (" +
                    " SELECT e.EVENT_ID, " +
                    " e.EVENT_NAME, " +
                    " e.CAPACITY, " +
                    " e.STATUS, " +
                    " NVL(SUM(CASE " +
                    " WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                    " OR b.STATUS IS NULL " +
                    " THEN NVL(b.QUANTITY,0) " +
                    " ELSE 0 END),0) AS BOOKING_COUNT, " +
                    " NVL(SUM(CASE " +
                    " WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                    " OR b.STATUS IS NULL " +
                    " THEN NVL(b.TOTAL_AMOUNT,0) " +
                    " ELSE 0 END),0) AS EVENT_REVENUE " +
                    " FROM EVENTS e " +
                    " LEFT JOIN BOOKINGS b " +
                    " ON e.EVENT_ID = b.EVENT_ID " +
                    " WHERE 1=1 " +
                    eventDateCondition;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                topEventsSql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?)";
            }

            topEventsSql +=
                    " GROUP BY e.EVENT_ID, " +
                    " e.EVENT_NAME, " +
                    " e.CAPACITY, " +
                    " e.STATUS " +
                    " ORDER BY BOOKING_COUNT DESC " +
                    ") WHERE ROWNUM <= 10";

            ps = con.prepareStatement(topEventsSql);

            parameterIndex = 1;

            if (!"ALL".equalsIgnoreCase(managerFilter)) {
                ps.setString(
                        parameterIndex++,
                        managerFilter
                );
            }

            rs = ps.executeQuery();

            while (rs.next()) {

                Map<String, Object> item =
                        new HashMap<>();

                int capacity =
                        rs.getInt("CAPACITY");

                int bookingCount =
                        rs.getInt("BOOKING_COUNT");

                double revenue =
                        rs.getDouble("EVENT_REVENUE");

                double occupancy = 0.0;

                if (capacity > 0) {
                    occupancy =
                            ((double) bookingCount
                            / capacity) * 100.0;
                }

                item.put(
                        "eventId",
                        rs.getInt("EVENT_ID")
                );

                item.put(
                        "eventName",
                        rs.getString("EVENT_NAME")
                );

                /*
                 * Current EVENTS table has no CATEGORY column.
                 */
                item.put(
                        "category",
                        "N/A"
                );

                item.put(
                        "bookings",
                        bookingCount
                );

                item.put(
                        "revenue",
                        revenue
                );

                item.put(
                        "capacity",
                        capacity
                );

                item.put(
                        "occupancy",
                        occupancy
                );

                item.put(
                        "status",
                        rs.getString("STATUS")
                );

                topEvents.add(item);
            }

            rs.close();
            ps.close();
            ps = null;


            /*
             * ==========================================
             * STATUS TOTAL
             * ==========================================
             */

            int totalStatusBookings =
                    confirmedBookings
                    + pendingBookings
                    + cancelledBookings
                    + completedBookings;


            /*
             * ==========================================
             * FIND MAXIMUM CHART VALUES
             * ==========================================
             */

            int maxMonthlyBookings = 1;

            for (Map<String, Object> item :
                    monthlyBookings) {

                int value =
                        (Integer) item.get("count");

                if (value > maxMonthlyBookings) {
                    maxMonthlyBookings = value;
                }
            }


            double maxMonthlyRevenue = 1.0;

            for (Map<String, Object> item :
                    monthlyRevenue) {

                double value =
                        (Double) item.get("revenue");

                if (value > maxMonthlyRevenue) {
                    maxMonthlyRevenue = value;
                }
            }


            /*
             * ==========================================
             * SEND DATA TO JSP
             * ==========================================
             */

            request.setAttribute(
                    "totalEvents",
                    totalEvents
            );

            request.setAttribute(
                    "totalBookings",
                    totalBookings
            );

            request.setAttribute(
                    "totalUsers",
                    totalUsers
            );

            request.setAttribute(
                    "totalRevenue",
                    totalRevenue
            );

            request.setAttribute(
                    "confirmedBookings",
                    confirmedBookings
            );

            request.setAttribute(
                    "pendingBookings",
                    pendingBookings
            );

            request.setAttribute(
                    "cancelledBookings",
                    cancelledBookings
            );

            request.setAttribute(
                    "completedBookings",
                    completedBookings
            );

            request.setAttribute(
                    "totalStatusBookings",
                    totalStatusBookings
            );

            request.setAttribute(
                    "managerList",
                    managerList
            );

            request.setAttribute(
                    "monthlyBookings",
                    monthlyBookings
            );

            request.setAttribute(
                    "monthlyRevenue",
                    monthlyRevenue
            );

            request.setAttribute(
                    "averageMonthlyRevenue",
                    averageMonthlyRevenue
            );

            request.setAttribute(
                    "bestMonth",
                    bestMonth
            );

            request.setAttribute(
                    "topEvents",
                    topEvents
            );

            request.setAttribute(
                    "maxMonthlyBookings",
                    maxMonthlyBookings
            );

            request.setAttribute(
                    "maxMonthlyRevenue",
                    maxMonthlyRevenue
            );

            request.setAttribute(
                    "selectedDateRange",
                    dateRange
            );

            request.setAttribute(
                    "selectedManager",
                    managerFilter
            );


            /*
             * Forward to reports.jsp
             *
             * Change this path if your JSP is stored
             * in a different folder.
             */
            request.getRequestDispatcher(
                    "/admin/professional_reports_analytics/reports.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception ignored) {}

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ignored) {}

            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception ignored) {}

        }
    }


    /*
     * =====================================================
     * BUILD DATE FILTER
     * =====================================================
     */
    private String buildDateCondition(
            String column,
            String range) {

        if (range == null ||
                "ALL".equalsIgnoreCase(range)) {

            return "";
        }

        if ("TODAY".equalsIgnoreCase(range)) {

            return
                    " AND TRUNC(" + column + ") = TRUNC(SYSDATE) ";
        }

        if ("7".equals(range)) {

            return
                    " AND " + column +
                    " >= TRUNC(SYSDATE) - 6 ";
        }

        if ("30".equals(range)) {

            return
                    " AND " + column +
                    " >= TRUNC(SYSDATE) - 29 ";
        }

        if ("90".equals(range)) {

            return
                    " AND " + column +
                    " >= ADD_MONTHS(TRUNC(SYSDATE), -3) ";
        }

        if ("YEAR".equalsIgnoreCase(range)) {

            return
                    " AND " + column +
                    " >= TRUNC(SYSDATE, 'YYYY') ";
        }

        return "";
    }


    /*
     * =====================================================
     * CSV EXPORT
     * =====================================================
     */
    private void exportCSV(
            HttpServletResponse response,
            String dateRange,
            String managerFilter)
            throws IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            Class.forName(
                    "oracle.jdbc.driver.OracleDriver"
            );

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );


            String sql =
                    "SELECT e.EVENT_ID, " +
                    "e.EVENT_NAME, " +
                    "e.EVENT_DATE, " +
                    "e.LOCATION, " +
                    "e.CAPACITY, " +
                    "e.STATUS, " +
                    "m.NAME AS MANAGER_NAME, " +
                    "NVL(SUM(CASE " +
                    "WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                    "OR b.STATUS IS NULL " +
                    "THEN NVL(b.QUANTITY,0) " +
                    "ELSE 0 END),0) AS BOOKINGS, " +
                    "NVL(SUM(CASE " +
                    "WHEN UPPER(b.STATUS) <> 'CANCELLED' " +
                    "OR b.STATUS IS NULL " +
                    "THEN NVL(b.TOTAL_AMOUNT,0) " +
                    "ELSE 0 END),0) AS REVENUE " +
                    "FROM EVENTS e " +
                    "LEFT JOIN EVENT_MANAGERS m " +
                    "ON e.MANAGER_ID = m.MANAGER_ID " +
                    "LEFT JOIN BOOKINGS b " +
                    "ON e.EVENT_ID = b.EVENT_ID " +
                    "WHERE 1=1 " +
                    buildDateCondition(
                            "e.EVENT_DATE",
                            dateRange
                    );

            if (!"ALL".equalsIgnoreCase(managerFilter)) {

                sql +=
                        " AND e.MANAGER_ID = " +
                        "(SELECT MANAGER_ID " +
                        " FROM EVENT_MANAGERS " +
                        " WHERE NAME = ?) ";
            }

            sql +=
                    " GROUP BY e.EVENT_ID, " +
                    "e.EVENT_NAME, " +
                    "e.EVENT_DATE, " +
                    "e.LOCATION, " +
                    "e.CAPACITY, " +
                    "e.STATUS, " +
                    "m.NAME " +
                    "ORDER BY e.EVENT_DATE DESC";


            ps = con.prepareStatement(sql);

            if (!"ALL".equalsIgnoreCase(managerFilter)) {

                ps.setString(
                        1,
                        managerFilter
                );
            }


            rs = ps.executeQuery();


            response.setContentType(
                    "text/csv;charset=UTF-8"
            );

            response.setHeader(
                    "Content-Disposition",
                    "attachment; filename=\"eventhub-report.csv\""
            );


            PrintWriter out =
                    response.getWriter();


            out.println(
                    "Event ID,Event Name,Event Date,Location," +
                    "Manager,Capacity,Bookings,Revenue,Status"
            );


            while (rs.next()) {

                String eventName =
                        safeCSV(
                                rs.getString("EVENT_NAME")
                        );

                String location =
                        safeCSV(
                                rs.getString("LOCATION")
                        );

                String manager =
                        safeCSV(
                                rs.getString("MANAGER_NAME")
                        );

                String status =
                        safeCSV(
                                rs.getString("STATUS")
                        );


                out.println(
                        rs.getInt("EVENT_ID") + "," +
                        eventName + "," +
                        rs.getDate("EVENT_DATE") + "," +
                        location + "," +
                        manager + "," +
                        rs.getInt("CAPACITY") + "," +
                        rs.getInt("BOOKINGS") + "," +
                        rs.getDouble("REVENUE") + "," +
                        status
                );
            }

            out.flush();

        } catch (Exception e) {

            throw new IOException(e);

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (Exception ignored) {}

            try {
                if (ps != null) ps.close();
            } catch (Exception ignored) {}

            try {
                if (con != null) con.close();
            } catch (Exception ignored) {}
        }
    }


    private String safeCSV(String value) {

        if (value == null) {
            return "";
        }

        return "\"" +
                value.replace("\"", "\"\"") +
                "\"";
    }
}

