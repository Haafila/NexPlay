<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="css/custom_style.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <!-- logo here -->
            <a class="navbar-brand" href="#">
                <img src="images/logo.jpeg" alt="Website Logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserGameListServlet">Games</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blog.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contactUs.jsp">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><button type="button" class="btn btn-outline-primary me-2" style="color: white; border-color:white;">Login</button></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp"><button type="button" class="btn btn-primary" style="background-color: #310053;">Sign-up</button></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile"><img src="images/profile_icon.png" title="Go to Profile"></a>
                    </li>
                    <li class="nav-item" style="margin-left: 250px">
                        <a class="nav-link" href="adminDashboard.jsp"><button type="button" class="btn btn-primary" style="background-color: #8b0d88; border: 1px solid white">Dashboard</button></a>
                    </li>
                </ul>
            </div>
        
        </div>
    </nav>
</body>
</html>