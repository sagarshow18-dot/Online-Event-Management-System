package com.event.controller;

import com.event.dao.ManagerDAO;
import com.event.model.ManagerBean;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            HttpSession session = request.getSession();
            
            Integer managerId = (Integer) session.getAttribute("managerId");
            
            if (managerId == null) {
                ManagerBean loggedInManager = (ManagerBean) session.getAttribute("manager");
                if (loggedInManager != null) {
                    managerId = loggedInManager.getManagerId();
                }
            }

            if (managerId == null) {
                response.sendRedirect("manager_login.jsp");
                return;
            }

            String name = request.getParameter("name"); 
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address"); 
            
            ManagerBean manager = new ManagerBean();
            manager.setManagerId(managerId);
            manager.setName(name);
            manager.setEmail(email);
            manager.setContact(contact);
            manager.setAddress(address);

            ManagerDAO dao = new ManagerDAO();
            boolean isUpdated = dao.updateProfile(manager);

            if (isUpdated) {
                session.setAttribute("manager", manager);
                response.sendRedirect("manager_profile.jsp?status=success");
            } else {
                response.sendRedirect("manager_profile.jsp?error=update_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manager_profile.jsp?error=exception");
        }
    }
}