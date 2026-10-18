package com.example.studentportal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	private static final String URL="jdbc:mysql://localhost:3306/studentdb";
	private static final String USER="root";
	private static final String PASSWORD="vdg";
	
	private DBConnector() {}
	
	public static Connection getConnector() throws SQLException{
		return DriverManager.getConnection(URL,USER,PASSWORD);
	}
}
