package com.example.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query="SELECT * FROM studentdb WHERE username=? AND password=?";
		String username=(String) request.getAttribute("username");
		String password=(String) request.getAttribute("password");
		
		try(Connection conn=DBConnector.getConnector()){
			PreparedStatement pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				HttpSession session=request.getSession();
				
				session.setAttribute("username", username);
				session.setAttribute("fullname", rs.getString("fullname"));
				session.setAttribute("gpa", rs.getDouble("gpa"));
				
				response.sendRedirect("dashboard.jsp");
			} else {
				request.setAttribute("errorMessage","Invalid username or password");
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,"Database connection error");
		}
	}

}
