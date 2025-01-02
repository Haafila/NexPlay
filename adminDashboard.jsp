<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
	
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter output = response.getWriter();
	
    if (username == null || !"admin".equals(username)) {
        
        output.println("<script type='text/javascript'>");
        output.println("alert('Please login before viewing this page!');");
        output.println("window.location.href = 'login.jsp';");
        output.println("</script>");
        output.close();
        return;
    } 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
	body{
		background-color: #c3b1e1;
	}
	.text-center {
		color:purple;
		font-weight:bolder;
	}
</style>
</head>
<body>

     <%@ include file="header.jsp" %>
        
     <div class="container py-5" style="width:60%;">
        <div class="card shadow-lg p-4">
            <h1 class="text-center">Welcome, <%= session.getAttribute("username") %>!</h1><br><br>
            <a href="userManagement.jsp">
			<button class="btn btn-secondary" style="width:100%; padding:20px;"><b>User Management</b> </button></a><br>
			<form action="GameListServlet" method="post">
			    <input type="submit" value="Game Management" style="width:100%; padding:20px; font-weight:bolder;">
			</form>
			<br>
			<a href="pymtManagement.jsp">
			<button class="btn btn-secondary" style="width:100%; padding:20px;"><b>Payment Management</b> </button></a><br>
			<!-- Logout Button -->
   			<div class="text-center mt-3">
	        <form method="GET" action="LogoutServlet" style="width:100%;">
	            <button type="submit" name="logout" class="btn btn-secondary" style="background-color:#ff69b4; border-color:#ff69b4; color:white; width:30%; border:3px solid white;">
	                Logout
	            </button>
	        </form></div>
   			 
      </div>
	</div>
	                   
   
	<%@ include file="footer.jsp" %>


</body>
</html>