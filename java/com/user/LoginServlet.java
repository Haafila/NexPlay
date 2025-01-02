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
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isTrue;
        isTrue = UserDBUtil.validate(username, password);

        if (isTrue) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(60 * 60); // 1 hour session

            // Get user details
            List<User> userDetails = UserDBUtil.getUser(username);
            
            if (userDetails.isEmpty()) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Error fetching user details. Please try again.');");
                out.println("location='login.jsp';");
                out.println("</script>");
                return;
            }

            if (userDetails != null && !userDetails.isEmpty()) {
                request.setAttribute("userDetails", userDetails);
            }
           
            if (username.equals("admin")) {
                RequestDispatcher dis1 = request.getRequestDispatcher("adminDashboard.jsp");
                dis1.forward(request, response);
            } else {
                RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
                dis.forward(request, response);
            }

        } else {
            // Invalid login attempt
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid credentials or account deactivated.');");
            out.println("location='login.jsp';");
            out.println("</script>");
        }
    }
}
