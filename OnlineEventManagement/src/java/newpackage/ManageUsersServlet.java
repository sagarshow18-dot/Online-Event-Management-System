
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
        String userIdParam = request.getParameter("userId");

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
             * BLOCK USER
             * ==========================================
             */

            if ("block".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                String sql =
                        "UPDATE EVENT_USERS " +
                        "SET STATUS = ? " +
                        "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "BLOCKED");
                ps.setInt(2, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * UNBLOCK USER
             * ==========================================
             */

            else if ("unblock".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                String sql =
                        "UPDATE EVENT_USERS " +
                        "SET STATUS = ? " +
                        "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, "ACTIVE");
                ps.setInt(2, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * DELETE USER
             * ==========================================
             */

            else if ("delete".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                String sql =
                        "DELETE FROM EVENT_USERS " +
                        "WHERE USER_ID = ?";

                ps = con.prepareStatement(sql);

                ps.setInt(1, userId);

                ps.executeUpdate();

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * VIEW USER
             * ==========================================
             *
             * For now, we load the selected user's data
             * and show it in the Manage Users page.
             *
             * Later, you can create a dedicated
             * viewUser.jsp.
             */

            else if ("view".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                String viewSql =
                        "SELECT USER_ID, NAME, EMAIL, " +
                        "CONTACT, ADDRESS, STATUS " +
                        "FROM EVENT_USERS " +
                        "WHERE USER_ID = ?";

                ps = con.prepareStatement(viewSql);

                ps.setInt(1, userId);

                rs = ps.executeQuery();

                if (rs.next()) {

                    Map<String, Object> selectedUser =
                            new HashMap<>();

                    selectedUser.put(
                            "userId",
                            rs.getInt("USER_ID")
                    );

                    selectedUser.put(
                            "name",
                            rs.getString("NAME")
                    );

                    selectedUser.put(
                            "email",
                            rs.getString("EMAIL")
                    );

                    selectedUser.put(
                            "contact",
                            rs.getString("CONTACT")
                    );

                    selectedUser.put(
                            "address",
                            rs.getString("ADDRESS")
                    );

                    selectedUser.put(
                            "status",
                            rs.getString("STATUS")
                    );

                    request.setAttribute(
                            "selectedUser",
                            selectedUser
                    );
                }

                rs.close();
                rs = null;

                ps.close();
                ps = null;
            }


            /*
             * ==========================================
             * EDIT USER
             * ==========================================
             *
             * This redirects to your future edit JSP.
             */

            else if ("edit".equalsIgnoreCase(action)
                    && userIdParam != null
                    && !userIdParam.isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/edit_user/editUser.jsp?userId="
                        + userId
                );

                return;
            }


            /*
             * ==========================================
             * LOAD ALL USERS
             * ==========================================
             */

            String sql =
                    "SELECT USER_ID, NAME, EMAIL, " +
                    "CONTACT, ADDRESS, STATUS " +
                    "FROM EVENT_USERS " +
                    "ORDER BY USER_ID";

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


            /*
             * ==========================================
             * SEND USER LIST TO JSP
             * ==========================================
             */

            request.setAttribute(
                    "userList",
                    userList
            );


            /*
             * ==========================================
             * FORWARD TO MANAGE USERS PAGE
             * ==========================================
             */

            request.getRequestDispatcher(
                    "/admin/manage_users/manage-users.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid User ID."
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while managing users.",
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
}

