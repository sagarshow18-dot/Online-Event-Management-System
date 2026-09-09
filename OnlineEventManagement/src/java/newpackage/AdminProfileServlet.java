
package newpackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 10 * 1024 * 1024
)
public class AdminProfileServlet extends HttpServlet {

    private final String URL =
            "jdbc:oracle:thin:@localhost:1521:XE";

    private final String USER =
            "system";

    private final String PASSWORD =
            "manager";


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // -----------------------------------------------------
        // Check login
        // -----------------------------------------------------

        if (session == null ||
                session.getAttribute("adminId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin_login/adminLogin.jsp"
            );

            return;
        }


        int adminId;

        try {

            adminId = Integer.parseInt(
                    session.getAttribute("adminId").toString()
            );

        } catch (NumberFormatException e) {

            session.invalidate();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin_login/adminLogin.jsp"
            );

            return;
        }


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


            String sql =
                    "SELECT ADMIN_ID, "
                    + "NAME, "
                    + "EMAIL, "
                    + "CONTACT, "
                    + "BIO, "
                    + "ADDRESS, "
                    + "PROFILE_IMAGE "
                    + "FROM ADMIN "
                    + "WHERE ADMIN_ID = ?";


            ps = con.prepareStatement(sql);

            ps.setInt(
                    1,
                    adminId
            );


            rs = ps.executeQuery();


            if (!rs.next()) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Admin account not found."
                );

                return;
            }


            // -------------------------------------------------
            // Send database values to JSP
            // -------------------------------------------------

            request.setAttribute(
                    "adminId",
                    rs.getInt("ADMIN_ID")
            );

            request.setAttribute(
                    "name",
                    rs.getString("NAME")
            );

            request.setAttribute(
                    "email",
                    rs.getString("EMAIL")
            );

            request.setAttribute(
                    "contact",
                    rs.getString("CONTACT")
            );

            request.setAttribute(
                    "bio",
                    rs.getString("BIO")
            );

            request.setAttribute(
                    "address",
                    rs.getString("ADDRESS")
            );

            request.setAttribute(
                    "profileImage",
                    rs.getString("PROFILE_IMAGE")
            );


            // -------------------------------------------------
            // Keep session synchronized
            // -------------------------------------------------

            session.setAttribute(
                    "adminName",
                    rs.getString("NAME")
            );

            session.setAttribute(
                    "adminEmail",
                    rs.getString("EMAIL")
            );


            // -------------------------------------------------
            // Forward to JSP
            // -------------------------------------------------

            request.getRequestDispatcher(
                    "/admin/admin_profile/adminProfile.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while loading admin profile.",
                    e
            );

        } catch (Exception e) {

            throw new ServletException(e);

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ignored) {
            }
        }
    }


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        HttpSession session =
                request.getSession(false);


        // -----------------------------------------------------
        // Check login
        // -----------------------------------------------------

        if (session == null ||
                session.getAttribute("adminId") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin_login/adminLogin.jsp"
            );

            return;
        }


        int adminId;

        try {

            adminId = Integer.parseInt(
                    session.getAttribute("adminId").toString()
            );

        } catch (NumberFormatException e) {

            session.invalidate();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin_login/adminLogin.jsp"
            );

            return;
        }


        String action =
                request.getParameter("action");


        // -----------------------------------------------------
        // Change password
        // -----------------------------------------------------

        if ("changePassword".equalsIgnoreCase(action)) {

            changePassword(
                    request,
                    response,
                    adminId
            );

            return;
        }


        // -----------------------------------------------------
        // Update profile
        // -----------------------------------------------------

        if ("updateProfile".equalsIgnoreCase(action)) {

            updateProfile(
                    request,
                    response,
                    session,
                    adminId
            );

            return;
        }


        response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid profile action."
        );
    }


    // =========================================================
    // UPDATE PROFILE
    // =========================================================

    private void updateProfile(
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session,
            int adminId)
            throws ServletException, IOException {

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String contact =
                request.getParameter("contact");

        String address =
                request.getParameter("address");

        String bio =
                request.getParameter("bio");


        // -----------------------------------------------------
        // Validate required fields
        // -----------------------------------------------------

        if (name == null ||
                name.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Admin name is required."
            );

            return;
        }


        if (email == null ||
                email.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Admin email is required."
            );

            return;
        }


        name = name.trim();

        email = email.trim();


        if (contact != null) {
            contact = contact.trim();
        }

        if (address != null) {
            address = address.trim();
        }

        if (bio != null) {
            bio = bio.trim();
        }


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


            // -------------------------------------------------
            // Get current profile image
            // -------------------------------------------------

            String currentImage = null;


            String imageSql =
                    "SELECT PROFILE_IMAGE "
                    + "FROM ADMIN "
                    + "WHERE ADMIN_ID = ?";


            ps = con.prepareStatement(
                    imageSql
            );

            ps.setInt(
                    1,
                    adminId
            );


            rs = ps.executeQuery();


            if (rs.next()) {

                currentImage =
                        rs.getString(
                                "PROFILE_IMAGE"
                        );
            }


            rs.close();
            rs = null;

            ps.close();
            ps = null;


            // -------------------------------------------------
            // Handle image upload
            // -------------------------------------------------

            Part imagePart =
                    request.getPart("profileImage");


            String newImagePath =
                    currentImage;


            if (imagePart != null &&
                    imagePart.getSize() > 0) {


                String originalName =
                        imagePart.getSubmittedFileName();


                if (originalName == null ||
                        originalName.trim().isEmpty()) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid image file."
                    );

                    return;
                }


                originalName =
                        originalName.trim();


                // ---------------------------------------------
                // Extract only filename
                // ---------------------------------------------

                String fileNameOnly =
                        originalName.substring(
                                Math.max(
                                        originalName.lastIndexOf('/'),
                                        originalName.lastIndexOf('\\')
                                ) + 1
                        );


                // ---------------------------------------------
                // Extract extension
                // ---------------------------------------------

                String extension =
                        "";


                int lastDot =
                        fileNameOnly.lastIndexOf('.');


                if (lastDot >= 0) {

                    extension =
                            fileNameOnly
                                    .substring(lastDot)
                                    .toLowerCase()
                                    .trim();
                }


                // ---------------------------------------------
                // Validate extension
                // ---------------------------------------------

                if (!(extension.equals(".jpg")
                        || extension.equals(".jpeg")
                        || extension.equals(".png")
                        || extension.equals(".gif")
                        || extension.equals(".webp"))) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Only JPG, JPEG, PNG, GIF, and WEBP images are allowed."
                    );

                    return;
                }


                // ---------------------------------------------
                // Validate MIME type
                // ---------------------------------------------

                String contentType =
                        imagePart.getContentType();


                if (contentType == null ||
                        !contentType
                                .toLowerCase()
                                .startsWith("image/")) {

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Please select a valid image file."
                    );

                    return;
                }


                // ---------------------------------------------
                // Create safe filename
                // ---------------------------------------------

                String fileName =
                        "admin_"
                        + adminId
                        + "_"
                        + System.currentTimeMillis()
                        + extension;


                // ---------------------------------------------
                // Get upload directory
                // ---------------------------------------------

                String uploadDirectory =
                        getServletContext()
                                .getRealPath(
                                        "/uploads/admin"
                                );


                if (uploadDirectory == null) {

                    response.sendError(
                            HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "Unable to create image upload directory."
                    );

                    return;
                }


                File uploadDir =
                        new File(
                                uploadDirectory
                        );


                if (!uploadDir.exists() &&
                        !uploadDir.mkdirs()) {

                    response.sendError(
                            HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "Unable to create image upload directory."
                    );

                    return;
                }


                // ---------------------------------------------
                // Save image
                // ---------------------------------------------

                File imageFile =
                        new File(
                                uploadDir,
                                fileName
                        );


                imagePart.write(
                        imageFile.getAbsolutePath()
                );


                // ---------------------------------------------
                // Store relative path in database
                // ---------------------------------------------

                newImagePath =
                        "uploads/admin/"
                        + fileName;
            }


            // -------------------------------------------------
            // Update admin profile
            // -------------------------------------------------

            String updateSql =
                    "UPDATE ADMIN SET "
                    + "NAME = ?, "
                    + "EMAIL = ?, "
                    + "CONTACT = ?, "
                    + "ADDRESS = ?, "
                    + "BIO = ?, "
                    + "PROFILE_IMAGE = ? "
                    + "WHERE ADMIN_ID = ?";


            ps = con.prepareStatement(
                    updateSql
            );


            ps.setString(
                    1,
                    name
            );

            ps.setString(
                    2,
                    email
            );

            ps.setString(
                    3,
                    contact
            );

            ps.setString(
                    4,
                    address
            );

            ps.setString(
                    5,
                    bio
            );

            ps.setString(
                    6,
                    newImagePath
            );

            ps.setInt(
                    7,
                    adminId
            );


            int updated =
                    ps.executeUpdate();


            if (updated == 0) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Admin account not found."
                );

                return;
            }


            // -------------------------------------------------
            // Update current session
            // -------------------------------------------------

            session.setAttribute(
                    "adminName",
                    name
            );

            session.setAttribute(
                    "adminEmail",
                    email
            );


            // -------------------------------------------------
            // Redirect back to profile
            // -------------------------------------------------

            response.sendRedirect(
                    request.getContextPath()
                    + "/AdminProfileServlet?success=profile"
            );
            
            


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while updating admin profile.",
                    e
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Error while updating admin profile.",
                    e
            );

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ignored) {
            }
        }
    }


    // =========================================================
    // CHANGE PASSWORD
    // =========================================================

    private void changePassword(
            HttpServletRequest request,
            HttpServletResponse response,
            int adminId)
            throws ServletException, IOException {

        String currentPassword =
                request.getParameter(
                        "currentPassword"
                );

        String newPassword =
                request.getParameter(
                        "newPassword"
                );

        String confirmPassword =
                request.getParameter(
                        "confirmPassword"
                );


        // -----------------------------------------------------
        // Validate fields
        // -----------------------------------------------------

        if (currentPassword == null ||
                newPassword == null ||
                confirmPassword == null ||
                currentPassword.trim().isEmpty() ||
                newPassword.trim().isEmpty() ||
                confirmPassword.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Please fill all password fields."
            );

            return;
        }


        currentPassword =
                currentPassword.trim();

        newPassword =
                newPassword.trim();

        confirmPassword =
                confirmPassword.trim();


        // -----------------------------------------------------
        // Confirm password
        // -----------------------------------------------------

        if (!newPassword.equals(
                confirmPassword
        )) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "New password and confirm password do not match."
            );

            return;
        }


        // -----------------------------------------------------
        // Minimum length
        // -----------------------------------------------------

        if (newPassword.length() < 12) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Password must be at least 12 characters long."
            );

            return;
        }


        // -----------------------------------------------------
        // Password complexity
        // -----------------------------------------------------

        boolean hasUppercase =
                newPassword.matches(
                        ".*[A-Z].*"
                );

        boolean hasLowercase =
                newPassword.matches(
                        ".*[a-z].*"
                );

        boolean hasNumber =
                newPassword.matches(
                        ".*[0-9].*"
                );

        boolean hasSymbol =
                newPassword.matches(
                        ".*[^A-Za-z0-9].*"
                );


        if (!hasUppercase ||
                !hasLowercase ||
                !hasNumber ||
                !hasSymbol) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Password must contain uppercase, lowercase, number and symbol."
            );

            return;
        }


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


            // -------------------------------------------------
            // Get current password
            // -------------------------------------------------

            String checkSql =
                    "SELECT PASSWORD "
                    + "FROM ADMIN "
                    + "WHERE ADMIN_ID = ?";


            ps = con.prepareStatement(
                    checkSql
            );

            ps.setInt(
                    1,
                    adminId
            );


            rs = ps.executeQuery();


            if (!rs.next()) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Admin account not found."
                );

                return;
            }


            String dbPassword =
                    rs.getString(
                            "PASSWORD"
                    );


            rs.close();
            rs = null;

            ps.close();
            ps = null;


            // -------------------------------------------------
            // Verify current password
            // -------------------------------------------------

            if (dbPassword == null ||
                    !dbPassword.equals(
                            currentPassword
                    )) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Current password is incorrect."
                );

                return;
            }


            // -------------------------------------------------
            // Update password
            // -------------------------------------------------

            String updateSql =
                    "UPDATE ADMIN "
                    + "SET PASSWORD = ? "
                    + "WHERE ADMIN_ID = ?";


            ps = con.prepareStatement(
                    updateSql
            );


            ps.setString(
                    1,
                    newPassword
            );

            ps.setInt(
                    2,
                    adminId
            );


            int updated =
                    ps.executeUpdate();


            if (updated == 0) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Admin account not found."
                );

                return;
            }


            // -------------------------------------------------
            // Redirect
            // -------------------------------------------------

            response.sendRedirect(
                    request.getContextPath()
                    + "/AdminProfileServlet?success=password"
            );


        } catch (SQLException e) {

            throw new ServletException(
                    "Database error while changing password.",
                    e
            );

        } catch (Exception e) {

            throw new ServletException(
                    "Error while changing password.",
                    e
            );

        } finally {

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ignored) {
            }

            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ignored) {
            }
        }
    }
}

