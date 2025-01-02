<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom_loginSignup.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp" %>
	 <!-- Sign Up Form Container -->
	<br><br>
    <div class="container d-flex justify-content-end align-items-center min-vh-90">
        <div class="card p-4 shadow-lg" style="width: 100%; max-width: 500px;">
            <h2 class="text-center mb-4">Sign Up</h2>
            <form action="SignupServlet" method="POST" onsubmit="validateForm(event)">
    
			    <div class="mb-3">
			        <label for="name" class="form-label">Name</label>
			        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
			    </div>
			
			    <div class="mb-3">
			        <label for="email" class="form-label">Email address</label>
			        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
			    </div>
			
			    <div class="mb-3">
			        <label for="favGenre" class="form-label">Favourite Gaming Genre</label>
			        <select id="favGenre" name="favGenre" class="form-select" required>
			            <option value="" disabled selected>Select your favourite genre</option>
			            <option value="Racing">Racing</option>
			            <option value="Puzzel">Puzzle</option>
			            <option value="FPS">FPS</option>
			            <option value="Action">Action</option>
			            <option value="Adventure">Adventure</option>
			            <option value="Sports">Sports</option>
			        </select>
			    </div>
			
			    <div class="mb-3">
			        <label for="username" class="form-label">Username</label>
			        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
			    </div>
			
			    <div class="mb-3">
			        <label for="password" class="form-label">Password</label>
			        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
			    </div>
			
			    <div class="mb-3">
			        <label for="confirm-password" class="form-label">Confirm Password</label>
			        <input type="password" class="form-control" id="confirm-password" name="re_password" placeholder="Re-enter your password" required>
			    </div>
			
			    <button type="submit" class="btn btn-secondary w-100">Sign Up</button>
			
			    <div class="text-center mt-3">
			        Already have an account? <a href="login.jsp" style="color:pink;">Log in</a>
			    </div>
			
			</form>

        </div>
    </div>
	<br><br><br>
	<%@ include file="footer.jsp" %>
    <script src="js/formValidate.js"></script>
</body>
</html>