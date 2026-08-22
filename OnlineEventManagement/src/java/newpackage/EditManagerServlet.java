package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;


public class EditManagerServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String managerIdParam = request.getParameter("managerId");

        // For testing, use manager ID 1 when no ID is supplied
        int managerId = 1;

        if (managerIdParam != null && !managerIdParam.isEmpty()) {
            managerId = Integer.parseInt(managerIdParam);
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DriverManager.getConnection(
                    URL, USER, PASSWORD
            );

            String sql = "SELECT MANAGER_ID, NAME, EMAIL, CONTACT, "
                       + "ADDRESS, STATUS "
                       + "FROM EVENT_MANAGERS "
                       + "WHERE MANAGER_ID = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, managerId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute("managerId",
                        rs.getInt("MANAGER_ID"));

                request.setAttribute("name",
                        rs.getString("NAME"));

                request.setAttribute("email",
                        rs.getString("EMAIL"));

                request.setAttribute("contact",
                        rs.getString("CONTACT"));

                request.setAttribute("address",
                        rs.getString("ADDRESS"));

                request.setAttribute("status",
                        rs.getString("STATUS"));
            }

            rs.close();
            ps.close();
            con.close();

            request.getRequestDispatcher(
                    "/admin/edit_manager/editManager.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int managerId = Integer.parseInt(
                request.getParameter("managerId")
        );

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        String status = request.getParameter("status");

        if (status == null) {
            status = "INACTIVE";
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DriverManager.getConnection(
                    URL, USER, PASSWORD
            );

            String sql = "UPDATE EVENT_MANAGERS SET "
                       + "NAME = ?, "
                       + "EMAIL = ?, "
                       + "CONTACT = ?, "
                       + "ADDRESS = ?, "
                       + "STATUS = ? "
                       + "WHERE MANAGER_ID = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, contact);
            ps.setString(4, address);
            ps.setString(5, status);
            ps.setInt(6, managerId);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/EditManagerServlet?managerId="
                        + managerId
                );

            } else {

                response.getWriter().println(
                        "Manager update failed."
                );
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}