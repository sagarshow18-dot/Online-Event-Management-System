package com.event.controller;

import com.event.dao.ManagerDAO;
import com.event.model.ManagerBean;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        ManagerBean currentManager = (ManagerBean) session.getAttribute("manager");

        if (currentManager == null) {
            response.sendRedirect("manager_login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        if (currentPassword == null || !currentPassword.equals(currentManager.getPassword())) {
            response.sendRedirect("manager_profile.jsp?error=wrong_current_password");
            return;
        }

        ManagerDAO dao = new ManagerDAO();
        boolean isUpdated = dao.updatePassword(currentManager.getManagerId(), newPassword);

        if (isUpdated) {
            currentManager.setPassword(newPassword);
            session.setAttribute("manager", currentManager);
            response.sendRedirect("manager_profile.jsp?status=password_updated");
        } else {
            response.sendRedirect("manager_profile.jsp?error=password_update_failed");
        }
    }
}