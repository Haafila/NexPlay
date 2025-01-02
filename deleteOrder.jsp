<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.user.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Order</title>
</head>
<body>

<%
    try {
        String id = request.getParameter("id"); // Get orderId from the request
        
        if (id != null) {
            Connection con = null;
            PreparedStatement ps = null;

            try {
                // Get the database connection
                con = DBConnect.getConnection();
                
                // Prepare the SQL query using a PreparedStatement
                String query = "DELETE FROM `order` WHERE orderId = ?";
                ps = con.prepareStatement(query);
                ps.setInt(1, Integer.parseInt(id)); // Set the orderId parameter
                
                // Execute the update
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    // Redirect to allOrders.jsp if the deletion was successful
                    response.sendRedirect("pymtManagement.jsp");
                } else {
                    out.println("<h3>Failed to delete the order. Order not found.</h3>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>An error occurred while deleting the order.</h3>");
            } finally {
                // Close the resources
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        } else {
            out.println("<h3>Invalid Order ID.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
