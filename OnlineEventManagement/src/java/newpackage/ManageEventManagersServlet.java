
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ManageEventManagersServlet extends HttpServlet {

    private final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private final String USER =
            "system";

    private final String PASSWORD =
            "manager";


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        String managerIdParam =
                request.getParameter("managerId");


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


            /*
             * =========================================
             * DISABLE MANAGER
             * =========================================
             */

            if ("disable".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.trim().isEmpty()) {

                int managerId =
                        Integer.parseInt(
                                managerIdParam
                        );


                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET STATUS = ? " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(sql);

                ps.setString(
                        1,
                        "INACTIVE"
                );

                ps.setInt(
                        2,
                        managerId
                );

                ps.executeUpdate();


                ps.close();
                ps = null;
            }


            /*
             * =========================================
             * ENABLE MANAGER
             * =========================================
             */

            else if ("enable".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.trim().isEmpty()) {

                int managerId =
                        Integer.parseInt(
                                managerIdParam
                        );


                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET STATUS = ? " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(sql);

                ps.setString(
                        1,
                        "ACTIVE"
                );

                ps.setInt(
                        2,
                        managerId
                );

                ps.executeUpdate();


                ps.close();
                ps = null;
            }


            /*
             * =========================================
             * DELETE MANAGER
             * =========================================
             */

            else if ("delete".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.trim().isEmpty()) {

                int managerId =
                        Integer.parseInt(
                                managerIdParam
                        );


                /*
                 * First check whether this manager
                 * has events.
                 *
                 * Because EVENTS.MANAGER_ID is a
                 * foreign key, deleting a manager who
                 * owns events can fail with ORA-02292.
                 */

                String checkSql =
                        "SELECT COUNT(*) AS EVENT_COUNT " +
                        "FROM EVENTS " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(checkSql);

                ps.setInt(
                        1,
                        managerId
                );

                rs = ps.executeQuery();


                int eventCount = 0;

                if (rs.next()) {

                    eventCount =
                            rs.getInt(
                                    "EVENT_COUNT"
                            );
                }


                rs.close();
                rs = null;

                ps.close();
                ps = null;


                /*
                 * Do not delete manager if
                 * events still belong to it.
                 */

                if (eventCount > 0) {

                    request.setAttribute(
                            "message",
                            "This manager cannot be deleted because "
                            + eventCount
                            + " event(s) are assigned to this manager. "
                            + "Please reassign or delete those events first."
                    );

                } else {

                    String deleteSql =
                            "DELETE FROM EVENT_MANAGERS " +
                            "WHERE MANAGER_ID = ?";


                    ps = con.prepareStatement(
                            deleteSql
                    );

                    ps.setInt(
                            1,
                            managerId
                    );

                    ps.executeUpdate();


                    ps.close();
                    ps = null;


                    request.setAttribute(
                            "message",
                            "Manager deleted successfully."
                    );
                }
            }


            /*
             * =========================================
             * VIEW MANAGER
             * =========================================
             */

            else if ("view".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.trim().isEmpty()) {

                int managerId =
                        Integer.parseInt(
                                managerIdParam
                        );


                String viewSql =
                        "SELECT MANAGER_ID, NAME, EMAIL, " +
                        "CONTACT, ADDRESS, STATUS, " +
                        "DATE_ADDED, LAST_LOGIN, EVENTS_MANAGED " +
                        "FROM EVENT_MANAGERS " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(
                        viewSql
                );

                ps.setInt(
                        1,
                        managerId
                );

                rs = ps.executeQuery();


                if (rs.next()) {

                    Map<String, Object> manager =
                            new HashMap<>();


                    manager.put(
                            "managerId",
                            rs.getInt(
                                    "MANAGER_ID"
                            )
                    );


                    manager.put(
                            "name",
                            rs.getString(
                                    "NAME"
                            )
                    );


                    manager.put(
                            "email",
                            rs.getString(
                                    "EMAIL"
                            )
                    );


                    manager.put(
                            "contact",
                            rs.getString(
                                    "CONTACT"
                            )
                    );


                    manager.put(
                            "address",
                            rs.getString(
                                    "ADDRESS"
                            )
                    );


                    manager.put(
                            "status",
                            rs.getString(
                                    "STATUS"
                            )
                    );


                    manager.put(
                            "dateAdded",
                            rs.getDate(
                                    "DATE_ADDED"
                            )
                    );


                    manager.put(
                            "lastLogin",
                            rs.getDate(
                                    "LAST_LOGIN"
                            )
                    );


                    manager.put(
                            "eventsManaged",
                            rs.getInt(
                                    "EVENTS_MANAGED"
                            )
                    );


                    request.setAttribute(
                            "selectedManager",
                            manager
                    );
                }


                rs.close();
                rs = null;

                ps.close();
                ps = null;


                /*
                 * Send to view page.
                 *
                 * Change this path if your actual
                 * view page has another name.
                 */

                request.getRequestDispatcher(
                        "/admin/view_manager/viewManager.jsp"
                ).forward(
                        request,
                        response
                );

                return;
            }


            /*
             * =========================================
             * EDIT MANAGER
             * =========================================
             *
             * Edit page receives managerId.
             */

            else if ("edit".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.trim().isEmpty()) {

                int managerId =
                        Integer.parseInt(
                                managerIdParam
                        );


                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/edit_manager/editManager.jsp"
                        + "?managerId="
                        + managerId
                );

                return;
            }


            /*
             * =========================================
             * LOAD ALL MANAGERS
             * =========================================
             */

            String sql =
                    "SELECT m.MANAGER_ID, " +
                    "m.NAME, " +
                    "m.EMAIL, " +
                    "m.CONTACT, " +
                    "m.ADDRESS, " +
                    "m.STATUS, " +
                    "(SELECT COUNT(*) " +
                    " FROM EVENTS e " +
                    " WHERE e.MANAGER_ID = m.MANAGER_ID) " +
                    "AS EVENT_COUNT " +
                    "FROM EVENT_MANAGERS m " +
                    "ORDER BY m.MANAGER_ID";


            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();


            List<Map<String, Object>> managerList =
                    new ArrayList<>();


            while (rs.next()) {

                Map<String, Object> manager =
                        new HashMap<>();


                manager.put(
                        "managerId",
                        rs.getInt(
                                "MANAGER_ID"
                        )
                );


                manager.put(
                        "name",
                        rs.getString(
                                "NAME"
                        )
                );


                manager.put(
                        "email",
                        rs.getString(
                                "EMAIL"
                        )
                );


                manager.put(
                        "contact",
                        rs.getString(
                                "CONTACT"
                        )
                );


                manager.put(
                        "address",
                        rs.getString(
                                "ADDRESS"
                        )
                );


                manager.put(
                        "status",
                        rs.getString(
                                "STATUS"
                        )
                );


                /*
                 * Actual number of events assigned
                 * to this manager.
                 */

                manager.put(
                        "eventCount",
                        rs.getInt(
                                "EVENT_COUNT"
                        )
                );


                managerList.add(
                        manager
                );
            }


            request.setAttribute(
                    "managerList",
                    managerList
            );


            /*
             * Preserve success/error message after
             * disable/enable/delete.
             */

            request.getRequestDispatcher(
                    "/admin/manage_event_managers/manageEventManagers.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Manager ID."
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing event managers.",
                    e
            );


        } catch (Exception e) {

            throw new ServletException(
                    e
            );


        } finally {

            try {

                if (rs != null) {
                    rs.close();
                }

            } catch (SQLException ignored) {
            }


            try {

                if (ps != null) {
                    ps.close();
                }

            } catch (SQLException ignored) {
            }


            try {

                if (con != null) {
                    con.close();
                }

            } catch (SQLException ignored) {
            }
        }
    }
}

