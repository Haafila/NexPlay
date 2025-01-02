<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	int userCount = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Management</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/custom_style.css" rel="stylesheet">
    <style>
    	body{
    		background-color: #be93d4;
    	}
        .table {
        	font-size:0.9em;
            margin-top: 30px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .badge-confirmed {
            background-color: green;
        }
        .badge-pending {
            background-color: grey;
        }
        h1 {
        	color:#311432;
            font-size: 2.5rem;
            font-weight: bolder;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container mt-5">
        <h1 class="text-center mb-4">User Management</h1>

        <table class="table table-hover table-striped table-bordered" style="border: 1px solid #710193">
            <thead class="thead-dark">
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Favourite Genre</th>
                    <th>DoB</th>
                    <th>UserName</th>
                    <th>Password</th>
                    <th>Created At</th>
                    <th>Active Status</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        con = DBConnect.getConnection();
                        String sql = "SELECT * FROM `User`";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
 
                        while (rs.next()) { 
                        	++userCount;
                            int userid = rs.getInt(1); 
                            int status = rs.getInt(10); 
                            
                %>
                <tr>
                	<td><%=userid%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td>
                        <%
                            if (status == 1) { 
                        %>
                            <span class="badge badge-confirmed">Active</span>
                        <%
                            } else if (status == 0) { 
                        %>
                            <span class="badge badge-pending">Inactive</span>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/UpdateUserStatusServlet" method="POST">
		                    <input type="hidden" name="userid" value="<%=userid%>">
		                    <input type="hidden" name="newStatus" value="<%= (status == 1) ? 0 : 1 %>">
		                    <button type="submit" class="btn <%= (status == 1) ? "btn-danger" : "btn-success" %>">
		                        <%= (status == 1) ? "Deactivate" : "Activate" %>
		                    </button>
		                </form>
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
        <h3>Total No of User Accounts: <%= userCount %></h3>
        
    </div>
    <%@ include file="footer.jsp" %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
