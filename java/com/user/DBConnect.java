package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/onlinegaming?useSSL=false";
	private static String user = "root";
	private static String pwd = "usalma715202";
	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Failed to connect to the database!!!");
		}
		
		return con;
	}
}