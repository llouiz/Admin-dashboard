package com.legolas.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.legolas.bean.Jewel;
import com.legolas.bean.Weapon;
import com.legolas.dao.JewelDAO;
import com.legolas.dao.WeaponDAO;

@WebServlet("/JewelController")
public class JewelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Insert
		if (request.getParameter("insert") != null) {

			String name = request.getParameter("name");
			float p_def = Float.parseFloat(request.getParameter("p_def"));
			float m_def = Float.parseFloat(request.getParameter("m_def"));
			boolean tradable = Boolean.parseBoolean(request.getParameter("tradable"));

			Jewel j = new Jewel();
			j.setName(name);
			j.setP_def(p_def);
			j.setM_def(m_def);
			j.setTradable(tradable);

			boolean status = new JewelDAO().save(j);

			if (status) {
				request.getSession().setAttribute("sm", "Jewel Saved Successfully.");
			} else {
				request.getSession().setAttribute("em", "Jewel Not Saved.");
			}

			response.sendRedirect("jewel_table.jsp");

		}

		// Update
		if (request.getParameter("update") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			float p_def = Float.parseFloat(request.getParameter("p_def"));
			float m_def = Float.parseFloat(request.getParameter("m_def"));
			boolean tradable = Boolean.parseBoolean(request.getParameter("tradable"));

			Jewel j = new Jewel();
			j.setName(name);
			j.setP_def(p_def);
			j.setM_def(m_def);
			j.setTradable(tradable);
			j.setId(id);

			boolean status = new JewelDAO().update(j);

			if (status) {
				request.getSession().setAttribute("sm", "Jewel Updated Successfully.");
			} else {
				request.getSession().setAttribute("em", "Jewel Not Updated.");
			}

			response.sendRedirect("jewel_table.jsp");

		}

		// Delete
		if (request.getParameter("d") != null) {
			int id = Integer.parseInt(request.getParameter("d"));

			Jewel j = JewelDAO.findWeapon(id);

			new JewelDAO().delete(j);
			response.sendRedirect("jewel_table.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}

}
