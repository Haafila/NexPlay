package com.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deletecontact")
public class DeleteContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        String username = request.getParameter("username"); 

        boolean isDeleted = ContactDBUtil.deleteContact(cid);

        if (isDeleted) {
            // Retrieve updated contact details
            List<Contact> contactDetails = ContactDBUtil.getContactDetails(username);
            request.setAttribute("contactDetails", contactDetails);
            request.setAttribute("userName", username);

            RequestDispatcher dis = request.getRequestDispatcher("contactinfo.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to delete contact.");
            request.getRequestDispatcher("deletecontact.jsp").forward(request, response);
        }
    }
}
