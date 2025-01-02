package com.game;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/Update")
@MultipartConfig
public class UpdateGameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
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
			
		  Part filePart1 = request.getPart("icon");
		  
		  Part filePart2 = request.getPart("current_icon");
			
		  InputStream fileContent = null;
		  
		  if (filePart1 != null && filePart1.getSize() > 0) {
			  
				fileContent = filePart1.getInputStream();
			} else {
				
				fileContent = filePart2.getInputStream();
			}
			 
		  
		  
		  String des = request.getParameter("des");
			
		  boolean multiplayer = Boolean.parseBoolean(request.getParameter("multi"));
		  
		  boolean istrue;
		  
		  istrue = GameDButil.UpdateGame(id,G_name, genre, des, releaseDate, fileContent, price, multiplayer);
				 
		  if(istrue==true) {
			  
			    request.setAttribute("IsSuccess", true);
			   
				RequestDispatcher dis1 = request.getRequestDispatcher("GameListServlet");
				
				dis1.forward(request, response);
			}else {
				
				  RequestDispatcher dis2 =request.getRequestDispatcher("UpdateGame.jsp");
				  
				  dis2.forward(request, response);
				 
	           
			}
	}

}

