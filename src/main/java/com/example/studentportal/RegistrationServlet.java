package com.example.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String username=request.getParameter("username");
    	String password=request.getParameter("password");
    	String confirmPassword=request.getParameter("confirmPassword");
    	String fullName=request.getParameter("fullName");
    	String gpaStr=request.getParameter("gpa");
    	
    	if(password==null || !password.equals(confirmPassword)) {
    		request.setAttribute("errorMessage", "Passwords do not match.");
    		request.getRequestDispatcher("register.jsp").forward(request, response);
    		return;
    	}
    	
    	double gpa;
    	try {
    		gpa=Double.parseDouble(gpaStr);
    	} catch (NumberFormatException nfe) {
    		nfe.printStackTrace();
    		request.setAttribute("errorMessage", "Invalid GPA value. Please enter a valid number.");
    		request.getRequestDispatcher("register.jsp").forward(request, response);
    		return;
    	}
    	
    	String query="INSERT INTO studentdb(username,password,fullname,gpa) VALUES(?,?,?,?)";
    	
    	try(Connection conn=DBConnector.getConnector();
    		PreparedStatement pstmt=conn.prepareStatement(query);){
    		pstmt.setString(1, username);
    		pstmt.setString(2, password);
    		pstmt.setString(3, fullName);
    		pstmt.setDouble(4, gpa);
    		
    		int row=pstmt.executeUpdate();
    		if(row>0) {
    			response.sendRedirect("login.jsp?registered=true");
    		} else {
    			request.setAttribute("errorMessage", "Registration failed. Please try agian later.");
    			request.getRequestDispatcher("register.jsp").forward(request, response);
    		}
    	} catch (SQLException e) {
    		e.printStackTrace();
    		if("23000".equals(e.getSQLState())) {
    			request.setAttribute("errorMessage", "Username already exists. Please choose another.");
    			request.getRequestDispatcher("register.jsp").forward(request, response);
    		} else {
    			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,"Database connection error.");
    		}
    	}
	}

}
