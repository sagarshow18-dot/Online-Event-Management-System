package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.LocalDate;

public class ManageBookingsServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String bookingIdParam = request.getParameter("bookingId");

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

            // Cancel booking
            if ("cancel".equalsIgnoreCase(action)
                    && bookingIdParam != null
                    && !bookingIdParam.isEmpty()) {

                int bookingId = Integer.parseInt(bookingIdParam);

                String updateSql =
                        "UPDATE BOOKINGS "
                        + "SET STATUS = ? "
                        + "WHERE BOOKING_ID = ?";

                ps = con.prepareStatement(updateSql);

                ps.setString(1, "CANCELLED");
                ps.setInt(2, bookingId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            // Delete booking
            else if ("delete".equalsIgnoreCase(action)
                    && bookingIdParam != null
                    && !bookingIdParam.isEmpty()) {

                int bookingId = Integer.parseInt(bookingIdParam);

                String deleteSql =
                        "DELETE FROM BOOKINGS "
                        + "WHERE BOOKING_ID = ?";

                ps = con.prepareStatement(deleteSql);

                ps.setInt(1, bookingId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            /*
             * Load booking information.
             *
             * BOOKINGS contains USER_ID and EVENT_ID, not the
             * actual user/event names, so we use LEFT JOINs.
             *
             * If EVENT_USERS and EVENTS contain NAME/TITLE columns,
             * those values will be displayed.
             */
            String sql =
                    "SELECT b.BOOKING_ID, "
                    + "b.USER_ID, "
                    + "b.EVENT_ID, "
                    + "b.BOOKING_DATE, "
                    + "b.QUANTITY, "
                    + "b.TOTAL_AMOUNT, "
                    + "b.STATUS, "
                    + "u.NAME AS USER_NAME, "
                    + "e.EVENT_NAME AS EVENT_TITLE  "
                    + "FROM BOOKINGS b "
                    + "LEFT JOIN EVENT_USERS u "
                    + "ON b.USER_ID = u.USER_ID "
                    + "LEFT JOIN EVENTS e "
                    + "ON b.EVENT_ID = e.EVENT_ID "
                    + "ORDER BY b.BOOKING_DATE DESC, b.BOOKING_ID DESC";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            List<Map<String, Object>> bookingList =
                    new ArrayList<>();

            while (rs.next()) {

                Map<String, Object> booking =
                        new HashMap<>();

                booking.put(
                        "bookingId",
                        rs.getInt("BOOKING_ID")
                );

                booking.put(
                        "userId",
                        rs.getInt("USER_ID")
                );

                booking.put(
                        "eventId",
                        rs.getInt("EVENT_ID")
                );

                booking.put(
                        "bookingDate",
                        rs.getDate("BOOKING_DATE")
                );

                booking.put(
                        "quantity",
                        rs.getInt("QUANTITY")
                );

                booking.put(
                        "totalAmount",
                        rs.getBigDecimal("TOTAL_AMOUNT")
                );

                booking.put(
                        "status",
                        rs.getString("STATUS")
                );

                booking.put(
                        "userName",
                        rs.getString("USER_NAME")
                );

                booking.put(
                        "eventTitle",
                        rs.getString("EVENT_TITLE")
                );

                bookingList.add(booking);
            }

            request.setAttribute(
        "bookingList",
        bookingList
);

int totalBookings = 0;
int pendingBookings = 0;
java.math.BigDecimal totalRevenue = java.math.BigDecimal.ZERO;

int thisMonthBookings = 0;
int previousMonthBookings = 0;

LocalDate today = LocalDate.now();

int currentMonth = today.getMonthValue();
int currentYear = today.getYear();

LocalDate previousMonthDate = today.minusMonths(1);

int previousMonth = previousMonthDate.getMonthValue();
int previousMonthYear = previousMonthDate.getYear();


for (java.util.Map<String, Object> booking : bookingList) {

    totalBookings++;

    String status = booking.get("status") != null
            ? booking.get("status").toString()
            : "";

    if ("PENDING".equalsIgnoreCase(status)) {
        pendingBookings++;
    }

    java.sql.Date sqlDate =
            (java.sql.Date) booking.get("bookingDate");

    java.math.BigDecimal amount =
            (java.math.BigDecimal) booking.get("totalAmount");

    if (sqlDate != null) {

        LocalDate bookingDate =
                sqlDate.toLocalDate();

        // Revenue for current year
        if (bookingDate.getYear() == currentYear
                && amount != null) {

            totalRevenue =
                    totalRevenue.add(amount);
        }

        // Current month bookings
        if (bookingDate.getMonthValue() == currentMonth
                && bookingDate.getYear() == currentYear) {

            thisMonthBookings++;

        }

        // Previous month bookings
        else if (bookingDate.getMonthValue() == previousMonth
                && bookingDate.getYear() == previousMonthYear) {

            previousMonthBookings++;
        }
    }
}


double monthlyChange = 0.0;

if (previousMonthBookings > 0) {

    monthlyChange =
            ((double) (thisMonthBookings - previousMonthBookings)
            / previousMonthBookings) * 100.0;

} else if (thisMonthBookings > 0) {

    monthlyChange = 100.0;
}


request.setAttribute("totalBookings", totalBookings);
request.setAttribute("pendingBookings", pendingBookings);
request.setAttribute("totalRevenue", totalRevenue);
request.setAttribute("monthlyChange", monthlyChange);





            request.getRequestDispatcher(
                    "/admin/manage_bookings/manageBookings.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}