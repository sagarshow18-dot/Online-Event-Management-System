package com.event.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        
        try {
            HttpSession session = request.getSession();
            session.setAttribute("resetEmail", email);
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            Statement stmt = con.createStatement();
            
            String query = "SELECT * FROM EVENT_MANAGERS WHERE EMAIL='" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                String secQuestion = rs.getString("SECURITY_QUESTION");
                
                request.setAttribute("secQuestion", secQuestion);
                request.getRequestDispatcher("security_question.jsp").forward(request, response);
            } else {
                response.sendRedirect("forgot_password.jsp?error=notfound");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgot_password.jsp?error=exception");
        }
    }
}