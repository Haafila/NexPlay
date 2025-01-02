<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Contact</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
  </head>
  <body style="background-color: #bb86fc;">

    <section class="container mt-5" id="contact">
      <h1 class="text-center mb-4">Update Contact Information</h1>

      <div class="row justify-content-center">
        <div class="col-md-8">
          <form action="contactupdate" method="post">
            <div class="form-group mb-3">
              <label for="cid">Contact ID</label>
              <input type="text" class="form-control" id="cid" name="cid" value="<%= request.getParameter("cid") %>" readonly>
            </div>

            <div class="form-group mb-3">
              <label for="name">Name</label>
              <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name" value="<%= request.getParameter("name") %>">
            </div>

            <div class="form-group mb-3">
              <label for="username">Username</label>
              <input type="text" class="form-control" id="username" placeholder="Enter your username" name="username" value="<%= request.getParameter("username") %>">
            </div>

            <div class="form-group mb-3">
              <label for="subject">Subject</label>
              <input type="text" class="form-control" id="subject" placeholder="Enter the subject" name="subject" value="<%= request.getParameter("subject") %>">
            </div>

            <div class="form-group mb-4">
              <label for="msg">Message</label>
              <textarea class="form-control" id="msg" name="msg" rows="5" placeholder="Enter your message"><%= request.getParameter("msg") %></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update Data</button>
          </form>

          <!-- Display error message if any -->
          <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger mt-3" role="alert">
              <%= request.getAttribute("errorMessage") %>
            </div>
          <% } %>
        </div>
      </div>
    </section>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
