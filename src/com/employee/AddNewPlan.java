package com.employee;

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
 * Servlet implementation class AddNewPlan
 */
@WebServlet("/AddNewPlan")
public class AddNewPlan extends HttpServlet {
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
			String plan_name=request.getParameter("plan_name");
			String data_transfer=request.getParameter("data_transfer");
			String hours=request.getParameter("hours");
			String validity=request.getParameter("validity");
			String plan_package=request.getParameter("package");
			String net_amount=request.getParameter("net_amount");
			
			String sql="INSERT INTO `plan`(`plan_name`, `data_transfer`, `hours`, `validity`, `package_cost`, `net_amount`) VALUES ('"+plan_name+"','"+data_transfer+"','"+hours+"','"+validity+"','"+plan_package+"','"+net_amount+"')";
			String op=request.getParameter("op");
			String page_name="empViewPlans.jsp?plan=add";
			if(op.equals("e"))
			{
				String id=request.getParameter("id");
				sql="UPDATE `plan` SET `plan_name`='"+plan_name+"',`data_transfer`='"+data_transfer+"',`hours`='"+hours+"',`validity`='"+validity+"',`package_cost`='"+plan_package+"',`net_amount`='"+net_amount+"' WHERE id='"+id+"'";
				page_name="empViewPlans.jsp?uplan=add";
			}
			
			try 
			{
				if(op.equals("n"))
				{
					PreparedStatement ps2=con.prepareStatement("select * from `plan` where plan_name='"+plan_name+"'");
					ResultSet rs=ps2.executeQuery();
					if(!rs.next())
					{
						PreparedStatement ps=con.prepareStatement(sql);
						int i=ps.executeUpdate();
						if(i>0)
						{
								System.out.println("Record Insert Done");
								response.sendRedirect(page_name);
						}
					}
					else
					{
						System.out.println("Email,ID Already Exist..!");
						response.sendRedirect("empAddPlan.jsp?planf=exist");
					}
				}
				else
				{
					PreparedStatement ps=con.prepareStatement(sql);
					int i=ps.executeUpdate();
					if(i>0)
					{
							System.out.println("Record update Done");
							response.sendRedirect(page_name);
					}
				}
			} catch (Exception e)
			{
				System.out.println("Exc user reg"+e);
			}
	}
}