
package newpackage;

import java.io.*;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");

        PrintWriter pw = res.getWriter();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {

            // Load Oracle Driver
            Class.forName(
                "oracle.jdbc.driver.OracleDriver"
            );

            // Connect to Oracle
            Connection con =
                DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE",
                    "system",
                    "manager"
                );

            // Get admin details
            String sql =
                "SELECT ADMIN_ID, NAME, EMAIL " +
                "FROM ADMIN " +
                "WHERE EMAIL = ? AND PASSWORD = ?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs =
                ps.executeQuery();

            if (rs.next()) {

                // Get actual admin details
                int adminId =
                    rs.getInt("ADMIN_ID");

                String adminName =
                    rs.getString("NAME");

                String adminEmail =
                    rs.getString("EMAIL");


                // Create login session
                HttpSession session =
                    req.getSession();

                // Store actual admin information
                session.setAttribute(
                    "adminId",
                    adminId
                );

                session.setAttribute(
                    "adminName",
                    adminName
                );

                session.setAttribute(
                    "adminEmail",
                    adminEmail
                );


                // Redirect to dashboard
                res.sendRedirect(
                    req.getContextPath()
                    + "/admin/admin_dashboard/adminDashboard.jsp"
                );

            } else {

                pw.println(
                    "<h2>INVALID EMAIL OR PASSWORD</h2>"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            pw.println(
                "<h2>Error occurred</h2>"
            );

            pw.println(
                "<p>" +
                e.getMessage() +
                "</p>"
            );
        }
    }
}

