package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider 
{
	public static Connection getConnection()
	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/net_express", "root", "");
			return con;
		}
		catch (Exception e) 
		{
			System.out.println("Exception is " + e);
		}
		return con;
	}
}
