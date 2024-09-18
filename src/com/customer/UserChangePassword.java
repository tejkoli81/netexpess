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
 * Servlet implementation class UserChangePassword
 */
@WebServlet("/UserChangePassword")
public class UserChangePassword extends HttpServlet {
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
			
			String c_password=request.getParameter("c_password");
			
			String n_password=request.getParameter("n_password");
			
				
			HttpSession session=request.getSession();
			String email=session.getAttribute("email").toString();
			try 
			{
					PreparedStatement ps=con.prepareStatement("Select * FROM `customer` WHERE email='"+email+"' AND password='"+c_password+"'");
					ResultSet rs =ps.executeQuery();
					if(rs.next())
					{
						PreparedStatement ps1 = con.prepareStatement("UPDATE `customer` SET `password`='"+n_password+"' WHERE email='"+email+"'");
						int r = ps1.executeUpdate();
						if(r>0)
						{
							System.out.println("Pass change");
							response.sendRedirect("userChangePassword.jsp?pwd=change");
						}
					}
					else
					{
						System.out.println("Password Fails..!");
						response.sendRedirect("userChangePassword.jsp?pwdf=fails");
					}
				
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
		}
	}
