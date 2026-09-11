package com.event.controller;

import com.event.dao.ManagerDAO;
import com.event.model.ManagerBean;
import java.io.File;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)

public class UpdatePhotoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        ManagerBean currentManager = (ManagerBean) session.getAttribute("manager");

        if (currentManager == null) {
            response.sendRedirect("manager_login.jsp");
            return;
        }

        try {
            Part filePart = request.getPart("profilePhoto");
            String fileName = filePart.getSubmittedFileName();
            
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            String dbPath = "uploads/" + fileName;

            ManagerDAO dao = new ManagerDAO();
            boolean isUpdated = dao.updatePhoto(currentManager.getManagerId(), dbPath);

            if (isUpdated) {
                currentManager.setPhoto(dbPath);
                session.setAttribute("manager", currentManager);
                session.setAttribute("photoPath", dbPath);
                response.sendRedirect("manager_profile.jsp?status=photo_updated");
            } else {
                response.sendRedirect("manager_profile.jsp?error=photo_update_failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manager_profile.jsp?error=exception");
        }
    }
}