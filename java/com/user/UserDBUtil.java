package com.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	// This is to validate login credentials of the user
	public static boolean validate (String username, String password) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM User WHERE username = '"+username+"' AND password = '"+password+"' AND activeStatus = 1";
			
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
			rs.close();
	        stmt.close();
	        con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<User> getUser(String username) {
		
		ArrayList<User> user = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM User WHERE username = '"+username+"'";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int userid = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String favGenre = rs.getString(4);
				String bio = rs.getString(5);
				String dob = rs.getString(6);
				String uname = rs.getString(7);
				String password = rs.getString(8);
				String createdAt = rs.getString(9);
				int activeStatus = rs.getInt(10);
				
				User userObj = new User(userid, name, email, favGenre, bio, dob, uname, password, createdAt, activeStatus);
				
				user.add(userObj);
			}
			
			rs.close();
	        stmt.close();
	        con.close();
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return user;
	}
	
	public static boolean insertUser(String name, String email, String favGenre, String username, String password) {
		
		isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO User(userid, name, email, favGenre, username, password, activeStatus) VALUES "
						+ "(0, '"+name+"', '"+email+"', '"+favGenre+"', '"+username+"', '"+password+"', 1)";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
	        stmt.close();
	        con.close();
			
		} catch(SQLException e) {
			System.out.println(e);
		}
			
		return isSuccess;
	}
	
	public static boolean updateUser(String userid, String name, String email, String favGenre, String bio, String dob, String username, String password) {
		isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE User SET name='"+name+"', email='"+email+"', favGenre='"+favGenre+"', bio='"+bio+"', dob='"+dob+"', username='"+username+"', password='"+password+"'"
						+ "WHERE userid='"+userid+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean deleteAccount(String username) {
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM User where username = '"+username+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

}
