<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>
    body {
        background-color: #5e2390;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    
    .confirm-box {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        text-align: center;
     }
    
    .button-container {
    display: flex;                     
    justify-content: center;    
    }

    .confirm-box h2 {
        color: #034ea2; 
        margin-bottom: 20px;
    }

    .confirm-box p {
        font-size: 16px;
        color: #303a99; 
        margin-bottom: 20px;
    }

    

    .btn-delete:hover {
        background-color: #8b0d88; 
    }
    
   
    .btn-cancel:hover {
        background-color: #5e2390; 
    }
</style>


</head>
<body>

   <%
   
     int id = Integer.parseInt(request.getParameter("id")); 
   
     String gname =request.getParameter("name");
     
   %>
   <div class="confirm-box">
   <h2>Delete Game</h2>
   
   <p>Do you want to delete <b><%= gname %></b> game <%= id %>.</p>
  
 <div class="button-container"> 
   <form action="Delete" method="post">
      <input type="hidden" name="id" value="<%= id %>">
      <input type="submit" name="Deletegame" class="btn btn-danger btn-sm" value="Delete" >
   </form>
 
   <form action="GameListServlet" method="post">
    <button type="submit" class="btn btn-primary btn-sm" aria-label="Close">Cancel</button>
   </form>
  </div>
</div>


</body>
</html>