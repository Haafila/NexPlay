<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
    body {
        background: linear-gradient(135deg, #034ea2, #5e2390); /* Gradient background */
        color: #ffffff; /* White text for contrast */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        /*align-items: center;*/
        height: 100%;
        margin: 10px;
    }

    .form-container {
        background-color: #ffffff; /* White form background */
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.3); /*Shadow for depth */
        max-width: 700px;
        width: 100%;
        color: #5e2390; /* Purple text inside form */
    }

    h1 {
        color: #303a99; /* Dark purple heading */
        text-align: center;
        font-size: 32px;
        margin-bottom: 30px;
        font-weight: 600;
    }

    label {
        color: #8b0d88; /* Dark pink for labels */
        font-weight: 600;
        margin-top: 10px;
    }

    .form-control, .form-check-input, .form-control-file, select, textarea {
        background-color: rgba(240, 240, 240, 0.9); /* Light input background */
        border: 1px solid #5e2390;
        color: #303a99;
        border-radius: 10px; /* Rounded inputs */
        padding: 10px;
        margin-top: 10px;
    }

    .form-control:focus, .form-check-input:focus, .form-control-file:focus, select:focus, textarea:focus {
        border-color: #8b0d88;
        box-shadow: 0 0 10px rgba(139, 13, 136, 0.4); /* Soft glow effect */
    }

    .form-check-input {
        margin-top: 15px;
    }

    .form-check-label {
        margin-left: 8px;
        font-weight: 500;
        color: #5e2390;
    }

    .btn-secondary {
        background-color: #5e2390;
        border: none;
        border-radius: 30px;
        padding: 12px 20px;
        font-size: 16px;
        font-weight: bold;
        letter-spacing: 1px;
        transition: background-color 0.3s ease;
        display: block;
        width: 100%;
        margin-top: 20px;
        color: #ffffff; /* White button text */
    }

    .btn-secondary:hover {
        background-color: #8b0d88;
        box-shadow: 0px 5px 15px rgba(139, 13, 136, 0.4); /* Hover shadow */
    }

    /* File input label */
    input[type="file"]::file-selector-button {
        background-color: #5e2390;
        color: #ffffff;
        border: none;
        padding: 5px 10px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="file"]::file-selector-button:hover {
        background-color: #8b0d88;
    }
</style>
</head>
<body>

   <%
   
     int id = Integer.parseInt(request.getParameter("id")); 
   
     String gname =request.getParameter("name");
     
     double price = Double.parseDouble(request.getParameter("price"));
		
	 String genre = request.getParameter("genre");
	 
	 String date = request.getParameter("date");
	 
	 String des = request.getParameter("des");
	 
	 boolean multiplayer = Boolean.parseBoolean(request.getParameter("multi"));
	 
	 String icon = request.getParameter("icon");
	
   %>
   
   
   
<div class="form-container">
<form action="GameListServlet" method="post">
    <button type="submit" class="close-btn">&times;</button>
</form>
<h1>Update Game</h1>




<form action="${pageContext.request.contextPath}/Update" method="post" enctype="multipart/form-data">

  <div class="form-group">
    <label for="exampleInputEmail1">Game ID</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= id %>" name="id" readonly>
  </div>


  <div class="form-group">
    <label for="exampleInputEmail1">Game Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= gname %>" name="g_name">
  </div>
 
 <div class="form-group">
    <label for="exampleInputEmail1">Release Date</label>
    <input type="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%= date %>" name="releaseDate">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  step="0.01" min="0" value="<%= price %>" name="price">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect1">select genre</label>
    <select class="form-control" id="exampleFormControlSelect1" name="genre">
        <option value="Action" <%= genre.equals("Action") ? "selected" : "" %> >Action</option>
        <option value="Adventure" <%= genre.equals("Adventure") ? "selected" : "" %> >Adventure</option>
        <option value="Sport" <%= genre.equals("Sport") ? "selected" : "" %> >Sport</option>
        <option value="Puzzle" <%= genre.equals("Puzzle") ? "selected" : "" %> >Puzzle</option>
        <option value="Racing" <%= genre.equals("Racing") ? "selected" : "" %> >Racing</option>
        <option value="Shooter" <%= genre.equals("Shooter") ? "selected" : "" %> >Shooter</option>
    </select>
  </div>
  
  <img src="data:image/jpeg;base64,<%= icon %>" alt="Game Icon" style="width:150px;height:auto;"><br><br>
  
  <input type="hidden" name="current_icon" value="<%= icon %>">
  
  <div class="form-group">
    <label for="exampleFormControlFile1">Icon</label><br>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="icon">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Enter Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" cols="50" name="des"> <%= des %>  </textarea>
  </div>
  
  <label for="Multiplayer">Multiplayer</label>
  <div class="form-check">
    <input class="form-check-input" type="radio" id="exampleRadios1" name="multi" value="true"  <%= "true".equals(request.getParameter("multi")) ? "checked" : "" %>  >
    <label class="form-check-label" for="exampleRadios1">
    Yes
    </label>
  </div>
    <div class="form-check">
    <input class="form-check-input" type="radio"  id="exampleRadios2"  name="multi" value="false" <%= "false".equals(request.getParameter("multi")) ? "checked" : "" %> >
    <label class="form-check-label" for="exampleRadios2">
    No
  </label>
</div>
  
  <button type="submit" class="btn btn-secondary">UPDATE GAME</button>
</form>
</div>

</body>
</html>