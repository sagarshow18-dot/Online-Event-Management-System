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

public class ManageUsersServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String userIdParam = request.getParameter("userId");

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

            // Block user
            if ("block".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId = Integer.parseInt(userIdParam);

                String sql =
                        "UPDATE EVENT_USERS "
                        + "SET STATUS = ? "
                        + "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "BLOCKED");
                ps.setInt(2, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            // Unblock user
            else if ("unblock".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId = Integer.parseInt(userIdParam);

                String sql =
                        "UPDATE EVENT_USERS "
                        + "SET STATUS = ? "
                        + "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "ACTIVE");
                ps.setInt(2, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            // Delete user
            else if ("delete".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId = Integer.parseInt(userIdParam);

                String sql =
                        "DELETE FROM EVENT_USERS "
                        + "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setInt(1, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            // Load all users
            String sql =
                    "SELECT USER_ID, NAME, EMAIL, CONTACT, ADDRESS, STATUS "
                    + "FROM EVENT_USERS "
                    + "ORDER BY USER_ID";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            List<Map<String, Object>> userList =
                    new ArrayList<>();

            while (rs.next()) {

                Map<String, Object> user =
                        new HashMap<>();

                user.put(
                        "userId",
                        rs.getInt("USER_ID")
                );

                user.put(
                        "name",
                        rs.getString("NAME")
                );

                user.put(
                        "email",
                        rs.getString("EMAIL")
                );

                user.put(
                        "contact",
                        rs.getString("CONTACT")
                );

                user.put(
                        "address",
                        rs.getString("ADDRESS")
                );

                user.put(
                        "status",
                        rs.getString("STATUS")
                );

                userList.add(user);
            }

            request.setAttribute(
                    "userList",
                    userList
            );

            request.getRequestDispatcher(
                    "/admin/manage_users/manage-users.jsp"
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