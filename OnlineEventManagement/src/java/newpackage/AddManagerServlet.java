package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

public class AddManagerServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String status = request.getParameter("status");

        if (name == null || name.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || password == null || password.length() < 12) {

            request.setAttribute(
                    "error",
                    "Name, email and a password of at least 12 characters are required."
            );

            request.getRequestDispatcher(
                    "/admin/add_manager/addManager.jsp"
            ).forward(request, response);

            return;
        }

        Connection con = null;
        PreparedStatement idPs = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            // Generate the next manager ID
            String idSql =
                    "SELECT NVL(MAX(MANAGER_ID), 0) + 1 "
                    + "FROM EVENT_MANAGERS";

            idPs = con.prepareStatement(idSql);
            rs = idPs.executeQuery();

            int managerId = 1;

            if (rs.next()) {
                managerId = rs.getInt(1);
            }

            rs.close();
            idPs.close();

            // Insert new manager
            String sql =
                    "INSERT INTO EVENT_MANAGERS "
                    + "(MANAGER_ID, NAME, EMAIL, PASSWORD, CONTACT, "
                    + "ADDRESS, STATUS, DATE_ADDED, EVENTS_MANAGED) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE, 0)";

            ps = con.prepareStatement(sql);

            ps.setInt(1, managerId);
            ps.setString(2, name.trim());
            ps.setString(3, email.trim());
            ps.setString(4, password);
            ps.setString(5, contact != null ? contact.trim() : null);
            ps.setString(6, address != null ? address.trim() : null);
            ps.setString(7, status != null ? status : "ACTIVE");

            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/ManageEventManagersServlet"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Manager could not be created."
                );

                request.getRequestDispatcher(
                        "/admin/add_manager/addManager.jsp"
                ).forward(request, response);
            }

        } catch (SQLException e) {

            request.setAttribute(
                    "error",
                    "Database error: " + e.getMessage()
            );

            request.getRequestDispatcher(
                    "/admin/add_manager/addManager.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) rs.close();
            } catch (SQLException ignored) {
            }

            try {
                if (idPs != null) idPs.close();
            } catch (SQLException ignored) {
            }

            try {
                if (ps != null) ps.close();
            } catch (SQLException ignored) {
            }

            try {
                if (con != null) con.close();
            } catch (SQLException ignored) {
            }
        }
    }
}