package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String favGenre = request.getParameter("favGenre");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isTrue;
		
		isTrue = UserDBUtil.insertUser(name, email, favGenre, username, password);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(isTrue == true) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Account successfully created.');");
			out.println("location='login.jsp'");
			out.println("</script>");
		
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Failed to create an Account. Try again!');");
			out.println("location='signup.jsp'");
			out.println("</script>");
			
		}
	}

}
