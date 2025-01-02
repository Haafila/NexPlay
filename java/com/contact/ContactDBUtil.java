package com.contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.user.DBConnect;

public class ContactDBUtil {
    
    // Insert Contact Info
    public static boolean insertContactDetails(String name, String username, String subject, String msg) {
        boolean isSuccess = false;
        String sql = "INSERT INTO contact (name, username, subject, msg)"+ " VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, subject);
            pstmt.setString(4, msg);
            
            isSuccess = pstmt.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace(); 
        }
        return isSuccess;
    }

    // Retrieve contact info
    public static List<Contact> getContactDetails(String username) {
        List<Contact> contact = new ArrayList<>();
        String sql = "SELECT * FROM contact WHERE username = ?";

        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int cid = rs.getInt("cid");
                    String name = rs.getString("name");
                    String uname = rs.getString("username");
                    String subject = rs.getString("subject");
                    String msg = rs.getString("msg");
                    
                    Contact cnt = new Contact(cid, name, uname, subject, msg);
                    contact.add(cnt);
                }
            }
        } catch(SQLException e) {
            e.printStackTrace(); 
        }
        
        return contact;
    }

    // Update contact information
    public static boolean updateContact(String cid, String name, String username, String subject, String msg) {
        boolean isSuccess = false;
        String sql = "UPDATE contact SET name=?, username=?, subject=?, msg=? WHERE cid=?";

        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, subject);
            pstmt.setString(4, msg);
            pstmt.setInt(5, Integer.parseInt(cid));
            
            isSuccess = pstmt.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace(); 
        }
        return isSuccess;
    }

    // Delete contact data
    public static boolean deleteContact(String cid) {    
        boolean isSuccess = false;
        String sql = "DELETE FROM contact WHERE cid = ?";

        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setInt(1, Integer.parseInt(cid));
            isSuccess = pstmt.executeUpdate() > 0;
        } catch(SQLException e) {
            e.printStackTrace(); 
        }
        return isSuccess;
    }
}


