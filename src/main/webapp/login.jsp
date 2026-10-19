<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card">
		<% if("true".equals(request.getParameter("registered"))){ %>
			<p style="color: green;"> Registration Successful!Please log in.</p>
		<% } %>

		<% if(request.getAttribute("errorMessage")!=null) { %>
			<p style="color: red; font-weight: bold;">
				<%= request.getAttribute("errorMessage") %>
			</p>
		<% } %>
		<form action="LoginServlet" method="post">
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" required>

			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

			<button type="submit">Log In</button>
		</form>
	</div>
</body>
</html>