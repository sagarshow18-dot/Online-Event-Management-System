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

public class VerifyAnswerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");
        String userAnswer = request.getParameter("answer");

        if (email == null) {
            response.sendRedirect("forgot_password.jsp");
            return;
        }

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "manager");
            Statement stmt = con.createStatement();
            
            String query = "SELECT SECURITY_ANSWER FROM EVENT_MANAGERS WHERE EMAIL='" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                String dbAnswer = rs.getString("SECURITY_ANSWER");
                
                if (dbAnswer != null && dbAnswer.equalsIgnoreCase(userAnswer.trim())) {
                    session.setAttribute("verified", true);
                    response.sendRedirect("reset_password.jsp");
                } else {
                    response.sendRedirect("security_question.jsp?error=wronganswer");
                }
            } else {
                response.sendRedirect("forgot_password.jsp");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("forgot_password.jsp?error=exception");
        }
    }
}