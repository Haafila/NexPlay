package com.contact;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String subject = request.getParameter("subject");
        String msg = request.getParameter("msg");

        boolean isTrue = ContactDBUtil.insertContactDetails(name, username, subject, msg);

        if (isTrue) {
            List<Contact> contactDetails = ContactDBUtil.getContactDetails(username);
            request.setAttribute("contactDetails", contactDetails);
            request.setAttribute("userName", username); // Use username to get contacts

            RequestDispatcher dis = request.getRequestDispatcher("contactinfo.jsp");
            dis.forward(request, response);
        } else {
            // Handle insertion failure
            request.setAttribute("errorMessage", "Failed to insert contact details.");
            RequestDispatcher dis = request.getRequestDispatcher("error.jsp");
            dis.forward(request, response);
        }
    }
}
