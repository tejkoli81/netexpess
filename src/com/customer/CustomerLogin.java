package com.customer;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.ConnectionProvider;


/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;
	
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `customer` where cust_email='"+ email + "' AND cust_pwd='" + password + "'");
			System.out.println("PS 1 "+ps1);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("email", rs.getString("cust_email"));
				System.out.println("Emai "+rs.getString("cust_email"));
				session.setAttribute("user_type", "User");
				System.out.println("Login Done");
				response.sendRedirect("userHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("userLogin.jsp?loginf=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}

}
