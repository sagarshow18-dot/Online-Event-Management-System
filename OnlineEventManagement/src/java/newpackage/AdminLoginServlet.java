package newpackage;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,
                           HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");

        PrintWriter pw = res.getWriter();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {

            // Load Oracle Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connect to Oracle
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE",
                "system",
                "manager"
            );

            // SQL query
            String sql = "SELECT * FROM ADMIN WHERE EMAIL = ? AND PASSWORD = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                res.sendRedirect(req.getContextPath() + "/admin/admin_dashboard/adminDashboard.jsp");
             } else {
                pw.println("INVALID EMAIL OR PASSWORD");
             }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            pw.println("<h2>Error occurred</h2>");
            pw.println("<p>" + e.getMessage() + "</p>");

        }
    }
}