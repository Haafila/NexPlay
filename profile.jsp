<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="icon" type="image/x-icon" href="images/cropped.jpeg">
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom_style.css" rel="stylesheet">
    <link href="css/custom_profile.css" rel="stylesheet">
</head>
<body>

    <%@ include file="header.jsp" %>

    <!-- Profile Content -->
    <c:if test="${not empty userDetails}">
        <c:forEach var="user" items="${userDetails}">

            <c:set var="userid" value="${user.userid}" />
            <c:set var="name" value="${user.name}" />
            <c:set var="email" value="${user.email}" />
            <c:set var="favGenre" value="${user.favGenre}" />
            <c:set var="bio" value="${user.bio}" />
            <c:set var="dob" value="${user.dob}" />
            <c:set var="username" value="${user.username}" />
            <c:set var="password" value="${user.password}" />
            <c:set var="createdAt" value="${user.createdAt}" />

            <!-- Profile Container -->
            <div class="container py-5">
                <div class="card shadow-lg p-4">
                    <div class="container py-4" style="background-color:#310053; border-radius:20px; border:2px solid white;">
                        <h1 class="text-center">Hello, ${user.username}!</h1>
                    </div><br>

                    <!-- Profile Section -->
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <div class="profile-img">
                                <img src="images/avatar.jpeg" alt="Profile Image" class="img-fluid" width="150">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <h2>Bio</h2>
                            <p>${user.bio}</p>
                        </div>
                    </div>

                    <hr>

                    <!-- About Section -->
                    <h1>About</h1>
                    <div class="table-responsive mb-4">
                        <table style="background-color: #cbc3e3">
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td>${user.name}</td>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <td>${user.email}</td>
                                </tr>
                                <tr>
                                    <th>Date of Birth</th>
                                    <td>${user.dob}</td>
                                </tr>
                                <tr>
                                    <th>Favourite Game Genre</th>
                                    <td>${user.favGenre}</td>
                                </tr>
                                <tr>
                                    <th>Account Created</th>
                                    <td>${user.createdAt}</td>
                                </tr>
                                <tr>
                                    <th>Username</th>
                                    <td>${user.username}</td>
                                </tr>
                                <tr>
                                    <th>Password</th>
                                    <td>${user.password}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${empty userDetails}">
        <script>
            alert("Login to view this page");
            window.location.href = 'login.jsp';
        </script>
    </c:if>

    <!-- Update Profile Button -->
    <c:url value="userUpdate.jsp" var="userUpdate">
        <c:param name="userid" value="${userid}" />
        <c:param name="name" value="${name}" />
        <c:param name="email" value="${email}" />
        <c:param name="favGenre" value="${favGenre}" />
        <c:param name="bio" value="${bio}" />
        <c:param name="dob" value="${dob}" />
        <c:param name="username" value="${username}" />
        <c:param name="password" value="${password}" />
        <c:param name="createdAt" value="${createdAt}" />
    </c:url>

    <div class="container py-5" style="width: 70%; padding:30px;">
        <div class="d-flex justify-content-between">
            <!-- Update Profile Button -->
            <a href="${userUpdate}" class="btn btn-primary" style="background-color:#5e2390; border-color:#5e2390; width:30%; border:3px solid white;">
                Update Profile
            </a>

            <!-- Delete Account Button -->
            <form method="POST" action="UserDeleteServlet" onsubmit="confirmDelete()" style="width:30%;">
                <button type="submit" name="delete" class="btn btn-danger" style="width:100%; border:3px solid white;">
                    Delete My Account
                </button>
            </form>

            <!-- Logout Button -->
            <form method="GET" action="LogoutServlet" style="width:30%;">
                <button type="submit" name="logout" class="btn btn-secondary" style="background-color:#ff69b4; border-color:#ff69b4; color:white; width:100%; border:3px solid white;">
                    Logout
                </button>
            </form>
        </div>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete your account?");
        }
    </script>

    <%@ include file="footer.jsp" %>

    <script src="js/formValidate.js"></script>
</body>
</html>
