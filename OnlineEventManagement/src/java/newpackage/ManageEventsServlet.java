
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

public class ManageEventsServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String eventIdParam = request.getParameter("eventId");

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
             * APPROVE EVENT
             */
            if ("approve".equalsIgnoreCase(action)
                    && eventIdParam != null
                    && !eventIdParam.isEmpty()) {

                int eventId = Integer.parseInt(eventIdParam);

                String updateSql =
                        "UPDATE EVENTS "
                        + "SET STATUS = ? "
                        + "WHERE EVENT_ID = ?";

                ps = con.prepareStatement(updateSql);

                ps.setString(1, "APPROVED");
                ps.setInt(2, eventId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * REJECT EVENT
             */
            else if ("reject".equalsIgnoreCase(action)
                    && eventIdParam != null
                    && !eventIdParam.isEmpty()) {

                int eventId = Integer.parseInt(eventIdParam);

                String updateSql =
                        "UPDATE EVENTS "
                        + "SET STATUS = ? "
                        + "WHERE EVENT_ID = ?";

                ps = con.prepareStatement(updateSql);

                ps.setString(1, "REJECTED");
                ps.setInt(2, eventId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * DELETE EVENT
             */
            else if ("delete".equalsIgnoreCase(action)
                    && eventIdParam != null
                    && !eventIdParam.isEmpty()) {

                int eventId = Integer.parseInt(eventIdParam);

                /*
                 * First delete related bookings because BOOKINGS
                 * contains EVENT_ID.
                 */
                String deleteBookingsSql =
                        "DELETE FROM BOOKINGS "
                        + "WHERE EVENT_ID = ?";

                ps = con.prepareStatement(deleteBookingsSql);

                ps.setInt(1, eventId);

                ps.executeUpdate();

                ps.close();
                ps = null;


                /*
                 * Delete event-accessory relationships if present.
                 */
                String deleteEventAccessoriesSql =
                        "DELETE FROM EVENT_ACCESSORIES "
                        + "WHERE EVENT_ID = ?";

                ps = con.prepareStatement(deleteEventAccessoriesSql);

                ps.setInt(1, eventId);

                ps.executeUpdate();

                ps.close();
                ps = null;


                /*
                 * Finally delete the event.
                 */
                String deleteEventSql =
                        "DELETE FROM EVENTS "
                        + "WHERE EVENT_ID = ?";

                ps = con.prepareStatement(deleteEventSql);

                ps.setInt(1, eventId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * LOAD EVENTS
             *
             * EVENT_MANAGERS.NAME is used as Organizer.
             *
             * BOOKINGS count is calculated for each event.
             */
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
                    + "ORDER BY e.EVENT_DATE DESC, e.EVENT_ID DESC";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            List<Map<String, Object>> eventList =
                    new ArrayList<>();


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
                        rs.getString("MANAGER_NAME")
                );


                event.put(
                        "bookingCount",
                        rs.getInt("BOOKING_COUNT")
                );


                eventList.add(event);
            }


            request.setAttribute(
                    "eventList",
                    eventList
            );


            /*
             * Forward to JSP
             */
            request.getRequestDispatcher(
                    "/admin/manage_events/manageEvents.jsp"
            ).forward(request, response);

        }

        catch (Exception e) {

            throw new ServletException(e);

        }

        finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            }

            catch (SQLException e) {
                e.printStackTrace();
            }


            try {
                if (ps != null) {
                    ps.close();
                }
            }

            catch (SQLException e) {
                e.printStackTrace();
            }


            try {
                if (con != null) {
                    con.close();
                }
            }

            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

