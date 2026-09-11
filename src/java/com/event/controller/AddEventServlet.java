package com.event.controller;

import com.event.dao.EventDAO;
import com.event.model.EventBean;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Grab manager ID from session (prevents hardcoding and profile/event unlinking)
        HttpSession session = request.getSession();
        Integer managerId = (Integer) session.getAttribute("managerId");
        
        if (managerId == null) {
            response.sendRedirect("manager_login.jsp");
            return;
        }

        try {
            // 2. Extract parameters matching your form inputs and DAO expectations
            String eventName = request.getParameter("eventName");
            String description = request.getParameter("description");
            String eventDateStr = request.getParameter("eventDate");
            String eventTime = request.getParameter("eventTime");
            String location = request.getParameter("location");
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            double price = Double.parseDouble(request.getParameter("price"));

            // 3. Populate the EventBean
            EventBean event = new EventBean();
            event.setEventName(eventName);
            event.setDescription(description);
            event.setEventDate(Date.valueOf(eventDateStr)); // expects YYYY-MM-DD from HTML date input
            event.setEventTime(eventTime);
            event.setLocation(location);
            event.setManagerId(managerId);
            event.setCapacity(capacity);
            event.setPrice(price);

            // 4. Save via DAO
            EventDAO dao = new EventDAO();
            boolean isAdded = dao.addEvent(event);

            if (isAdded) {
                response.sendRedirect("manage_events.jsp");
            } else {
                response.sendRedirect("add_event_fail.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_event_fail.jsp");
        }
    }
}