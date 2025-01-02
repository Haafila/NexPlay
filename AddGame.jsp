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

    <script type="text/javascript">
        window.onload = function() {
            // Check if the server sent a signal that the game already exists
            var gameExists = '<%= request.getAttribute("gameExists") %>';
            
            if (gameExists === "true") {
            	
                alert("Game already exists. Please try adding a different game.");
                
            }
        }
    </script>




</head>
<body >
<div class="form-container">

      <form action="GameListServlet" method="post">
            <button type="submit" class="close-btn" aria-label="Close">&times;</button>
      </form>

 <h1>Add New Game</h1>
 
 <% if (request.getAttribute("gameExists") != null) { %>
    <div class="alert alert-danger">
        Game already exists. Please try adding a different game.
    </div>
<% } %>


 <% if (request.getAttribute("unsuccess") != null) { %>
    <div class="alert alert-danger">
        Unsuccessfull
    </div>
<% } %>
 
 <% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success">
        successfully inserted
    </div>
<% } %>
 
 
 
<form action="addGame" method="post" enctype="multipart/form-data">
 
  <div class="form-group">
    <label for="exampleInputEmail1">Game Name</label>
    <input type="text" class="form-control" id="gameName" aria-describedby="emailHelp" placeholder="Enter name" name="g_name">
  </div>
 
 <div class="form-group">
    <label for="exampleInputEmail1">Release Date</label>
    <input type="date" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="releaseDate">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter price" step="0.01" min="0" name="price">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlSelect1">Select Genre</label>
    <select class="form-control" id="exampleFormControlSelect1" name="genre">
      <option value="Action" >Action</option>
      <option value="Adventure" >Adventure</option>
      <option value="Sport" >Sport</option>
      <option value="Puzzle" >Puzzle</option>
      <option value="Racing" >Racing</option>
      <option value="Shooter" >Shooter</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlFile1">Icon</label><br>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="icon">
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Description</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" name="des"></textarea>
  </div>
  
  <label for="Multiplayer">Multiplayer</label>
  <div class="form-check">
    <input class="form-check-input" type="radio" id="exampleRadios1" name="multi" value="true" checked>
    <label class="form-check-label" for="exampleRadios1">
    Yes
    </label>
  </div>
    <div class="form-check">
    <input class="form-check-input" type="radio"  id="exampleRadios2"  name="multi" value="false">
    <label class="form-check-label" for="exampleRadios2">
    No
  </label>
</div>
  
  <button type="submit" class="btn btn-secondary" >ADD GAME</button>
</form>
</div>

</body>
</html>