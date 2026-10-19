<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="card">
		<h2>Student Portal Login</h2>
		
		<% if ("true".equals(request.getParameter("registered"))) { %>
			<div class="alert-success">Registration Successful! Please log in.</div>
		<% } %>

		<% if (request.getAttribute("errorMessage") != null) { %>
			<div class="alert-error"><%= request.getAttribute("errorMessage") %></div>
		<% } %>

		<form action="LoginServlet" method="post">
			<div class="form-group">
				<label for="username">Username:</label>
				<input type="text" id="username" name="username" required>
			</div>

			<div class="form-group">
				<label for="password">Password:</label>
				<input type="password" id="password" name="password" required>
			</div>

			<button type="submit">Log In</button>
		</form>
		<p>Don't have an account? <a href="register.jsp" >Register here</a></p>
	</div>
</body>
</html>