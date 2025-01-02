<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Info</title>
    <link rel="stylesheet" href="css/contact.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
	
      <style>
       
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h1.ci {
            color: #6a0dad;
            font-size: 28px;
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #f0e5ff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #6a0dad;
            color: white;
        }

        td {
            color: #333;
        }

        tbody tr:hover {
            background-color: #d1b3ff;
        }

        input[type="button"] {
            display: inline-block;
            width: 160px;
            margin: 20px 10px;
            padding: 10px 20px;
            background-color: #6a0dad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="button"]:hover {
            background-color: #5e0bb8;
        }

        @media screen and (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
                font-size: 14px;
            }

            input[type="button"] {
                width: 100%;
            }
        }

        .error {
            color: red;
            text-align: center;
            margin: 10px 0;
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <h1 class="ci">Contact Information</h1>

    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Username</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="con" items="${contactDetails}">
                <tr>
                    <td>${con.cid}</td>
                    <td>${con.name}</td>
                    <td>${con.username}</td>
                    <td>${con.subject}</td>
                    <td>${con.msg}</td>
                    <td>
                        <!-- Update button -->
                        <c:url value="updatecontact.jsp" var="conUpdate">
                            <c:param name="cid" value="${con.cid}"/>
                            <c:param name="name" value="${con.name}"/>
                            <c:param name="username" value="${con.username}"/>
                            <c:param name="subject" value="${con.subject}"/>
                            <c:param name="msg" value="${con.msg}"/>
                        </c:url>
                        <a href="${conUpdate}">
                            <input type="button" name="update" value="Update My Data">
                        </a>

                        <!-- Delete button -->
                        <c:url value="deletecontact.jsp" var="conDelete">
                            <c:param name="cid" value="${con.cid}"/>
                            <c:param name="username" value="${con.username}"/>
                            <c:param name="subject" value="${con.subject}"/>
                            <c:param name="msg" value="${con.msg}"/>
                            <c:param name="name" value="${con.name}"/>
                        </c:url>
                        <a href="${conDelete}">
                            <input type="button" name="delete" value="Delete My Data">
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>