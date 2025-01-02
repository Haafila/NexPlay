package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserStatusServlet")
public class UpdateUserStatusServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("userid"));
        int newStatus = Integer.parseInt(request.getParameter("newStatus"));

        try (Connection conn = DBConnect.getConnection()) {
            String updateQuery = "UPDATE User SET activeStatus = ? WHERE userid = ?";
            PreparedStatement pst = conn.prepareStatement(updateQuery);
            pst.setInt(1, newStatus);
            pst.setInt(2, userid);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("userManagement.jsp");
    }
}

