<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game List</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        
    
        body {
        background:url('images/bg2.2.jpeg')  center;
        background-size: cover;
        color: #ffffff; /* White text for contrast */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100%;
        }
        .game-icon {
            width: 100px;
            height: auto;
            max-height:100px;
            border-radius: 10px;
        }
        .table-container {
            margin: 20px auto;
            max-width: 90%;
        }
        .action-btns {
            display: flex;
            gap: 7px;
            
        }
        .action-btns input {
            width: 100px;
        }
        /* Table styles */
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #c00384; /* Dark Pink for border */
            vertical-align: middle; /* Aligns content vertically in the middle */
        }
        td a {
            display: inline-block;
            height: 100%;
            vertical-align: middle;
        }
        .btn {
            padding: 5px 10px;  /* Adjust button padding */
            margin: 5px 0;
        }
        
        tr {
            display: table-row;
            height: 100%;
        }
        
        #top {
            text-align: center;
            padding:30px;
        }
        
    </style>
    
    
    <script type="text/javascript">
        window.onload = function() {
            // Check if the server sent a signal that the game already exists
            var success = '<%= request.getAttribute("IsSuccess") %>';
            
            if (success === "true") {
            	
                alert("Successfully Updated");
                
            }
        }
    </script>
    
  
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container table-container">
    <c:if test="${empty gamesList}">
        <div class="alert alert-warning text-center" role="alert">
            No games found.
        </div>
    </c:if>
    
    <div id="top">
      <h1> Game Management </h1>
    </div>
    
    
    
  <form action="AddGame.jsp" method="post">
    <input type="submit" value="Add Game">
  </form>
    
    
    
    

    <c:if test="${not empty gamesList}">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Icon</th>
                    <th>Game Name</th>
                    <th>Genre</th>
                    <th>Description</th>
                    <th>Release_Date</th>
                    <th>Price</th>
                    <th>Multiplayer</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="game" items="${gamesList}">
                    <c:set var="g_id" value="${game.game_id}"/>
                    <c:set var="g_name" value="${game.g_name}"/>
                    <c:set var="genre" value="${game.genre}"/>
                    <c:set var="description" value="${game.description}"/>
                    <c:set var="release_date" value="${game.release_date}"/>
                    <c:set var="price" value="${game.price}"/>
                    <c:set var="multiplayer" value="${game.multiplayer}"/>
                    <c:set var="g_icon" value="${game.g_icon}"/>
                    <c:set var="encodedIcon" value="${fn:substring(fn:replace(g_icon, 'data:image/jpeg;base64,', ''), 0, 5000)}"/>

                    <tr>
                        <td>
                            <img src="data:image/jpeg;base64,${game.g_icon}" alt="${game.g_name}" class="game-icon">
                        </td>
                        <td>${g_name}</td>
                        <td>${genre}</td>
                        <td>${description}</td>
                        <td>${release_date}</td>
                        <td>$${price}</td>
                        <td>${multiplayer ? 'Yes' : 'No'}</td>
                        <td class="action-btns" style="padding:40px 8px">
                            <c:url value="UpdateGame.jsp" var="G_Update">
                                <c:param name="id" value="${g_id}"/>
                                
                                <c:param name="name" value="${g_name}"/>
                                <c:param name="genre" value="${genre}"/>
                                <c:param name="des" value="${description}"/>
                                <c:param name="date" value="${release_date}"/>
                                <c:param name="price" value="${price}"/>
                                <c:param name="multi" value="${multiplayer}"/>
                                <c:param name="icon" value="${encodedIcon}"/> 
                            </c:url>
                            <a href="${G_Update}" class="btn btn-primary btn-sm">Update</a>
                            
                            <c:url value="DeleteGame.jsp" var="G_Delete">
                                <c:param name="id" value="${g_id}"/>
                                <c:param name="name" value="${g_name}"/>
                            </c:url>
                            <a href="${G_Delete}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>


