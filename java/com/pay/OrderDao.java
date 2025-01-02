package com.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.user.DBConnect;

public class OrderDao {

    public OrderDao() {
        // Default constructor
    }
    
    private static Connection con = null;

    public static boolean saveOrder(String gameName, String price, String email, String mobile, String userName, String cardNumber, String expireDate, int cvv) {
        
        boolean isSuccess = false;
        
        try {
            con = DBConnect.getConnection();
            
            // Get the current date and time
            Date todaysDate = new Date();
            DateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String purchaseDate = df2.format(todaysDate);
            
            // SQL query using PreparedStatement to avoid SQL injection
            String sql = "INSERT INTO `order` (orderId, gameName, price, email, mobile, userName, status, purchaseDate, cardNumber, expireDate, cvv) " +
                         "VALUES (0, ?, ?, ?, ?, ?, 1, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            
            // Set the values for the placeholders
            pstmt.setString(1, gameName);
            pstmt.setString(2, price);
            pstmt.setString(3, email);
            pstmt.setString(4, mobile);
            pstmt.setString(5, userName);
            pstmt.setString(6, purchaseDate);
            pstmt.setString(7, cardNumber);
            pstmt.setString(8, expireDate);
            pstmt.setInt(9, cvv);
            
            // Execute the update
            int rs = pstmt.executeUpdate();
            
            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return isSuccess;
    }

	// Update order status method
    public static boolean updateStatus(int orderId) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Get a connection from the DBConnect class
            con = DBConnect.getConnection();
            String sql = "UPDATE `order` SET status = ? WHERE orderId = ?"; // Using parameterized query
            
            // Create a PreparedStatement
            ps = con.prepareStatement(sql);
            ps.setInt(1, 2); // Set the status to 2
            ps.setInt(2, orderId); // Set the orderId

            // Execute the update
            int rowsAffected = ps.executeUpdate();
            isSuccess = (rowsAffected > 0); // Set success based on whether rows were updated
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess; // Return the success status
    }

}
