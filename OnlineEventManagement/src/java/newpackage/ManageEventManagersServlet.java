package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ManageEventManagersServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String managerIdParam = request.getParameter("managerId");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            // Disable manager
            if ("disable".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.isEmpty()) {

                int managerId = Integer.parseInt(managerIdParam);

                String sql =
                        "UPDATE EVENT_MANAGERS "
                        + "SET STATUS = ? "
                        + "WHERE MANAGER_ID = ?";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, "INACTIVE");
                ps.setInt(2, managerId);

                ps.executeUpdate();

                ps.close();
            }

            // Delete manager
            else if ("delete".equalsIgnoreCase(action)
                    && managerIdParam != null
                    && !managerIdParam.isEmpty()) {

                int managerId = Integer.parseInt(managerIdParam);

                String sql =
                        "DELETE FROM EVENT_MANAGERS "
                        + "WHERE MANAGER_ID = ?";

                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, managerId);

                ps.executeUpdate();

                ps.close();
            }

            // Load all managers
            String sql =
                    "SELECT MANAGER_ID, NAME, EMAIL, CONTACT, ADDRESS, STATUS "
                    + "FROM EVENT_MANAGERS "
                    + "ORDER BY MANAGER_ID";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            List<Map<String, Object>> managerList =
                    new ArrayList<>();

            while (rs.next()) {

                Map<String, Object> manager =
                        new HashMap<>();

                manager.put(
                        "managerId",
                        rs.getInt("MANAGER_ID")
                );

                manager.put(
                        "name",
                        rs.getString("NAME")
                );

                manager.put(
                        "email",
                        rs.getString("EMAIL")
                );

                manager.put(
                        "contact",
                        rs.getString("CONTACT")
                );

                manager.put(
                        "address",
                        rs.getString("ADDRESS")
                );

                manager.put(
                        "status",
                        rs.getString("STATUS")
                );

                managerList.add(manager);
            }

            rs.close();
            ps.close();
            con.close();

            request.setAttribute(
                    "managerList",
                    managerList
            );

            request.getRequestDispatcher(
                    "/admin/manage_event_managers/manageEventManagers.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);
        }
    }
}