<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            background-image: url('images/bg10.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Navbar */
        .navbar {
            background-color: #5e2390; 
            height: 80px; 
           
        }

        .navbar .nav-link {
            color: white !important;
        }

        .navbar .nav-link:hover {
            color: #ff69b4 !important;
        }

        /* Logo Style......................................... */
        .navbar-brand img {
            height: 150px; 
            width: 150px; 
            border-radius: 50%; 
            position: relative;
            top: 50px; 
            left: -100px; 
            border: 5px solid white; 
        }
        
        .navbar-brand img:hover{
        box-shadow: 7px 6px 2px rgba(0,0,0,0.5);
        }

        .nav-link img{
            width:85%;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.1));
            background-size: cover;
            height: 100vh;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .hero h1 {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .hero .btn-custom {
            background-color: #ff69b4; 
            color: white;
            padding: 10px 30px;
            border-radius: 30px;
            border:3px solid white; 
        }

        .hero .btn-custom:hover {
            background-color: #db3a83; 
            box-shadow: 7px 6px 2px rgba(0,0,0,0.3);
        }

        /* Info Section */
        .info-section {
        	color:white;
            padding: 60px 0;
            background-image: linear-gradient(#4c008250,#4c0082); 
        }

        .info-section h2 {
        	font-weight:bolder;
            text-align: center;
            margin-bottom: 40px;
        }

        .info-section .col-md-4 {
            text-align: center;
            padding: 20px;
        }

        /* Footer */
        footer {
            background-color: #4b0082;
            color: white;
            padding: 20px;
            text-align: center;
        }

        footer a {
            color: #ff69b4;
            text-decoration: none;
        }

        footer a:hover {
            color: white;
        }
    </style>
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
                        <a class="nav-link" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="blog.jsp">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
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

    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome  to  NexPlay</h1>
        <p>Enjoy the best gaming experience with us!</p>
        <a href="#" class="btn btn-custom">Get Started</a>
    </div>

    <!-- Info Section -->
    <div class="info-section">
        <div class="container">
            <h2>Why Play With Us?</h2>
            <div class="row">
                <div class="col-md-4">
                    <h4>Top Games</h4>
                    <p>We offer a diverse collection of top-rated games for all genres.</p>
                </div>
                <div class="col-md-4">
                    <h4>Vibrant Community</h4>
                    <p>Connect with thousands of players in our engaging online community.</p>
                </div>
                <div class="col-md-4">
                    <h4>24/7 Support</h4>
                    <p>Our team is here to support you around the clock, any day of the week.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024  NexPlay. All  rights  reserved.</p>
        <a href="#">Privacy Policy</a> &nbsp;|&nbsp; <a href="#">Terms of Service</a>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
   
</body>
</html>