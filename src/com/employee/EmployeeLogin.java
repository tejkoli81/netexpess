package com.employee;

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
 * Servlet implementation class EmployeeLogin
 */
@WebServlet("/EmployeeLogin")
public class EmployeeLogin extends HttpServlet {
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
		String emp_type= request.getParameter("emp_type");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String page_name="srEnggHome.jsp";
		
		if(emp_type.equals("Employee"))
		{
			page_name="employeeHome.jsp";
		}
		try 
		{
			
			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `employee` where e_email='"+ email + "' AND e_pwd='" + password + "' AND emp_type='"+emp_type+"'");
			System.out.println("PS 1 "+ps1);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("name", rs.getString("e_name"));
				session.setAttribute("email", rs.getString("e_email"));
				session.setAttribute("emp_type", rs.getString("emp_type"));
				System.out.println("Emai "+rs.getString("e_email"));
				session.setAttribute("user_type", rs.getString("emp_type"));
				System.out.println("Login Done");
				response.sendRedirect(page_name+"?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("employeeLogin.jsp?loginf=fail");
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}

}
