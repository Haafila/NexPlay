<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Retrieve the username from the session
    String username = (String) session.getAttribute("username");

    // Check if the username is available
    if (username == null) {
        username = ""; // Default value if not found
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Service</title>
    
   	<link href="css/custom_style.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/contactUs.css" rel="stylesheet">
	<script>
        function showAlert(name) {
            alert("Hey, " + name + "! Thank you for submitting your message.");
        }

        function handleFormSubmission(event) {
            const name = document.querySelector('input[name="name"]').value;
            showAlert(name);
            return true;
        }
    </script>
    <style>
        
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>

    <main class="container mt-5">
        <section class="service text-center">
            <h2>Customer Service Solutions</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card bg-dark text-light mb-4">
                        <div class="card-body">
                            <h4>VIP PLAYER SUPPORT</h4>
                            <p>Providing dedicated support for our most important players, boosting loyalty and retention.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-dark text-light mb-4">
                        <div class="card-body">
                            <h4>COMMUNITY MANAGEMENT</h4>
                            <p>Our community managers create a positive, safe environment for customer engagement.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-dark text-light mb-4">
                        <div class="card-body">
                            <h4>PLAYER SUPPORT</h4>
                            <p>24/7 assistance with technical issues, account management, and in-game challenges.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <section class="contact-card-section text-center">
        <div class="custom-container container">
            <div class="custom-card">
                <div class="custom-card-header">
                    <h4>NexPlay Contact Information</h4>
                </div>
                <div class="custom-card-body">
                    <p class="custom-card-text">
                        <strong>Email:</strong> support@gamingwebsite.com <br>
                        <strong>Phone:</strong> +123 456 7890 <br>
                        <strong>Live Chat:</strong> Available 24/7
                    </p>
                    <p class="custom-card-text">For urgent issues, reach out using any of the methods above.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="contact" id="contact">
        <h1>Contact Us</h1>

        <div class="row d-flex justify-content-center align-items-center">

            <!-- Contact Form -->
            <div class="col-lg-6 col-md-6">
                <form action="ContactServlet" method="post" onsubmit="handleFormSubmission(event)">
                    <div class="inputBox mb-3">
                        <input type="text" class="form-control mb-2" placeholder="Name" name="name" required>
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                    </div>
                    <div class="inputBox mb-3">
                        <input type="text" class="form-control" placeholder="Subject" name="subject" required>
                    </div>
                    <div class="inputBox mb-3">
                        <textarea class="form-control" placeholder="Message" name="msg" rows="5" required></textarea>
                    </div>
                    <input type="submit" class="btn" value="Send Message" style="background-color:pink;">
                </form>
            </div>
        </div>
    </section>
    
	<%@ include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
</body>
</html>
