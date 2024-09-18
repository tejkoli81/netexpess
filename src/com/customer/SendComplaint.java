package com.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.ConnectionProvider;

/**
 * Servlet implementation class SendComplaint
 */
@WebServlet("/SendComplaint")
public class SendComplaint extends HttpServlet {
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
			String subject=request.getParameter("subject");
			String about_complaints=request.getParameter("complaint");
			HttpSession session=request.getSession();
			String email = session.getAttribute("email").toString();
			
			String c_date=LocalDate.now().toString();
			
			try 
			{
					PreparedStatement ps=con.prepareStatement("INSERT INTO `complaint`(`subject`, `about_complaints`, `cmp_date`, `status`, `email`) VALUES ('"+subject+"','"+about_complaints+"','"+c_date+"','Not_Resolved','"+email+"')");
					int i=ps.executeUpdate();
					if(i>0)
					{
							System.out.println("Record Insert Done");
							response.sendRedirect("userSentComplaint.jsp?cmp=sent");
					}
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
	}
}