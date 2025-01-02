<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom_loginSignup.css" rel="stylesheet">

</head>
<body>
	<%@ include file="header.jsp" %>

    
    <% 
	    String message = request.getParameter("message"); 
	    if ("loggedout".equals(message)) {
	%>
	    <script type="text/javascript">
	        alert("Successfully Logged out!");
	    </script>
	<% 
	    }
	%>
    

	<br><br><br>
	<!-- Login Form Container -->
    <div class="container d-flex justify-content-end align-items-center min-vh-50">
        <div class="card p-4 shadow-lg" style="width: 100%; max-width: 400px;">
            <h2 class="text-center mb-4">Login</h2>
            <form action="LoginServlet" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter your username" name="username" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password" required>
                </div>

                <button type="submit" class="btn btn-secondary w-100">Sign Up</button>

                <div class="text-center mt-3">
                    <a href="#" style="color:pink;">Forgot Password?</a>
                </div>

                <div class="text-center mt-2">
                    Don’t have an account?<a href="signup.jsp" style="color:pink;">&nbsp;Sign up</a>
                </div>
            </form>
        </div>
    </div><br><br>
	
	<%@ include file="footer.jsp" %>
	
	
</body>
</html>