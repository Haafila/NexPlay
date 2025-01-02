<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.user.DBConnect"%>
<%@ page import="java.io.PrintWriter" %>

<%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
	
	response.setContentType("text/html;charset=UTF-8");
	PrintWriter output = response.getWriter();
	
    if (username == null || !"admin".equals(username)) {
        
        output.println("<script type='text/javascript'>");
        output.println("alert('Please login before viewing this page!');");
        output.println("window.location.href = 'login.jsp';");
        output.println("</script>");
        output.close();
        return;
    } 
%>
<%
    Connection con = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Management</title>
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/custom_style.css" rel="stylesheet">
    <style>
    	body{
    		background-color: #c3b1e1;
    	}
        .table {
            margin-top: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }
        .badge-confirmed {
            background-color: #28a745;
        }
        .badge-pending {
            background-color: #ffc107;
        }
        h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Payment Management</h1>

        <table class="table table-hover table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Game Name</th>
                    <th>Price</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>User Name</th>
                    <th>Purchase Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        con = DBConnect.getConnection();
                        String sql = "SELECT * FROM `order`";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
 
                        while (rs.next()) { 
                            String orderId = rs.getString(1); // Assuming orderId is the first column
                            String purchaseDate = rs.getString(8);
                            int status = rs.getInt(7); 
                            
                %>
                <tr>
                    <td><%=rs.getString(2)%></td>
                    <td>$<%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=purchaseDate%></td>
                    <td>
                        <%
                            if (status == 1) { // Pending status
                        %>
                            <span class="badge badge-pending">Pending</span>
                        <%
                            } else if (status == 2) { // Confirmed status
                        %>
                            <span class="badge badge-confirmed">Confirmed</span>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <div class="d-flex">
                            <%
                                if (status == 1) { // If status is pending, show the Confirm button
                            %>
                                <form action="UpdateStatusServlet" method="POST" class="mr-2">
                                    <input type="hidden" name="orderId" value="<%=orderId%>"> <!-- Order ID -->
                                    <button type="submit" class="btn btn-warning btn-sm">
                                        Confirm
                                    </button>
                                </form>
                            <%
                                }
                            %>
                            <a href="deleteOrder.jsp?id=<%=orderId%>" class="btn btn-danger btn-sm">Remove</a>
                        </div>
                    </td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
