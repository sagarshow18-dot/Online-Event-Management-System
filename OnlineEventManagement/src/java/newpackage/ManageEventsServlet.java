
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ManageEventsServlet extends HttpServlet {

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private static final String USER =
            "system";

    private static final String PASSWORD =
            "manager";


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
HttpSession session = request.getSession(false);

if (session == null ||
        session.getAttribute("adminId") == null) {

    response.sendRedirect(
            request.getContextPath()
            + "/admin/admin_login/adminLogin.html"
    );

    return;
}

int adminId = Integer.parseInt(
        session.getAttribute("adminId").toString()
);
        String action =
                request.getParameter("action");

        String eventIdParam =
                request.getParameter("eventId");


        Connection con = null;


        try {

            // -------------------------------------------------
            // Load Oracle JDBC Driver
            // -------------------------------------------------

            Class.forName(
                    "oracle.jdbc.driver.OracleDriver"
            );


            // -------------------------------------------------
            // Connect to Oracle
            // -------------------------------------------------

            con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );
String profileSql =
        "SELECT PROFILE_IMAGE " +
        "FROM ADMIN " +
        "WHERE ADMIN_ID = ?";

try (PreparedStatement profilePs =
        con.prepareStatement(profileSql)) {

    profilePs.setInt(1, adminId);

    try (ResultSet profileRs =
            profilePs.executeQuery()) {

        String imageSource =
                request.getContextPath()
                + "/images/default-profile.png";

        if (profileRs.next()) {
            String profileImage =
                    profileRs.getString("PROFILE_IMAGE");

            if (profileImage != null &&
                    !profileImage.trim().isEmpty()) {

                imageSource =
                        request.getContextPath()
                        + "/"
                        + profileImage;
            }
        }

        request.setAttribute(
                "imageSource",
                imageSource
        );
    }
}

            // =================================================
            // APPROVE
            // =================================================

            if ("approve".equalsIgnoreCase(action)) {

                int eventId =
                        getValidEventId(
                                eventIdParam,
                                response
                        );

                if (eventId == -1) {
                    return;
                }


                String sql =
                        "UPDATE EVENTS " +
                        "SET STATUS = ? " +
                        "WHERE EVENT_ID = ?";


                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setString(
                            1,
                            "APPROVED"
                    );

                    ps.setInt(
                            2,
                            eventId
                    );


                    int updated =
                            ps.executeUpdate();


                    if (updated == 0) {

                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Event not found."
                        );

                        return;
                    }
                }


                // Prevent duplicate request on refresh
                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventsServlet"
                );

                return;
            }


            // =================================================
            // REJECT
            // =================================================

            if ("reject".equalsIgnoreCase(action)) {

                int eventId =
                        getValidEventId(
                                eventIdParam,
                                response
                        );

                if (eventId == -1) {
                    return;
                }


                String sql =
                        "UPDATE EVENTS " +
                        "SET STATUS = ? " +
                        "WHERE EVENT_ID = ?";


                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setString(
                            1,
                            "REJECTED"
                    );

                    ps.setInt(
                            2,
                            eventId
                    );


                    int updated =
                            ps.executeUpdate();


                    if (updated == 0) {

                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Event not found."
                        );

                        return;
                    }
                }


                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventsServlet"
                );

                return;
            }


            // =================================================
            // DELETE
            // =================================================

            if ("delete".equalsIgnoreCase(action)) {

                int eventId =
                        getValidEventId(
                                eventIdParam,
                                response
                        );

                if (eventId == -1) {
                    return;
                }


                /*
                 * Use a transaction because the event has
                 * related records in BOOKINGS and
                 * EVENT_ACCESSORIES.
                 */

                try {

                    con.setAutoCommit(false);


                    // -----------------------------------------
                    // Delete bookings
                    // -----------------------------------------

                    String deleteBookings =
                            "DELETE FROM BOOKINGS " +
                            "WHERE EVENT_ID = ?";


                    try (PreparedStatement ps =
                                 con.prepareStatement(
                                         deleteBookings
                                 )) {

                        ps.setInt(
                                1,
                                eventId
                        );

                        ps.executeUpdate();
                    }


                    // -----------------------------------------
                    // Delete event-accessory relationships
                    // -----------------------------------------

                    String deleteAccessories =
                            "DELETE FROM EVENT_ACCESSORIES " +
                            "WHERE EVENT_ID = ?";


                    try (PreparedStatement ps =
                                 con.prepareStatement(
                                         deleteAccessories
                                 )) {

                        ps.setInt(
                                1,
                                eventId
                        );

                        ps.executeUpdate();
                    }


                    // -----------------------------------------
                    // Delete actual event
                    // -----------------------------------------

                    String deleteEvent =
                            "DELETE FROM EVENTS " +
                            "WHERE EVENT_ID = ?";


                    int deleted;


                    try (PreparedStatement ps =
                                 con.prepareStatement(
                                         deleteEvent
                                 )) {

                        ps.setInt(
                                1,
                                eventId
                        );

                        deleted =
                                ps.executeUpdate();
                    }


                    if (deleted == 0) {

                        con.rollback();

                        response.sendError(
                                HttpServletResponse.SC_NOT_FOUND,
                                "Event not found."
                        );

                        return;
                    }


                    con.commit();


                } catch (SQLException e) {

                    try {
                        con.rollback();
                    } catch (SQLException ignored) {
                    }

                    throw e;

                } finally {

                    try {
                        con.setAutoCommit(true);
                    } catch (SQLException ignored) {
                    }
                }


                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventsServlet"
                );

                return;
            }


            // =================================================
            // VIEW
            // =================================================

            /*
             * Your current JSP sends:
             *
             * ManageEventsServlet?action=view&eventId=ID
             *
             * The old servlet did not handle this action.
             *
             * We load the event here and put its values into
             * request attributes.
             *
             * This JSP path must exist in your project:
             *
             * /admin/manage_events/viewEvent.jsp
             */

            if ("view".equalsIgnoreCase(action)) {

                int eventId =
                        getValidEventId(
                                eventIdParam,
                                response
                        );

                if (eventId == -1) {
                    return;
                }


                String sql =
                        "SELECT e.EVENT_ID, " +
                        "e.EVENT_NAME, " +
                        "e.DESCRIPTION, " +
                        "e.EVENT_DATE, " +
                        "e.EVENT_TIME, " +
                        "e.LOCATION, " +
                        "e.MANAGER_ID, " +
                        "m.NAME AS MANAGER_NAME, " +
                        "e.CAPACITY, " +
                        "e.PRICE, " +
                        "e.STATUS " +
                        "FROM EVENTS e " +
                        "LEFT JOIN EVENT_MANAGERS m " +
                        "ON e.MANAGER_ID = m.MANAGER_ID " +
                        "WHERE e.EVENT_ID = ?";


                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setInt(
                            1,
                            eventId
                    );


                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        if (!rs.next()) {

                            response.sendError(
                                    HttpServletResponse.SC_NOT_FOUND,
                                    "Event not found."
                            );

                            return;
                        }


                        request.setAttribute(
                                "eventId",
                                rs.getInt("EVENT_ID")
                        );


                        request.setAttribute(
                                "eventName",
                                rs.getString("EVENT_NAME")
                        );


                        request.setAttribute(
                                "description",
                                rs.getString("DESCRIPTION")
                        );


                        request.setAttribute(
                                "eventDate",
                                rs.getDate("EVENT_DATE")
                        );


                        request.setAttribute(
                                "eventTime",
                                rs.getString("EVENT_TIME")
                        );


                        request.setAttribute(
                                "location",
                                rs.getString("LOCATION")
                        );


                        request.setAttribute(
                                "managerId",
                                rs.getInt("MANAGER_ID")
                        );


                        request.setAttribute(
                                "managerName",
                                rs.getString(
                                        "MANAGER_NAME"
                                )
                        );


                        request.setAttribute(
                                "capacity",
                                rs.getInt("CAPACITY")
                        );


                        request.setAttribute(
                                "price",
                                rs.getBigDecimal("PRICE")
                        );


                        request.setAttribute(
                                "status",
                                rs.getString("STATUS")
                        );
                    }
                }


                /*
                 * Only use this if viewEvent.jsp actually exists.
                 */
                request.getRequestDispatcher(
                        "/admin/manage_events/viewEvent.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }


            // =================================================
            // EDIT
            // =================================================

            /*
             * Your current JSP sends:
             *
             * ManageEventsServlet?action=edit&eventId=ID
             *
             * This loads the event values into request
             * attributes for the edit JSP.
             *
             * The destination JSP must exist:
             *
             * /admin/manage_events/editEvent.jsp
             */

            if ("edit".equalsIgnoreCase(action)) {

                int eventId =
                        getValidEventId(
                                eventIdParam,
                                response
                        );

                if (eventId == -1) {
                    return;
                }


                String sql =
                        "SELECT EVENT_ID, " +
                        "EVENT_NAME, " +
                        "DESCRIPTION, " +
                        "EVENT_DATE, " +
                        "EVENT_TIME, " +
                        "LOCATION, " +
                        "MANAGER_ID, " +
                        "CAPACITY, " +
                        "PRICE, " +
                        "STATUS " +
                        "FROM EVENTS " +
                        "WHERE EVENT_ID = ?";


                try (PreparedStatement ps =
                             con.prepareStatement(sql)) {

                    ps.setInt(
                            1,
                            eventId
                    );


                    try (ResultSet rs =
                                 ps.executeQuery()) {

                        if (!rs.next()) {

                            response.sendError(
                                    HttpServletResponse.SC_NOT_FOUND,
                                    "Event not found."
                            );

                            return;
                        }


                        request.setAttribute(
                                "eventId",
                                rs.getInt("EVENT_ID")
                        );


                        request.setAttribute(
                                "eventName",
                                rs.getString("EVENT_NAME")
                        );


                        request.setAttribute(
                                "description",
                                rs.getString("DESCRIPTION")
                        );


                        request.setAttribute(
                                "eventDate",
                                rs.getDate("EVENT_DATE")
                        );


                        request.setAttribute(
                                "eventTime",
                                rs.getString("EVENT_TIME")
                        );


                        request.setAttribute(
                                "location",
                                rs.getString("LOCATION")
                        );


                        request.setAttribute(
                                "managerId",
                                rs.getInt("MANAGER_ID")
                        );


                        request.setAttribute(
                                "capacity",
                                rs.getInt("CAPACITY")
                        );


                        request.setAttribute(
                                "price",
                                rs.getBigDecimal("PRICE")
                        );


                        request.setAttribute(
                                "status",
                                rs.getString("STATUS")
                        );
                    }
                }


                /*
                 * Only use this if editEvent.jsp actually exists.
                 */
                request.getRequestDispatcher(
                        "/admin/manage_events/editEvent.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }


            // =================================================
            // LOAD ALL EVENTS
            // =================================================

            String sql =
                    "SELECT e.EVENT_ID, "
                    + "e.EVENT_NAME, "
                    + "e.EVENT_DATE, "
                    + "e.LOCATION, "
                    + "e.CAPACITY, "
                    + "e.STATUS, "
                    + "e.MANAGER_ID, "
                    + "m.NAME AS MANAGER_NAME, "
                    + "COUNT(b.BOOKING_ID) AS BOOKING_COUNT "
                    + "FROM EVENTS e "
                    + "LEFT JOIN EVENT_MANAGERS m "
                    + "ON e.MANAGER_ID = m.MANAGER_ID "
                    + "LEFT JOIN BOOKINGS b "
                    + "ON e.EVENT_ID = b.EVENT_ID "
                    + "GROUP BY "
                    + "e.EVENT_ID, "
                    + "e.EVENT_NAME, "
                    + "e.EVENT_DATE, "
                    + "e.LOCATION, "
                    + "e.CAPACITY, "
                    + "e.STATUS, "
                    + "e.MANAGER_ID, "
                    + "m.NAME "
                    + "ORDER BY "
                    + "e.EVENT_DATE DESC, "
                    + "e.EVENT_ID DESC";


            List<Map<String, Object>> eventList =
                    new ArrayList<>();


            try (PreparedStatement ps =
                         con.prepareStatement(sql);

                 ResultSet rs =
                         ps.executeQuery()) {


                while (rs.next()) {

                    Map<String, Object> event =
                            new HashMap<>();


                    event.put(
                            "eventId",
                            rs.getInt("EVENT_ID")
                    );


                    event.put(
                            "eventName",
                            rs.getString("EVENT_NAME")
                    );


                    event.put(
                            "eventDate",
                            rs.getDate("EVENT_DATE")
                    );


                    event.put(
                            "location",
                            rs.getString("LOCATION")
                    );


                    event.put(
                            "capacity",
                            rs.getInt("CAPACITY")
                    );


                    event.put(
                            "status",
                            rs.getString("STATUS")
                    );


                    event.put(
                            "managerId",
                            rs.getInt("MANAGER_ID")
                    );


                    event.put(
                            "managerName",
                            rs.getString(
                                    "MANAGER_NAME"
                            )
                    );


                    event.put(
                            "bookingCount",
                            rs.getInt("BOOKING_COUNT")
                    );


                    eventList.add(
                            event
                    );
                }
            }


            // -------------------------------------------------
            // Send eventList to JSP
            // -------------------------------------------------

            request.setAttribute(
                    "eventList",
                    eventList
            );


            // -------------------------------------------------
            // Open Manage Events JSP
            // -------------------------------------------------

            request.getRequestDispatcher(
                    "/admin/manage_events/manageEvents.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Event ID."
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing events.",
                    e
            );


        } catch (ClassNotFoundException e) {

            throw new ServletException(
                    "Oracle JDBC Driver not found.",
                    e
            );


        } catch (Exception e) {

            throw new ServletException(
                    "Error while managing events.",
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
    // VALIDATE EVENT ID
    // =========================================================

    private int getValidEventId(
            String eventIdParam,
            HttpServletResponse response)
            throws IOException {

        if (eventIdParam == null ||
                eventIdParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Event ID is required."
            );

            return -1;
        }


        try {

            return Integer.parseInt(
                    eventIdParam.trim()
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Event ID."
            );

            return -1;
        }
    }
}

