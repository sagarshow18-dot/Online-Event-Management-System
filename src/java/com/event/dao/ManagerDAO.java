package com.event.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.event.model.ManagerBean;
import com.event.utils.DBConnection;
import java.sql.*;

public class ManagerDAO {

    public ManagerBean validateLogin(String email, String password) {
        ManagerBean manager = null;
        String query = "SELECT * FROM EVENT_MANAGERS WHERE EMAIL = ? AND PASSWORD = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    manager = new ManagerBean();
                    manager.setManagerId(rs.getInt("MANAGER_ID"));
                    manager.setName(rs.getString("NAME"));
                    manager.setEmail(rs.getString("EMAIL"));
                    manager.setContact(rs.getString("CONTACT"));
                    manager.setAddress(rs.getString("ADDRESS"));
                    manager.setStatus(rs.getString("STATUS"));
                    manager.setPassword(rs.getString("PASSWORD")); 
                    manager.setPhoto(rs.getString("PHOTO_PATH"));   
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return manager;
    }
    
    public boolean updatePhoto(int managerId, String photoPath) {
    String query = "UPDATE EVENT_MANAGERS SET PHOTO_PATH = ? WHERE MANAGER_ID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, photoPath);
        ps.setInt(2, managerId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
    
    public boolean updatePassword(int managerId, String newPassword) {
    String query = "UPDATE EVENT_MANAGERS SET PASSWORD = ? WHERE MANAGER_ID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        ps.setString(1, newPassword);
        ps.setInt(2, managerId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    public boolean updateProfile(ManagerBean manager) {
        boolean isSuccess = false;
        String query = "UPDATE EVENT_MANAGERS SET NAME = ?, EMAIL = ?, CONTACT = ?, ADDRESS = ? WHERE MANAGER_ID = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, manager.getName());
            ps.setString(2, manager.getEmail());
            ps.setString(3, manager.getContact());
            ps.setString(4, manager.getAddress());
            ps.setInt(5, manager.getManagerId());
            
            
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}