<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="card">
		<h2>Student Registration</h2>

		<% if (request.getAttribute("errorMessage") != null) { %>
			<div class="alert-error"><%= request.getAttribute("errorMessage") %></div>
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
			
			<label for="major">Major:</label>
			<input type="text" id="major" name="major" required>

			<button type="submit">Register</button>
		</form>
		
		<p>Already have an account? <a href="login.jsp">Login here</a></p>
	</div>
</body>
</html>