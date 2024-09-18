package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.ConnectionProvider;

/**
 * Servlet implementation class AddCustomer
 */
@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
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
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String full_name=fname+" "+lname;
		String gender=request.getParameter("gender");
		String mobile=request.getParameter("contact");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy"); 
		LocalDateTime now = LocalDateTime.now();  
		String c_date=dtf.format(now);
		System.out.println("Current Date and Time: "+c_date);
		
		try 
		{
			PreparedStatement ps2=con.prepareStatement("select * from `customer` where cust_email='"+email+"'");
			ResultSet rs=ps2.executeQuery();
			if(!rs.next())
			{
				PreparedStatement ps=con.prepareStatement("INSERT INTO `customer`(`cust_name`, `lname`, `gender`, `cust_ph`, `cust_addr`, `cust_email`, `cust_pwd`) VALUES ('"+fname+"','"+lname+"','"+gender+"','"+mobile+"','"+ address+"','"+email+"','"+password+"')");
				int i=ps.executeUpdate();
				if(i>0)
				{
						System.out.println("Record Insert Done");
						response.sendRedirect("adminHome.jsp?reg=done");
				}
			}
			else
			{
				System.out.println("Email,ID Already Exist..!");
				response.sendRedirect("adminHome.jsp?email=exist");
			}
			
		} catch (Exception e)
		{
			System.out.println("Exc user reg"+e);
		}
	}

}
