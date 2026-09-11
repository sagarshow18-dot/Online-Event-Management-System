package com.event.dao;

import com.event.model.EventBean;
import com.event.utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    public boolean addEvent(EventBean event) {
        boolean isSuccess = false;
        String query = "INSERT INTO EVENTS (EVENT_ID, EVENT_NAME, DESCRIPTION, EVENT_DATE, EVENT_TIME, LOCATION, MANAGER_ID, CAPACITY, PRICE, STATUS) " +
                       "VALUES (event_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, 'ACTIVE')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, event.getEventName());
            ps.setString(2, event.getDescription());
            ps.setDate(3, event.getEventDate());
            ps.setString(4, event.getEventTime()); 
            ps.setString(5, event.getLocation());
            ps.setInt(6, event.getManagerId());
            ps.setInt(7, event.getCapacity());
            ps.setDouble(8, event.getPrice());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public List<EventBean> getAllEvents() {
        List<EventBean> events = new ArrayList<>();
        String query = "SELECT * FROM EVENTS ORDER BY EVENT_DATE ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                EventBean eb = new EventBean();
                eb.setEventId(rs.getInt("EVENT_ID"));
                eb.setEventName(rs.getString("EVENT_NAME"));
                eb.setDescription(rs.getString("DESCRIPTION"));
                eb.setEventDate(rs.getDate("EVENT_DATE"));
                eb.setEventTime(rs.getString("EVENT_TIME"));
                eb.setLocation(rs.getString("LOCATION"));
                eb.setManagerId(rs.getInt("MANAGER_ID"));
                eb.setCapacity(rs.getInt("CAPACITY"));
                eb.setPrice(rs.getDouble("PRICE"));
                eb.setStatus(rs.getString("STATUS"));
                
                events.add(eb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return events;
    }

    public EventBean getEventById(int eventId) {
        EventBean event = null;
        String query = "SELECT * FROM EVENTS WHERE EVENT_ID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, eventId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    event = new EventBean();
                    event.setEventId(rs.getInt("EVENT_ID"));
                    event.setEventName(rs.getString("EVENT_NAME"));
                    event.setDescription(rs.getString("DESCRIPTION"));
                    event.setEventDate(rs.getDate("EVENT_DATE"));
                    event.setEventTime(rs.getString("EVENT_TIME"));
                    event.setLocation(rs.getString("LOCATION"));
                    event.setManagerId(rs.getInt("MANAGER_ID"));
                    event.setCapacity(rs.getInt("CAPACITY"));
                    event.setPrice(rs.getDouble("PRICE"));
                    event.setStatus(rs.getString("STATUS"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return event;
    }
}