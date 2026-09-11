package com.event.controller;

import com.event.dao.ManagerDAO;
import com.event.model.ManagerBean;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    ManagerDAO dao = new ManagerDAO();
    ManagerBean manager = dao.validateLogin(email, password);

    if (manager != null) {
        HttpSession session = request.getSession();
        session.setAttribute("manager", manager);
        session.setAttribute("managerId", manager.getManagerId());
        
        session.setAttribute("managerName", manager.getName());
        session.setAttribute("photoPath", manager.getPhoto());
        
        response.sendRedirect("manager_dashboard.jsp");
        } else {
            response.sendRedirect("manager_login_fail.jsp");
        }
    }
}