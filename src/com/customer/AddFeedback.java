package com.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.ConnectionProvider;

/**
 * Servlet implementation class AddFeedback
 */
@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {
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
			String feedback=request.getParameter("feedback");
			String id=request.getParameter("id");
			
			try 
			{
					PreparedStatement ps=con.prepareStatement("UPDATE complaint SET feedback='"+feedback+"' where id='"+id+"'");
					int i=ps.executeUpdate();
					if(i>0)
					{
							System.out.println("Feedback Add");
							response.sendRedirect("userSentComplaint.jsp?add=fd");
					}
					else
					{
						System.out.println("Feedback FAIL");
						response.sendRedirect("userSentComplaint.jsp?addf=fd");
					}
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
	}
}