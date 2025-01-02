<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.game.Game" %>
<%@ page import="com.game.GameDButil" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>

   body {
        background: url('images/newbk2.jpg') center;
        background-size: cover;
        color: black;
    }

    .container {
        margin-top: 50px;
        background-color: #f4e3ff;
        padding: 20px;
        border-radius: 8px;
        width:800px;
    }
    
    .game-details {
        text-align: center;
    }

    .game-details h2 {
        color: #c00384; /* Dark pink */
        font-size: 2em;
        margin-bottom: 20px;
    }

    .game-details img {
        width: 250px;
        height: 250px;
        border-radius: 8px;
        margin-bottom: 20px;
    }

    .game-details p {
        font-size: 1.2em;
        margin-bottom: 10px;
    }


</style>

</head>
<body>

<%
    // Get the game ID from the request
    String gameId = request.getParameter("id");
    System.out.println(gameId);

    Game game = GameDButil.getGame(gameId); 
    
    if (game == null) {
    	 System.out.println("Game not found.");
    }
    
    if (game != null) {
   	 //System.out.println("game found");
    request.setAttribute("game", game);
   }
   
%>

<div class="container">

            <form action="UserGameListServlet" method="post">
                <button type="submit" class="close-btn" aria-label="Close">&times;</button>
            </form>
            <div class="game-details">
            
                <h2>${game.g_name}</h2>
                <img src="data:image/jpeg;base64,${game.g_icon}" alt="${game.g_name}">
                <p><strong>Genre:</strong> ${game.genre}</p>
                <p><strong>Description:</strong> ${game.description}</p>
                <p><strong>Release Date:</strong> ${game.release_date}</p>
                <p ><strong>Price:</strong> $${game.price}</p>
                <p><strong>Multiplayer:</strong> ${game.multiplayer ? 'Yes' : 'No'}</p>
                
                <c:url value="makePayment.jsp" var="G_pay">
                   <c:param name="price" value="${game.price}"/>
                   <c:param name="gameName" value="${game.g_name}"/>
                 </c:url>

                
                
                <a href="${G_pay}" class="btn btn-info">Buy Now</a><br><br>
                <a href="#" class="btn btn-info">Play Now</a>
                
            </div>
        </div>

</body>
</html>