
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
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

                HttpSession session = request.getSession(false);

if (session == null ||
        session.getAttribute("adminId") == null) {

    response.sendRedirect(
            request.getContextPath()
            + "/admin/admin_login/adminLogin.html"
    );

    return;
}

int adminId = Integer.parseInt(
        session.getAttribute("adminId").toString()
);
   
        String action = request.getParameter("action");
        String accessoryIdParam =
                request.getParameter("accessoryId");

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
            String profileSql =
        "SELECT PROFILE_IMAGE " +
        "FROM ADMIN " +
        "WHERE ADMIN_ID = ?";

try (PreparedStatement profilePs =
        con.prepareStatement(profileSql)) {

    profilePs.setInt(1, adminId);

    try (ResultSet profileRs =
            profilePs.executeQuery()) {

        String imageSource =
                request.getContextPath()
                + "/images/default-profile.png";

        if (profileRs.next()) {
            String profileImage =
                    profileRs.getString("PROFILE_IMAGE");

            if (profileImage != null &&
                    !profileImage.trim().isEmpty()) {

                imageSource =
                        request.getContextPath()
                        + "/"
                        + profileImage;
            }
        }

        request.setAttribute(
                "imageSource",
                imageSource
        );
    }
}

            /*
             * ==========================================
             * DELETE ACCESSORY
             * ==========================================
             */

            if ("delete".equalsIgnoreCase(action)
                    && accessoryIdParam != null
                    && !accessoryIdParam.isEmpty()) {

                int accessoryId =
                        Integer.parseInt(accessoryIdParam);

                String deleteSql =
                        "DELETE FROM ACCESSORIES " +
                        "WHERE ACCESSORY_ID = ?";

                ps = con.prepareStatement(deleteSql);

                ps.setInt(
                        1,
                        accessoryId
                );

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * UPDATE QUANTITY
             * ==========================================
             *
             * The user enters the new quantity in a
             * small browser dialog.
             */

            else if ("updateQuantity".equalsIgnoreCase(action)
                    && accessoryIdParam != null
                    && !accessoryIdParam.isEmpty()) {

                int accessoryId =
                        Integer.parseInt(accessoryIdParam);

                String quantityParam =
                        request.getParameter("quantity");

                /*
                 * If quantity is not supplied, show a
                 * simple quantity form.
                 */

                if (quantityParam == null
                        || quantityParam.trim().isEmpty()) {

                    showQuantityForm(
                            request,
                            response,
                            accessoryId
                    );

                    return;
                }


                int quantity =
                        Integer.parseInt(
                                quantityParam
                        );


                if (quantity < 0) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Quantity cannot be negative."
                    );

                    return;
                }


                String updateSql =
                        "UPDATE ACCESSORIES " +
                        "SET QUANTITY = ? " +
                        "WHERE ACCESSORY_ID = ?";

                ps = con.prepareStatement(
                        updateSql
                );

                ps.setInt(
                        1,
                        quantity
                );

                ps.setInt(
                        2,
                        accessoryId
                );

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * LOAD ACCESSORIES
             * ==========================================
             */

            String sql =
                    "SELECT ACCESSORY_ID, " +
                    "ACCESSORY_NAME, " +
                    "CATEGORY, " +
                    "PRICE, " +
                    "QUANTITY, " +
                    "STATUS, " +
                    "IMAGE_URL " +
                    "FROM ACCESSORIES " +
                    "ORDER BY ACCESSORY_ID";


            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();


            List<Map<String, Object>> accessoryList =
                    new ArrayList<>();


            while (rs.next()) {

                Map<String, Object> accessory =
                        new HashMap<>();


                accessory.put(
                        "accessoryId",
                        rs.getInt(
                                "ACCESSORY_ID"
                        )
                );


                accessory.put(
                        "accessoryName",
                        rs.getString(
                                "ACCESSORY_NAME"
                        )
                );


                accessory.put(
                        "category",
                        rs.getString(
                                "CATEGORY"
                        )
                );


                accessory.put(
                        "price",
                        rs.getBigDecimal(
                                "PRICE"
                        )
                );


                accessory.put(
                        "quantity",
                        rs.getInt(
                                "QUANTITY"
                        )
                );


                accessory.put(
                        "status",
                        rs.getString(
                                "STATUS"
                        )
                );


                accessory.put(
                        "imageUrl",
                        rs.getString(
                                "IMAGE_URL"
                        )
                );


                accessoryList.add(
                        accessory
                );
            }


            request.setAttribute(
                    "accessoryList",
                    accessoryList
            );


            /*
             * ==========================================
             * FORWARD TO JSP
             * ==========================================
             */

            request.getRequestDispatcher(
                    "/admin/manage_accessories/accessories.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid numeric value."
            );

        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing accessories.",
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


    /*
     * ==========================================
     * QUANTITY FORM
     * ==========================================
     *
     * This appears when the Update Quantity
     * button is clicked.
     */

    private void showQuantityForm(
            HttpServletRequest request,
            HttpServletResponse response,
            int accessoryId)
            throws IOException {

        response.setContentType(
                "text/html;charset=UTF-8"
        );

        PrintWriter out =
                response.getWriter();


        String contextPath =
                request.getContextPath();


        out.println(
                "<!DOCTYPE html>"
        );

        out.println(
                "<html>"
        );

        out.println(
                "<head>"
        );

        out.println(
                "<title>Update Quantity</title>"
        );

        out.println(
                "<style>" +
                "body{" +
                "font-family:Arial,sans-serif;" +
                "background:#f7f9fb;" +
                "display:flex;" +
                "justify-content:center;" +
                "align-items:center;" +
                "height:100vh;" +
                "margin:0;" +
                "}" +

                ".box{" +
                "background:white;" +
                "padding:30px;" +
                "border:1px solid #c6c6cd;" +
                "border-radius:10px;" +
                "width:320px;" +
                "}" +

                "input{" +
                "width:100%;" +
                "padding:10px;" +
                "box-sizing:border-box;" +
                "margin:10px 0;" +
                "border:1px solid #c6c6cd;" +
                "border-radius:6px;" +
                "}" +

                "button{" +
                "width:100%;" +
                "padding:10px;" +
                "background:#000;" +
                "color:white;" +
                "border:0;" +
                "border-radius:6px;" +
                "cursor:pointer;" +
                "}" +

                ".cancel{" +
                "display:block;" +
                "text-align:center;" +
                "margin-top:12px;" +
                "color:#555;" +
                "text-decoration:none;" +
                "}" +

                "</style>"
        );

        out.println(
                "</head>"
        );


        out.println(
                "<body>"
        );


        out.println(
                "<div class='box'>"
        );


        out.println(
                "<h2>Update Quantity</h2>"
        );


        out.println(
                "<form method='get' action='" +
                contextPath +
                "/AccessoriesServlet'>"
        );


        out.println(
                "<input type='hidden' " +
                "name='action' " +
                "value='updateQuantity'>"
        );


        out.println(
                "<input type='hidden' " +
                "name='accessoryId' " +
                "value='" +
                accessoryId +
                "'>"
        );


        out.println(
                "<label>New Quantity</label>"
        );


        out.println(
                "<input " +
                "type='number' " +
                "name='quantity' " +
                "min='0' " +
                "required>"
        );


        out.println(
                "<button type='submit'>" +
                "Update Quantity" +
                "</button>"
        );


        out.println(
                "</form>"
        );


        out.println(
                "<a class='cancel' " +
                "href='" +
                contextPath +
                "/AccessoriesServlet'>" +
                "Cancel" +
                "</a>"
        );


        out.println(
                "</div>"
        );


        out.println(
                "</body>"
        );


        out.println(
                "</html>"
        );
    }
}

