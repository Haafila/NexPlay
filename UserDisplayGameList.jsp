<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Game List</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

<style>
  body {
        
        background:  url('images/newbk2.jpg') center;
        background-size: cover;
        color: white;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        
    }

  img {
         max-height:150px;
    }

  .card-body {
         padding: 15px;
         text-align: center;
         background-color: #f4e3ff;
         height:250px;
  
    }

  .btn-primary {
        background-color: #8b0d88; /* Dark pink button */
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        width:150px;
    }

   .btn-primary:hover {
        background-color: #c00384; /* Darker pink on hover */
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.5);
    }
    
    .container {
    	padding:50px;
    }
    
   .card {
       
        margin: 40px;
        border: none;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3);
    }
    
    .card:hover{
        box-shadow: 0px 10px 30px rgba(225, 255, 255, 0.3);
    }
    
    #top {
        text-align:center;
        
    }

</style>



</head>
<body>

<%@ include file="header.jsp" %>



<div id="top" style="margin-top:100px;">
    
      <h1>NexPlay Games</h1>
      <p>Play, explore, and discover your next favorite game.</p>
    
</div>

<form method="get" action="UserGameListServlet" style="padding:0 50px;">
    <label for="genre">Filter by Genre:</label>
    <select name="genre" id="genre">
        <option value="">All</option>
        <option value="Action" >Action</option>
        <option value="Adventure" >Adventure</option>
        <option value="Puzzle" >Puzzle</option>
        <option value="Racing" >Racing</option>
        <option value="Sport" >Sport</option>
        <option value="Shooter" >Shooter</option>
    </select>
    <button type="submit">Filter</button>
</form>


<c:if test="${empty gamesList}">
    <p>No games found .</p>
</c:if>
<div>



</div>


<div class="container">
<div class="row">
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



  <c:url value="ViewGameDetails.jsp" var="G_View">
    <c:param name="id" value="${g_id}"/>
  </c:url>

 <div class="col-md-3">   
      <div class="card" style="width: 14rem;height:18rem;">
      <img class="card-img-top" src="data:image/jpeg;base64,${game.g_icon}" alt="${game.g_name}">
        <div class="card-body">
          <h5 class="card-title">${game.g_name}</h5>
          <p class="card-text">${game.genre}</p>
          <p class="card-text">${game.release_date}</p>
          <a href="${G_View}" class="btn btn-primary">View</a>
        </div>
      </div>
</div>
    
  
    
    <br>
     
</c:forEach>
</div>
</div>

<%@ include file="footer.jsp" %>


</body>
</html>
