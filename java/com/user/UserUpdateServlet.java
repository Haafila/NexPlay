package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String favGenre = request.getParameter("favGenre");
		String bio = request.getParameter("bio");
		String dob = request.getParameter("dob");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = UserDBUtil.updateUser(userid, name, email, favGenre, bio, dob, username, password);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(isTrue == true) {
			
			List<User> userDetails = UserDBUtil.getUser(username);
			request.setAttribute("userDetails", userDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
			dis.forward(request, response);
		
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Failed to Update the Profile. Try again!');");
			out.println("location='profile.jsp'");
			out.println("</script>");
			
		}
		
	}

}
