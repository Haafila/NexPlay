package com.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contactupdate")
public class UpdateContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id = request.getParameter("cid");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String subject = request.getParameter("subject");
        String msg = request.getParameter("msg");

        // Call the method in ContactDBUtil to update the contact in the database
        boolean isTrue = ContactDBUtil.updateContact(id, name, username, subject, msg);

        // If update is successful, retrieve updated contact details and forward to info page
        if (isTrue) {    
            List<Contact> contactDetails = ContactDBUtil.getContactDetails(username);
            request.setAttribute("contactDetails", contactDetails);
            request.setAttribute("userName", username); // Pass username back for any display needs

          
            RequestDispatcher dis = request.getRequestDispatcher("contactinfo.jsp");
            dis.forward(request, response);
        } 
        // If update fails, forward back to the update form with an error message
        else {
            request.setAttribute("errorMessage", "Failed to update contact details.");
            RequestDispatcher dis2 = request.getRequestDispatcher("updatecontact.jsp?cid=" + id);
            dis2.forward(request, response);
        }
    }
}