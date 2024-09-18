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
 * Servlet implementation class Deletecust
 */
@WebServlet("/Deletecust")
public class Deletecust extends HttpServlet {
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
						PreparedStatement ps=con.prepareStatement("DELETE FROM `customer` WHERE cust_id='"+id+"'");
						int i=ps.executeUpdate();
						if(i>0)
						{
								System.out.println("user Delete Done");
								response.sendRedirect("viewUsers.jsp?dcustn=done");
						}
					else
					{
						System.out.println("Delete fails..!");
						response.sendRedirect("viewUsers.jsp?dcustf=fails");
					}
					
				} catch (Exception e)
				{
					System.out.println("Exc user reg"+e);
				}
		}

}
