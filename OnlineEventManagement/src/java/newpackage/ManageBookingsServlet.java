
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

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private static final String USER =
            "system";

    private static final String PASSWORD =
            "manager";


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        String bookingIdParam =
                request.getParameter("bookingId");

        Connection con = null;

        try {

            // =================================================
            // LOAD ORACLE DRIVER
            // =================================================

            Class.forName(
                    "oracle.jdbc.driver.OracleDriver"
            );


            // =================================================
            // DATABASE CONNECTION
            // =================================================

            con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );


            // =================================================
            // CANCEL BOOKING
            // =================================================

            if ("cancel".equalsIgnoreCase(action)) {

                int bookingId =
                        getValidBookingId(
                                bookingIdParam,
                                response
                        );

                if (bookingId == -1) {
                    return;
                }


                String updateSql =
                        "UPDATE BOOKINGS " +
                        "SET STATUS = ? " +
                        "WHERE BOOKING_ID = ?";


                try (
                        PreparedStatement ps =
                                con.prepareStatement(updateSql)
                ) {

                    ps.setString(
                            1,
                            "CANCELLED"
                    );

                    ps.setInt(
                            2,
                            bookingId
                    );


                    int updated =
                            ps.executeUpdate();


                    if (updated == 0) {

                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Booking not found."
                        );

                        return;
                    }
                }


                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageBookingsServlet"
                );

                return;
            }


            // =================================================
            // DELETE BOOKING
            // =================================================

            if ("delete".equalsIgnoreCase(action)) {

                int bookingId =
                        getValidBookingId(
                                bookingIdParam,
                                response
                        );

                if (bookingId == -1) {
                    return;
                }


                String deleteSql =
                        "DELETE FROM BOOKINGS " +
                        "WHERE BOOKING_ID = ?";


                try (
                        PreparedStatement ps =
                                con.prepareStatement(deleteSql)
                ) {

                    ps.setInt(
                            1,
                            bookingId
                    );


                    int deleted =
                            ps.executeUpdate();


                    if (deleted == 0) {

                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Booking not found."
                        );

                        return;
                    }
                }


                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageBookingsServlet"
                );

                return;
            }


            // =================================================
            // LOAD BOOKINGS
            // =================================================

            String sql =
                    "SELECT "
                    + "b.BOOKING_ID, "
                    + "b.USER_ID, "
                    + "b.EVENT_ID, "
                    + "b.BOOKING_DATE, "
                    + "b.QUANTITY, "
                    + "b.TOTAL_AMOUNT, "
                    + "b.STATUS, "
                    + "u.NAME AS USER_NAME, "
                    + "e.EVENT_NAME AS EVENT_TITLE, "
                    + "m.NAME AS ORGANIZER_NAME "
                    + "FROM BOOKINGS b "
                    + "LEFT JOIN EVENT_USERS u "
                    + "ON b.USER_ID = u.USER_ID "
                    + "LEFT JOIN EVENTS e "
                    + "ON b.EVENT_ID = e.EVENT_ID "
                    + "LEFT JOIN EVENT_MANAGERS m "
                    + "ON e.MANAGER_ID = m.MANAGER_ID "
                    + "ORDER BY "
                    + "b.BOOKING_DATE DESC, "
                    + "b.BOOKING_ID DESC";


            List<Map<String, Object>> bookingList =
                    new ArrayList<>();


            try (
                    PreparedStatement ps =
                            con.prepareStatement(sql);

                    ResultSet rs =
                            ps.executeQuery()
            ) {

                while (rs.next()) {

                    Map<String, Object> booking =
                            new HashMap<>();


                    // Booking ID

                    booking.put(
                            "bookingId",
                            rs.getInt("BOOKING_ID")
                    );


                    // User ID

                    booking.put(
                            "userId",
                            rs.getInt("USER_ID")
                    );


                    // Event ID

                    booking.put(
                            "eventId",
                            rs.getInt("EVENT_ID")
                    );


                    // Booking Date

                    booking.put(
                            "bookingDate",
                            rs.getDate("BOOKING_DATE")
                    );


                    // Quantity

                    booking.put(
                            "quantity",
                            rs.getInt("QUANTITY")
                    );


                    // Total Amount

                    booking.put(
                            "totalAmount",
                            rs.getBigDecimal(
                                    "TOTAL_AMOUNT"
                            )
                    );


                    // Status

                    booking.put(
                            "status",
                            rs.getString("STATUS")
                    );


                    // User Name

                    booking.put(
                            "userName",
                            rs.getString("USER_NAME")
                    );


                    // Event Title

                    booking.put(
                            "eventTitle",
                            rs.getString("EVENT_TITLE")
                    );


                    // Organizer

                    booking.put(
                            "organizer",
                            rs.getString(
                                    "ORGANIZER_NAME"
                            )
                    );


                    bookingList.add(
                            booking
                    );
                }
            }


            // =================================================
            // CALCULATE STATISTICS
            // =================================================

            int totalBookings = 0;

            int pendingBookings = 0;

            int thisMonthBookings = 0;

            int previousMonthBookings = 0;


            java.math.BigDecimal totalRevenue =
                    java.math.BigDecimal.ZERO;


            LocalDate today =
                    LocalDate.now();


            int currentMonth =
                    today.getMonthValue();


            int currentYear =
                    today.getYear();


            LocalDate previousMonthDate =
                    today.minusMonths(1);


            int previousMonth =
                    previousMonthDate.getMonthValue();


            int previousMonthYear =
                    previousMonthDate.getYear();


            // =================================================
            // PROCESS EACH BOOKING
            // =================================================

            for (
                    Map<String, Object> booking :
                    bookingList
            ) {

                totalBookings++;


                String status =
                        booking.get("status") != null
                        ? booking.get("status").toString()
                        : "";


                // ---------------------------------------------
                // PENDING BOOKINGS
                // ---------------------------------------------

                if (
                        "PENDING".equalsIgnoreCase(
                                status
                        )
                ) {

                    pendingBookings++;
                }


                java.sql.Date sqlDate =
                        (java.sql.Date)
                        booking.get(
                                "bookingDate"
                        );


                java.math.BigDecimal amount =
                        (java.math.BigDecimal)
                        booking.get(
                                "totalAmount"
                        );


                if (sqlDate != null) {

                    LocalDate bookingDate =
                            sqlDate.toLocalDate();


                    // -----------------------------------------
                    // CURRENT YEAR REVENUE
                    // -----------------------------------------

                    if (
                            bookingDate.getYear()
                                    == currentYear
                            &&
                            amount != null
                            &&
                            !"CANCELLED".equalsIgnoreCase(
                                    status
                            )
                    ) {

                        totalRevenue =
                                totalRevenue.add(
                                        amount
                                );
                    }


                    // -----------------------------------------
                    // CURRENT MONTH BOOKINGS
                    // -----------------------------------------

                    if (
                            bookingDate.getMonthValue()
                                    == currentMonth
                            &&
                            bookingDate.getYear()
                                    == currentYear
                    ) {

                        thisMonthBookings++;

                    }


                    // -----------------------------------------
                    // PREVIOUS MONTH BOOKINGS
                    // -----------------------------------------

                    else if (
                            bookingDate.getMonthValue()
                                    == previousMonth
                            &&
                            bookingDate.getYear()
                                    == previousMonthYear
                    ) {

                        previousMonthBookings++;
                    }
                }
            }


            // =================================================
            // MONTHLY CHANGE
            // =================================================

            double monthlyChange =
                    0.0;


            if (
                    previousMonthBookings > 0
            ) {

                monthlyChange =
                        ((double)
                                (
                                    thisMonthBookings
                                    -
                                    previousMonthBookings
                                )
                        /
                        previousMonthBookings)
                        *
                        100.0;

            } else if (
                    thisMonthBookings > 0
            ) {

                monthlyChange =
                        100.0;
            }


            // =================================================
            // SEND DATA TO JSP
            // =================================================

            request.setAttribute(
                    "bookingList",
                    bookingList
            );


            request.setAttribute(
                    "totalBookings",
                    totalBookings
            );


            request.setAttribute(
                    "pendingBookings",
                    pendingBookings
            );


            request.setAttribute(
                    "totalRevenue",
                    totalRevenue
            );


            request.setAttribute(
                    "monthlyChange",
                    monthlyChange
            );


            // =================================================
            // OPEN JSP
            // =================================================

            request.getRequestDispatcher(
                    "/admin/manage_bookings/manageBookings.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Booking ID."
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing bookings.",
                    e
            );


        } catch (ClassNotFoundException e) {

            throw new ServletException(
                    "Oracle JDBC Driver not found.",
                    e
            );


        } catch (Exception e) {

            throw new ServletException(
                    "Error while managing bookings.",
                    e
            );


        } finally {

            try {

                if (con != null) {
                    con.close();
                }

            } catch (SQLException ignored) {
            }
        }
    }


    // =========================================================
    // VALIDATE BOOKING ID
    // =========================================================

    private int getValidBookingId(
            String bookingIdParam,
            HttpServletResponse response)
            throws IOException {


        if (
                bookingIdParam == null ||
                bookingIdParam.trim().isEmpty()
        ) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Booking ID is required."
            );

            return -1;
        }


        try {

            return Integer.parseInt(
                    bookingIdParam.trim()
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Booking ID."
            );

            return -1;
        }
    }
}

