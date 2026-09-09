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

public class EditManagerServlet extends HttpServlet {

    private final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private final String USER = "system";
    private final String PASSWORD = "manager";


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String managerIdParam = request.getParameter("managerId");


        // -----------------------------------------------------
        // managerId is required for all manager operations
        // -----------------------------------------------------

        if (managerIdParam == null ||
                managerIdParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Manager ID is required."
            );

            return;
        }


        int managerId;

        try {

            managerId = Integer.parseInt(
                    managerIdParam.trim()
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Manager ID."
            );

            return;
        }


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


            // =================================================
            // DISABLE
            // =================================================

            if ("disable".equalsIgnoreCase(action)) {

                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET STATUS = ? " +
                        "WHERE MANAGER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "INACTIVE");
                ps.setInt(2, managerId);

                ps.executeUpdate();

                ps.close();
                ps = null;

                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventManagersServlet"
                );

                return;
            }


            // =================================================
            // ENABLE
            // =================================================

            if ("enable".equalsIgnoreCase(action)) {

                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET STATUS = ? " +
                        "WHERE MANAGER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "ACTIVE");
                ps.setInt(2, managerId);

                ps.executeUpdate();

                ps.close();
                ps = null;

                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventManagersServlet"
                );

                return;
            }


            // =================================================
            // DELETE
            // =================================================

            if ("delete".equalsIgnoreCase(action)) {

                // First check whether this manager has events
                String checkSql =
                        "SELECT COUNT(*) AS EVENT_COUNT " +
                        "FROM EVENTS " +
                        "WHERE MANAGER_ID = ?";

                ps = con.prepareStatement(checkSql);

                ps.setInt(1, managerId);

                rs = ps.executeQuery();

                int eventCount = 0;

                if (rs.next()) {
                    eventCount =
                            rs.getInt("EVENT_COUNT");
                }

                rs.close();
                rs = null;

                ps.close();
                ps = null;


                // Manager cannot be deleted while events
                // still reference the manager.
                if (eventCount > 0) {

                    response.sendError(
                            HttpServletResponse.SC_CONFLICT,
                            "This manager cannot be deleted because "
                            + eventCount
                            + " event(s) are assigned to this manager."
                    );

                    return;
                }


                String deleteSql =
                        "DELETE FROM EVENT_MANAGERS " +
                        "WHERE MANAGER_ID = ?";

                ps = con.prepareStatement(
                        deleteSql
                );

                ps.setInt(1, managerId);

                int deleted =
                        ps.executeUpdate();

                ps.close();
                ps = null;


                if (deleted == 0) {

                    response.sendError(
                            HttpServletResponse.SC_NOT_FOUND,
                            "Manager not found."
                    );

                    return;
                }


                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventManagersServlet"
                );

                return;
            }


            // =================================================
            // LOAD MANAGER FOR EDIT PAGE
            // =================================================

            String sql =
                    "SELECT MANAGER_ID, " +
                    "NAME, " +
                    "EMAIL, " +
                    "PASSWORD, " +
                    "CONTACT, " +
                    "ADDRESS, " +
                    "STATUS, " +
                    "DATE_ADDED, " +
                    "LAST_LOGIN, " +
                    "EVENTS_MANAGED " +
                    "FROM EVENT_MANAGERS " +
                    "WHERE MANAGER_ID = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, managerId);

            rs = ps.executeQuery();


            if (!rs.next()) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Manager not found."
                );

                return;
            }


            // -------------------------------------------------
            // Send database values to JSP
            // -------------------------------------------------

            request.setAttribute(
                    "managerId",
                    rs.getInt("MANAGER_ID")
            );

            request.setAttribute(
                    "name",
                    rs.getString("NAME")
            );

            request.setAttribute(
                    "email",
                    rs.getString("EMAIL")
            );

            request.setAttribute(
                    "password",
                    rs.getString("PASSWORD")
            );

            request.setAttribute(
                    "contact",
                    rs.getString("CONTACT")
            );

            request.setAttribute(
                    "address",
                    rs.getString("ADDRESS")
            );

            request.setAttribute(
                    "status",
                    rs.getString("STATUS")
            );

            request.setAttribute(
                    "dateAdded",
                    rs.getDate("DATE_ADDED")
            );

            request.setAttribute(
                    "lastLogin",
                    rs.getTimestamp("LAST_LOGIN")
            );

            request.setAttribute(
                    "eventsManaged",
                    rs.getInt("EVENTS_MANAGED")
            );


            // -------------------------------------------------
            // Open Edit Manager JSP
            // -------------------------------------------------

            request.getRequestDispatcher(
                    "/admin/edit_manager/editManager.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing event manager.",
                    e
            );

        } catch (Exception e) {

            throw new ServletException(e);

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


    // =========================================================
    // POST
    // SAVE CHANGES
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        String managerIdParam =
                request.getParameter("managerId");

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String contact =
                request.getParameter("contact");

        String address =
                request.getParameter("address");

        String status =
                request.getParameter("status");


        // -----------------------------------------------------
        // Validate Manager ID
        // -----------------------------------------------------

        if (managerIdParam == null ||
                managerIdParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Manager ID is required."
            );

            return;
        }


        int managerId;

        try {

            managerId = Integer.parseInt(
                    managerIdParam.trim()
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Manager ID."
            );

            return;
        }


        // -----------------------------------------------------
        // Validate required fields
        // -----------------------------------------------------

        if (name == null || name.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Name is required."
            );

            return;
        }


        if (email == null || email.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Email is required."
            );

            return;
        }


        name = name.trim();
        email = email.trim();


        if (contact != null) {
            contact = contact.trim();
        }

        if (address != null) {
            address = address.trim();
        }


        // -----------------------------------------------------
        // Checkbox handling
        // Checked = ACTIVE
        // Unchecked = INACTIVE
        // -----------------------------------------------------

        if ("ACTIVE".equalsIgnoreCase(status)) {
            status = "ACTIVE";
        } else {
            status = "INACTIVE";
        }


        Connection con = null;
        PreparedStatement ps = null;


        try {

            Class.forName(
                    "oracle.jdbc.driver.OracleDriver"
            );


            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );


            // =================================================
            // UPDATE
            // =================================================

            if (password != null &&
                    !password.trim().isEmpty()) {

                password = password.trim();


                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET NAME = ?, " +
                        "EMAIL = ?, " +
                        "PASSWORD = ?, " +
                        "CONTACT = ?, " +
                        "ADDRESS = ?, " +
                        "STATUS = ? " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(sql);


                ps.setString(
                        1,
                        name
                );

                ps.setString(
                        2,
                        email
                );

                ps.setString(
                        3,
                        password
                );

                ps.setString(
                        4,
                        contact
                );

                ps.setString(
                        5,
                        address
                );

                ps.setString(
                        6,
                        status
                );

                ps.setInt(
                        7,
                        managerId
                );


            } else {

                /*
                 * Password field is empty,
                 * therefore preserve existing password.
                 */

                String sql =
                        "UPDATE EVENT_MANAGERS " +
                        "SET NAME = ?, " +
                        "EMAIL = ?, " +
                        "CONTACT = ?, " +
                        "ADDRESS = ?, " +
                        "STATUS = ? " +
                        "WHERE MANAGER_ID = ?";


                ps = con.prepareStatement(sql);


                ps.setString(
                        1,
                        name
                );

                ps.setString(
                        2,
                        email
                );

                ps.setString(
                        3,
                        contact
                );

                ps.setString(
                        4,
                        address
                );

                ps.setString(
                        5,
                        status
                );

                ps.setInt(
                        6,
                        managerId
                );
            }


            int updated =
                    ps.executeUpdate();


            ps.close();
            ps = null;


            if (updated == 0) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Manager not found."
                );

                return;
            }


            // -------------------------------------------------
            // After successful save return to manager list
            // -------------------------------------------------

            response.sendRedirect(
                    request.getContextPath()
                    + "/ManageEventManagersServlet"
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while updating manager.",
                    e
            );

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

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