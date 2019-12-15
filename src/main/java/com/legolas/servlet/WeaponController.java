package com.legolas.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.legolas.bean.Weapon;
import com.legolas.dao.WeaponDAO;


@WebServlet("/WeaponController")
public class WeaponController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Insert
		if (request.getParameter("insert") != null) {

			String name = request.getParameter("name");
			float atk_speed = Float.parseFloat(request.getParameter("atk_speed"));
			boolean droppable = Boolean.parseBoolean(request.getParameter("droppable"));
			int level = Integer.parseInt(request.getParameter("level"));
			int c_damage = Integer.parseInt(request.getParameter("c_damage"));

			Weapon w = new Weapon();
			w.setName(name);
			w.setAtk_speed(atk_speed);
			w.setDroppable(droppable);
			w.setLevel(level);
			w.setC_damage(c_damage);

			boolean status = new WeaponDAO().save(w);

			if (status) {
				request.getSession().setAttribute("sm", "Weapon Saved Successfully.");
			} else {
				request.getSession().setAttribute("em", "Weapon Not Saved.");
			}

			response.sendRedirect("weapon_table.jsp");

		}

		// Update
		if (request.getParameter("update") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			float atk_speed = Float.parseFloat(request.getParameter("atk_speed"));
			boolean droppable = Boolean.parseBoolean(request.getParameter("droppable"));
			int level = Integer.parseInt(request.getParameter("level"));
			int c_damage = Integer.parseInt(request.getParameter("c_damage"));

			Weapon w = new Weapon();
			w.setName(name);
			w.setAtk_speed(atk_speed);
			w.setDroppable(droppable);
			w.setLevel(level);
			w.setC_damage(c_damage);
			w.setId(id);

			boolean status = new WeaponDAO().update(w);

			if (status) {
				request.getSession().setAttribute("sm", "Weapon Updated Successfully.");
			} else {
				request.getSession().setAttribute("em", "Weapon Not Updated.");
			}

			response.sendRedirect("weapon_table.jsp");

		}

		// Delete
		if (request.getParameter("d") != null) {
			int id = Integer.parseInt(request.getParameter("d"));

			Weapon w = WeaponDAO.findWeapon(id);

			new WeaponDAO().delete(w);
			response.sendRedirect("weapon_table.jsp");
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
