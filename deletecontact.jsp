<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Contact</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
</head>
<body style="background-color: #bb86fc;">


<section class="contact container py-5" id="contact">
    <h1 class="heading text-center mb-4">Confirm Delete</h1>
    
    <%
        String cid = request.getParameter("cid");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String subject = request.getParameter("subject");
        String msg = request.getParameter("msg");
    %>

    <div class="row justify-content-center">
        <div class="col-lg-6">
            <form action="deletecontact" method="post" class="p-4 border rounded shadow">
                <div class="mb-3">
                    <label for="cid" class="form-label">Contact ID</label>
                    <input type="text" id="cid" class="form-control" name="cid" value="<%= cid != null ? cid : "" %>" readonly>
                </div>
                
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" class="form-control" name="name" value="<%= name != null ? name : "" %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" id="username" class="form-control" name="username" value="<%= username != null ? username : "" %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="subject" class="form-label">Subject</label>
                    <input type="text" id="subject" class="form-control" name="subject" value="<%= subject != null ? subject : "" %>" readonly>
                </div>

                <div class="mb-3">
                    <label for="msg" class="form-label">Message</label>
                    <textarea id="msg" class="form-control" name="msg" rows="5" readonly><%= msg != null ? msg : "" %></textarea>
                </div>

                <div class="d-grid gap-2">
                    <input type="submit" name="submit" value="Delete My Data" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this data?');">
                    <a href="index.jsp" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</section>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
