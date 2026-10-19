<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="card">
		<% if(request.getAttribute("errorMessage")!=null) { %>
			<p style="color: red; font-weight: bold;">
				<%= request.getAttribute("errorMessage") %>
			</p>
		<% } %>
		<form action="RegistrationServlet" method="post">
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" required>

			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

            <label for="confirmPassword">Confirm Password:</label>
			<input type="password" id="confirmPassword" name="confirmPassword" required>

            <label for="fullName">Full Name:</label>
			<input type="text" id="fullName" name="fullName" required>

            <label for="gpa">GPA:</label>
			<input type="text" id="gpa" name="gpa" required>

			<button type="submit">Register</button>
		</form>
	</div>
</body>
</html>