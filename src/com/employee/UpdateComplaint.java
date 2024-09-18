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
 * Servlet implementation class UpdateComplaint
 */
@WebServlet("/UpdateComplaint")
public class UpdateComplaint extends HttpServlet {
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
	
		String id= request.getParameter("id");
		String trobleshot= request.getParameter("trobleshot");
		
		HttpSession session=request.getSession();
		String email = session.getAttribute("email").toString();
		System.out.println("1");
		
		String emp_type = session.getAttribute("emp_type").toString();
		
System.out.println("2");
		try 
		{
			PreparedStatement ps1 = con.prepareStatement("UPDATE `complaint` SET `status`='Resolved',troubleshoot='"+trobleshot+"',solved_by='"+email+"' WHERE id='"+id+"'");
			int rs = ps1.executeUpdate();
			if (rs>0) 
			{
				
				if(emp_type.equals("Employee"))
				{
					System.out.println("Update Complaint ");
					response.sendRedirect("emapVNewComplaints.jsp?update=done");
				}else
				{

					response.sendRedirect("newComplaints.jsp?update=done");
				}
			}
			else 
			{
				if(emp_type.equals("Employee"))
				{
					System.out.println("Update fail");
					response.sendRedirect("emapVNewComplaints.jsp?fail=update");
				}else
				{
					response.sendRedirect("newComplaints.jsp?fail=update");
				}
			}
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}

	}

}
