package com.conn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;


public class GlobalFunction {

static Connection con=ConnectionProvider.getConnection();
	
	public static Map<String,String> getUserDetails(String id)
	{
		Map<String,String> user_details=new HashMap();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `customer` where cust_email='"+id+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				user_details.put("id",rs.getString("cust_id"));
				user_details.put("name",rs.getString("cust_name"));
				user_details.put("lname",rs.getString("lname"));
				user_details.put("mobile",rs.getString("cust_ph"));
				user_details.put("email",rs.getString("cust_email"));
				user_details.put("gender",rs.getString("gender"));
				user_details.put("address",rs.getString("cust_addr"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return user_details;
	}
	public static Map<String,String> getEmployeeDetails(String id)
	{
		Map<String,String> user_details=new HashMap();
		
		try {
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `employee` where e_email='"+id+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				user_details.put("id",rs.getString("e_id"));
				user_details.put("name",rs.getString("e_name"));
				user_details.put("mobile",rs.getString("e_phone"));
				user_details.put("email",rs.getString("e_email"));
				user_details.put("gender",rs.getString("gender"));
				user_details.put("address",rs.getString("e_addr"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return user_details;
	}
	
	public static Map<String,String> getPlanDetails(String id)
	{
		Map<String,String> p_details=new HashMap();
		
		try 
		{
			
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `plan` where id='"+id+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				p_details.put("plan_name",rs.getString("plan_name"));
				p_details.put("data_transfer",rs.getString("data_transfer"));
				p_details.put("hours",rs.getString("hours"));
				p_details.put("validity",rs.getString("validity"));
				p_details.put("package_cost",rs.getString("package_cost"));
				p_details.put("net_amount",rs.getString("net_amount"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return p_details;
	}
	
	public static Map<String,String> getLastPlanDetails(String email)
	{
		Map<String,String> p_details=new HashMap();
		
		try {
			
			PreparedStatement ps1=con.prepareStatement("SELECT * FROM `bill` where email='"+email+"' ORDER BY id DESC");
			ResultSet rs1 = ps1.executeQuery();
			String plan_id="0";
			String last_date="";
			if(rs1.next())
			{
				plan_id=rs1.getString("plan_id");
				last_date=rs1.getString("last_date");
			}
			
			
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `plan`  where id='"+plan_id+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				p_details.put("last_date",last_date);
				p_details.put("plan_name",rs.getString("plan_name"));
				p_details.put("data_transfer",rs.getString("data_transfer"));
				p_details.put("hours",rs.getString("hours"));
				p_details.put("validity",rs.getString("validity"));
				p_details.put("package_cost",rs.getString("package_cost"));
				p_details.put("net_amount",rs.getString("net_amount"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return p_details;
	}
	public static Map<String,String> getBillDetails(String id)
	{
		Map<String,String> p_details=new HashMap();
		
		try {
			
			PreparedStatement ps1=con.prepareStatement("SELECT * FROM `bill` where id='"+id+"'");
			ResultSet rs1 = ps1.executeQuery();
			String bill_id="id";
			
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `plan`  where id='"+bill_id+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				p_details.put("plan_name",rs.getString("plan_name"));
				p_details.put("data_transfer",rs.getString("data_transfer"));
				p_details.put("hours",rs.getString("hours"));
				p_details.put("validity",rs.getString("validity"));
				p_details.put("package_cost",rs.getString("package_cost"));
				p_details.put("net_amount",rs.getString("net_amount"));
			}
		} catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		return p_details;
	}
	
}
