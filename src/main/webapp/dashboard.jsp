<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    String fullname = (String) session.getAttribute("fullname");
    Double gpa = (Double) session.getAttribute("gpa");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Portal - Dashboard</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Header Section -->
        <header class="dashboard-header">
            <h2>Welcome, <%= fullname != null ? fullname : username %>!</h2>
            <a href="LogoutServlet" class="btn-logout">Logout</a>
        </header>

        <!-- Student Details Card -->
        <div class="card">
            <h3>Profile Summary</h3>
            <table class="info-table">
                <tr>
                    <th>Username:</th>
                    <td><%= username %></td>
                </tr>
                <tr>
                    <th>Full Name:</th>
                    <td><%= fullname %></td>
                </tr>
                <tr>
                    <th>GPA:</th>
                    <td><%= gpa != null ? String.format("%.2f", gpa) : "N/A" %></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>