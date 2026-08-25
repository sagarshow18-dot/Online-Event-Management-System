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

public class AccessoriesServlet extends HttpServlet {

    private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String USER = "system";
    private final String PASSWORD = "manager";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String accessoryIdParam = request.getParameter("accessoryId");

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

            // Delete accessory
            if ("delete".equalsIgnoreCase(action)
                    && accessoryIdParam != null
                    && !accessoryIdParam.isEmpty()) {

                int accessoryId = Integer.parseInt(accessoryIdParam);

                String deleteSql =
                        "DELETE FROM ACCESSORIES "
                        + "WHERE ACCESSORY_ID = ?";

                ps = con.prepareStatement(deleteSql);
                ps.setInt(1, accessoryId);
                ps.executeUpdate();

                ps.close();
                ps = null;
            }

            // Load all accessories
            String sql =
                    "SELECT ACCESSORY_ID, ACCESSORY_NAME, CATEGORY, "
                    + "PRICE, QUANTITY, STATUS, IMAGE_URL "
                    + "FROM ACCESSORIES "
                    + "ORDER BY ACCESSORY_ID";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            List<Map<String, Object>> accessoryList =
                    new ArrayList<>();

            while (rs.next()) {

                Map<String, Object> accessory =
                        new HashMap<>();

                accessory.put(
                        "accessoryId",
                        rs.getInt("ACCESSORY_ID")
                );

                accessory.put(
                        "accessoryName",
                        rs.getString("ACCESSORY_NAME")
                );

                accessory.put(
                        "category",
                        rs.getString("CATEGORY")
                );

                accessory.put(
                        "price",
                        rs.getBigDecimal("PRICE")
                );

                accessory.put(
                        "quantity",
                        rs.getInt("QUANTITY")
                );

                accessory.put(
                        "status",
                        rs.getString("STATUS")
                );

                accessory.put(
                        "imageUrl",
                        rs.getString("IMAGE_URL")
                );

                accessoryList.add(accessory);
            }

            request.setAttribute(
                    "accessoryList",
                    accessoryList
            );

            request.getRequestDispatcher(
                    "/admin/manage_accessories/accessories.jsp"
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