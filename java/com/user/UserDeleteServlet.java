package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserDeleteServlet")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);

        if (session != null) {
            String username = (String) session.getAttribute("username");

            if (username != null) {
                // Here, you'd add your logic to delete the user's account from the database
                boolean isDeleted = UserDBUtil.deleteAccount(username);

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                if (isDeleted) {
                    // Invalidate the session after deletion
                    session.invalidate();
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Account successfully deleted.');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Failed to delete the Account.');");
                    out.println("location='login.jsp';");
                    out.println("</script>");
                }
            } else {
                response.getWriter().write("User Not Found.");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
	}

}
