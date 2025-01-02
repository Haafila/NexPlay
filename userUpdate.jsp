<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom_style.css" rel="stylesheet">
    <link href="css/custom_loginSignup.css" rel="stylesheet">
	<style>
		body {
			background-image:url('images/bg101.jpg') !important;
			background-size: cover !important;
		  	background-position: center !important;
			background-attachment: fixed !important;
		}
	</style>
</head>
<body>
	
	<%@ include file="header.jsp" %>
	<br>
	<!-- Sign Up Form Container -->
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
            <h2 class="text-center mb-4">Update Account</h2>
            <%
				String userid = request.getParameter("userid");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String favGenre = request.getParameter("favGenre");
				String bio = request.getParameter("bio");
				String dob = request.getParameter("dob");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String createdAt = request.getParameter("createdAt");
			%>
            <form action="UserUpdateServlet" method="POST">
            
            	<div class="mb-3">
                    <label for="userid" class="form-label">User ID</label>
                    <input type="text" class="form-control" id="userid" name="userid" value="<%= userid %>" readonly>
                </div>
            	
            	<div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= name %>">
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= email %>">
                </div>
                
                <div class="mb-3">
			        <label for="favGenre" class="form-label">Favourite Gaming Genre</label>
			        <select id="favGenre" name="favGenre" class="form-select">
			            <option value="<%= favGenre %>" selected><%= favGenre %></option>
			            <option value="Racing">Racing</option>
			            <option value="FPS">FPS</option>
			            <option value="Action-Adventure">Action-Adventure</option>
			            <option value="Sports">Sports</option>
			        </select>
			    </div>
			    
			    <div class="mb-3">
                    <label for="bio" class="form-label">Bio</label><br>
                    <textarea id="bio" name="bio" placeholder="Tell us about yourself" rows="4" cols="52" style="padding:5px; border-radius:10px;"><%= bio %></textarea>
                </div>
                
                <div class="mb-3">
                    <label for="dob" class="form-label">Date Of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" value="<%= dob %>">
                </div>
                
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="<%= username %>">
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" class="form-control" id="password" name="password" value="<%= password %>">
                </div>

                <div class="mb-3">
                    <label for="createdAt" class="form-label">Account created at</label>
                    <input type="text" class="form-control" id="createdAt" name="createdAt" value="<%= createdAt %>" readonly>
                </div>
                
                <input type="submit" value="Update" class="btn btn-secondary" style="width:100%;">
			
            </form>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>