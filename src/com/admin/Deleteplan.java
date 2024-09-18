package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.ConnectionProvider;

/**
 * Servlet implementation class Deleteplan
 */
@WebServlet("/Deleteplan")
public class Deleteplan extends HttpServlet {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			
			String id=request.getParameter("id");
			
			try 
			{
					PreparedStatement ps=con.prepareStatement("DELETE FROM `plan` WHERE id='"+id+"'");
					int i=ps.executeUpdate();
					if(i>0)
					{
							System.out.println("Plan Delete Done");
							response.sendRedirect("adminViewPlan.jsp?dplan=done");
					}
				else
				{
					System.out.println("Delete fails..!");
					response.sendRedirect("adminViewPlan.jsp?dplanf=fails");
				}
				
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
	}
}
