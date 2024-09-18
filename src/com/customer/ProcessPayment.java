package com.customer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;

import com.conn.ConnectionProvider;
import com.conn.GlobalFunction;

/**
 * Servlet implementation class ProcessPayment
 */
@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {
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
		
		HttpSession session=request.getSession();
		String p_id = session.getAttribute("p_id").toString();
		Map<String, String> planDetails = GlobalFunction.getPlanDetails(p_id);
		String net_amount=planDetails.get("net_amount");
		
		int no_days =Integer.parseInt(planDetails.get("validity"));
		String email = session.getAttribute("email").toString();
		Map<String, String> custDetails = GlobalFunction.getUserDetails(email);
		String id=custDetails.get("id");

		
		LocalDate currentDate = LocalDate.now();
        System.out.println("Current Date: " + currentDate);

        // Increase the number of days
        LocalDate newDate = currentDate.plusDays(no_days);
        System.out.println("New Date: " + newDate);
        String lastDate = newDate.toString();
		String dt = LocalDateTime.now().toString();
		String upi_id=request.getParameter("upi_id");
		String card_no=request.getParameter("card_number");
		String card_holder=request.getParameter("card_holder");
		//System.out.println(currentDate+" "+id+" "+p_id+" "+net_amount+upi_id+card_no+card_holder);
			
		try 
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO `bill`(`email`, `plan_id`, `recharg_date`, `last_date`,`net_amount`,`upi_id`,`card_no`,`card_holder`) VALUES ('"+email+"','"+p_id+"','"+currentDate+"','"+lastDate+"','"+net_amount+"','"+upi_id+"','"+card_no+"','"+card_holder+"')");
			//PreparedStatement ps1=con.prepareStatement("INSERT INTO `bills`(`bill_date`, `plan_id`, `c_id`,`upi_no`,`card_number`,`card_holder`) VALUES ('"+currentDate+"','"+p_id+"','"+id+"','"+upi_id+"','"+card_no+"','"+card_holder+"')");
			int i=ps.executeUpdate();
			//int j=ps1.executeUpdate();
			if( i>0)
			{
					System.out.println("Record Insert Done");
					response.sendRedirect("userViewHistory.jsp?pay=done");
			}
		
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
	}
}
