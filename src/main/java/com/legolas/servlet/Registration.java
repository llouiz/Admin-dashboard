package com.legolas.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Registration() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String user = request.getParameter("user");
			String email = request.getParameter("email"); 
			String password = request.getParameter("password");

			String sql = "Insert into users(user, email, password) values(?, ?, ?)";

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/legolas?useTimezone=true&serverTimezone=UTC", "root", "snippetcode");
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.executeUpdate();

			
			request.getRequestDispatcher("registration.jsp").forward(request, response);
			//rd.include(request, response);
			
			String message = "Success! Your account has been created sucessfully.";
			
			HttpSession session = request.getSession();
			session.setAttribute("message", message);
			
			/*PrintWriter out = response.getWriter();
			out.println("You have sucessfully registered!");*/
			

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
