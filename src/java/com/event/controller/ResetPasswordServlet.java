package com.event.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");
        Boolean isVerified = (Boolean) session.getAttribute("verified");
        String newPassword = request.getParameter("newPassword");

        if (email == null || isVerified == null || !isVerified) {
            response.sendRedirect("forgot_password.jsp");
            return;
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            Statement stmt = con.createStatement();
            
            String query = "UPDATE EVENT_MANAGERS SET PASSWORD='" + newPassword + "' WHERE EMAIL='" + email + "'";
            int rows = stmt.executeUpdate(query);
            
            if (rows > 0) {
                session.invalidate(); // Clear all session attributes safely
                response.sendRedirect("manager_login.jsp?msg=success");
            } else {
                response.sendRedirect("reset_password.jsp?error=update_failed");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("reset_password.jsp?error=exception");
        }
    }
}