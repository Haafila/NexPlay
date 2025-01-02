package com.game;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserGameListServlet")
public class UserGameListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String FilterBy = request.getParameter("genre");
		
		
		List<Game> gamesList;
		
		if (FilterBy != null && !FilterBy.isEmpty()) {
			
            gamesList = GameDButil.getGamesByGenre(FilterBy);  
        } else {
            gamesList = GameDButil.DisplayGameList();  
        }
		
		request.setAttribute("gamesList", gamesList);
	    RequestDispatcher dis = request.getRequestDispatcher("UserDisplayGameList.jsp");
	    dis.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    List<Game> gamesList = GameDButil.DisplayGameList();
	    request.setAttribute("gamesList", gamesList);
	    RequestDispatcher dis = request.getRequestDispatcher("UserDisplayGameList.jsp");
	    dis.forward(request, response);
		
	}

}

