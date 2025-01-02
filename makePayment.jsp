<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
	
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter output = response.getWriter();
	
    if (username == null) {
        
        output.println("<script type='text/javascript'>");
        output.println("alert('Please login before buying the game!');");
        output.println("window.location.href = 'login.jsp';");
        output.println("</script>");
        output.close();
        return;
    } 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make Payment</title>
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/custom_style.css" rel="stylesheet">

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Optional JavaScript validation -->
    <script>
        function validateForm() {
            const cardNumber = document.getElementById("cardNumber").value;
            const expireDate = document.getElementById("expireDate").value;
            const cvv = document.getElementById("cvv").value;

            const cardNumberPattern = /^\d{16}$/; // 16 digit card number
            const expireDatePattern = /^(0[1-9]|1[0-2])\/\d{2}$/; // MM/YY format
            const cvvPattern = /^\d{3}$/; // 3 digit CVV

            if (!cardNumberPattern.test(cardNumber)) {
                alert("Please enter a valid 16-digit card number.");
                return false;
            }

            if (!expireDatePattern.test(expireDate)) {
                alert("Please enter a valid expiration date in MM/YY format.");
                return false;
            }

            if (!cvvPattern.test(cvv)) {
                alert("Please enter a valid 3-digit CVV.");
                return false;
            }

            return true;
        }
    </script>

    <!-- Custom CSS for enhancing design -->
    <style>
        body {
            background-color: #c3b1e1;
        }
        .card {
            border: none;
            border-radius: 10px;
        }
        .card-header {
            background-color: #17a2b8;
            color: white;
            border-radius: 10px 10px 0 0;
            padding: 20px;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #28a745;
        }
        h3, h4 {
            font-weight: 600;
        }
        .lead {
            font-size: 1.1rem;
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
                        <a class="nav-link" href="#">Games</a>
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
                        <a class="nav-link" href="profile.jsp"><img src="images/profile_icon.png" title="Go to Profile"></a>
                    </li>
                    <li class="nav-item" style="margin-left: 250px">
                        <a class="nav-link" href="adminDashboard.jsp"><button type="button" class="btn btn-primary" style="background-color: #8b0d88; border: 1px solid white">Dashboard</button></a>
                    </li>
                </ul>
            </div>
        
        </div>
    </nav>
	<br>
    <div class="container">
        <div class="card shadow-lg" style="width:50%; margin-left:300px;">
            <div class="card-header text-center">
                <h3 class="mb-0">Make Payment</h3>
            </div>
            <div class="card-body">
                <%
                    // Get the game name and price from the URL parameters
                    String gameName = request.getParameter("gameName");
                    String price = request.getParameter("price");
                    System.out.println(gameName);
                    System.out.println(price);
                %>
                <div class="text-center mb-4">
                    <h4 class="mb-2">Purchase: <%= gameName %></h4>
                    <p class="lead">Price: $<%= price %></p>
                </div>

                <form action="SaveOrderServelet" method="post" onsubmit="return validateForm()">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="userName">Full Name</label>
                            <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your full name" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mobile">Mobile</label>
                            <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Enter your mobile number" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cardNumber">Card Number</label>
                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="Enter your 16-digit card number" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="expireDate">Expiration Date (MM/YY)</label>
                            <input type="text" class="form-control" id="expireDate" name="expireDate" placeholder="MM/YY" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cvv">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="Enter CVV" required>
                        </div>
                    </div>

                    <!-- Hidden fields to pass game details -->
                    <input type="hidden" name="gameName" value="<%= gameName %>">
                    <input type="hidden" name="price" value="<%= price %>"><br>

                    <button type="submit" class="btn btn-success btn-block">Pay</button>
                </form>
            </div>
        </div>
    </div><br>
	<!-- Footer -->
    <footer>
        <p>&copy; 2024  NexPlay. All  rights  reserved.</p>
        <a href="#">Privacy Policy</a> &nbsp;|&nbsp; <a href="#">Terms of Service</a>
    </footer>
</body>
</html>
