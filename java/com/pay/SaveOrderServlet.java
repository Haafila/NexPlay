package com.pay;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SaveOrderServelet
 */
@WebServlet("/SaveOrderServelet")
public class SaveOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");
		
		String gameName = request.getParameter("gameName");
        String price = request.getParameter("price");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String userName = request.getParameter("userName");
        String cardNumber = request.getParameter("cardNumber");
        String expireDate = request.getParameter("expireDate");
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        
        
        
        boolean isTrue;
		isTrue = OrderDao.saveOrder(gameName, price, email, mobile, userName, cardNumber, expireDate, cvv);
		
		if (isTrue == true) {
			out.println("<script type='text/javascript'>");
            out.println("alert('Payment Successful. Enjoy your game.');");
            out.println("location='UserGameListServlet';");
            out.println("</script>");
		} else {
			out.println("<script type='text/javascript'>");
            out.println("alert('Payment Unsuccessful.');");
            out.println("location='UserGameListServlet';");
            out.println("</script>");
		}
	}

}
