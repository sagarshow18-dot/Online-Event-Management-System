package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AdminProfileServlet")
public class AdminProfileServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "SELECT ADMIN_ID, NAME, EMAIL, CONTACT, BIO, ADDRESS "
                       + "FROM ADMIN WHERE ADMIN_ID = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, 1);

            rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute("adminId", rs.getInt("ADMIN_ID"));
                request.setAttribute("name", rs.getString("NAME"));
                request.setAttribute("email", rs.getString("EMAIL"));
                request.setAttribute("contact", rs.getString("CONTACT"));
                request.setAttribute("bio", rs.getString("BIO"));
                request.setAttribute("address", rs.getString("ADDRESS"));
            }

            request.getRequestDispatcher(
                    "/admin/admin_profile/adminProfile.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

    if ("changePassword".equals(action)) {

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(URL, USER, PASSWORD);

            // 1. Get the current password
            String checkSql =
                    "SELECT PASSWORD FROM ADMIN WHERE ADMIN_ID = ?";

            ps = con.prepareStatement(checkSql);
            ps.setInt(1, 1);

            rs = ps.executeQuery();

            if (!rs.next()) {
                response.getWriter().println("Admin not found.");
                return;
            }

            String dbPassword = rs.getString("PASSWORD");

            rs.close();
            ps.close();

            // 2. Check current password
            if (!dbPassword.equals(currentPassword)) {
                response.getWriter().println(
                        "Current password is incorrect."
                );
                return;
            }

            // 3. Check new password confirmation
            if (!newPassword.equals(confirmPassword)) {
                response.getWriter().println(
                        "New password and confirm password do not match."
                );
                return;
            }

            // 4. Check password length
            if (newPassword.length() < 12) {
                response.getWriter().println(
                        "Password must be at least 12 characters long."
                );
                return;
            }

            // 5. Update password
            String updateSql =
                    "UPDATE ADMIN SET PASSWORD = ? WHERE ADMIN_ID = ?";

            ps = con.prepareStatement(updateSql);

            ps.setString(1, newPassword);
            ps.setInt(2, 1);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect(
                        request.getContextPath()
                        + "/AdminProfileServlet"
                );
            } else {
                response.getWriter().println(
                        "Password update failed."
                );
            }

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return;
    }

    // Existing Edit Profile code
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String bio = request.getParameter("bio");
    String address = request.getParameter("address");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        con = DriverManager.getConnection(URL, USER, PASSWORD);

        String sql = "UPDATE ADMIN SET "
                   + "NAME = ?, "
                   + "EMAIL = ?, "
                   + "CONTACT = ?, "
                   + "BIO = ?, "
                   + "ADDRESS = ? "
                   + "WHERE ADMIN_ID = ?";

        ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, contact);
        ps.setString(4, bio);
        ps.setString(5, address);
        ps.setInt(6, 1);

        int result = ps.executeUpdate();

        if (result > 0) {
            response.sendRedirect(
                    request.getContextPath()
                    + "/AdminProfileServlet"
            );
        }

    } catch (Exception e) {

        throw new ServletException(e);

    } finally {

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
}