package com.admin;

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
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con;

	public void init(ServletConfig config) throws ServletException {
		try {
			con = ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exception " + e);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		try {

			PreparedStatement ps1 = con.prepareStatement("select * from admin where admin_email='"+ username + "' AND admin_pwd='" + password + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				session.setAttribute("username", "Admin");
				session.setAttribute("user_type", "Admin");
				System.out.println("Login Done");
				response.sendRedirect("adminHome.jsp?login=done");
			}
			else
			{
				System.out.println("Login fail");
				response.sendRedirect("adminLogin.jsp?loginf=fail");
			}
		} catch (Exception e) {
			System.out.println("Exc " + e);
		}

	}

}
