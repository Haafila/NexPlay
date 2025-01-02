package com.game;


import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/addGame")
@MultipartConfig
public class AddgameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String G_name = request.getParameter("g_name");
	
		
		
		  String releaseDateStr = request.getParameter("releaseDate");
		  
		  // Convert the string release date to java.sql.Date 
		  java.sql.Date releaseDate = null; 
		  try { 
			  // Convert the string release date to java.util.Date
		  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		  
		  java.util.Date utilDate = format.parse(releaseDateStr);
		  
		  // Convert java.util.Date to java.sql.Date 
		  releaseDate = new java.sql.Date(utilDate.getTime()); 
		  
		  } catch (ParseException e) {
		  e.printStackTrace();
		  }
		 
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		String genre = request.getParameter("genre");
		
		Part filePart = request.getPart("icon");
	    InputStream fileContent=filePart.getInputStream();
		
		String des = request.getParameter("des");
		
		boolean multiplayer = Boolean.parseBoolean(request.getParameter("multi"));
		
		
		System.out.println("Game Name: " + G_name);
		System.out.println("Release Date: " + releaseDate);
		System.out.println("Price: " + price);
		System.out.println("Genre: " + genre);
		System.out.println("Multiplayer: " + multiplayer);
		System.out.println("Description: " + des);
		System.out.println("Icon File: " + fileContent.available()); // to check if the file is read correctly

		
		
		boolean gameExists = GameDButil.checkIfGameExists(G_name); // A method to check if the game already exists

		if (gameExists) {
		    // Set an attribute to indicate the game already exists
		    request.setAttribute("gameExists", true);
		    RequestDispatcher dis2 = request.getRequestDispatcher("/AddGame.jsp");
		    dis2.forward(request, response);
		}else {
		
		request.setAttribute("g_name", G_name);
        request.setAttribute("releaseDate", releaseDateStr);
        request.setAttribute("price", price);
        request.setAttribute("genre", genre);
        request.setAttribute("des", des);
        request.setAttribute("multiplayer", multiplayer);
		
		boolean istrue;
		
		istrue = GameDButil.InsertGame(G_name, genre, des, releaseDate, fileContent, price, multiplayer);
		
		if(istrue==true) {
			
			request.setAttribute("success", true);
			RequestDispatcher dis1 = request.getRequestDispatcher("/AddGame.jsp");
			
			dis1.forward(request, response);
		}else {
			
			
			request.setAttribute("unsuccess", true);
			  RequestDispatcher dis2 =request.getRequestDispatcher("/AddGame.jsp");
			  //RequestDispatcher dis2 =request.getRequestDispatcher("/AddGame.jsp");
			  
			  dis2.forward(request, response);
			 
           
		}
		}
	}

}

