<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
    <link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/custom_style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/custom_blog.css"> 
</head>
<body class="bg-dark text-light">
	
	<%@ include file="header.jsp" %>

    <!-- Blog Header -->
    <header class="text-center py-5">
        <h1 class="text-primary">Gaming News and Updates</h1>
        <p class="lead text-info">Stay up-to-date with the latest trends in the gaming world.</p>
    </header>

    <!-- Blog Posts Section -->
    <section class="container my-5">
        <div class="row">

            <div class="col-md-4 mb-4">
                <div class="card text-light border border-primary shadow-sm">
                    <img src="images/game-news1.webp" class="card-img-top" alt="Game News">
                    <div class="card-body">
                        <h5 class="card-title text-pink">Top 5 Racing Games of 2024</h5>
                        <p class="card-text">Discover the latest and most exciting racing games of the year, offering fast-paced action and immersive gameplay.</p>
                        <a href="https://www.pcmag.com/picks/best-pc-racing-games" target="_blank" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card text-light border border-primary shadow-sm">
                    <img src="images/game-news2.webp" class="card-img-top" alt="Game Update">
                    <div class="card-body">
                        <h5 class="card-title text-pink">FPS Gaming Tournaments in 2024</h5>
                        <p class="card-text">Get ready for some of the biggest FPS tournaments coming up this year, featuring pro teams and high-stakes gameplay.</p>
                        <a href="https://escharts.com/upcoming-tournaments" target="_blank" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card text-light border border-primary shadow-sm">
                    <img src="images/game-news3.jpg" class="card-img-top" alt="Game Launch">
                    <div class="card-body">
                        <h5 class="card-title text-pink">Upcoming Action-Adventure Titles</h5>
                        <p class="card-text">Explore the world of action-adventure games, with new releases that will push the boundaries of exploration and storytelling.</p>
                        <a href="https://www.metacritic.com/browse/game/all/action-adventure/" target="_blank" class="btn btn-primary">Read More</a>
                    </div>
                </div>
            </div>

        </div>

        
        <nav aria-label="Page navigation example" class="text-center">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link bg-primary text-light" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link bg-primary text-light" href="#">1</a></li>
                <li class="page-item"><a class="page-link bg-primary text-light" href="#">2</a></li>
                <li class="page-item"><a class="page-link bg-primary text-light" href="#">3</a></li>
                <li class="page-item"><a class="page-link bg-primary text-light" href="#">Next</a></li>
            </ul>
        </nav>

    </section>

    <%@ include file="footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
