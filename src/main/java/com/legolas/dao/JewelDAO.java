package com.legolas.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.legolas.bean.Jewel;
import com.legolas.bean.Weapon;
import com.legolas.connection.Database;

public class JewelDAO {
	public boolean save(Jewel j) {

		String sql = "Insert into jewel(name, p_def, m_def, tradable) values(?, ?, ?, ?)";

		try {
			Connection conn = Database.connect();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getName());
			ps.setFloat(2, j.getP_def());
			ps.setFloat(3, j.getM_def());
			ps.setBoolean(4, j.isTradable());

			ps.executeUpdate();

			conn.close();
			ps.close();

			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	public static ArrayList<Jewel> getAllJewel() {
		ArrayList<Jewel> jewelList = new ArrayList<Jewel>();

		try {
			Connection conn = Database.connect();
			String sql = "select * from jewel";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Jewel j = new Jewel();
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setP_def(rs.getFloat("p_def"));
				j.setM_def(rs.getFloat("m_def"));
				j.setTradable(rs.getBoolean("tradable"));
				jewelList.add(j);
			}
			conn.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return jewelList;
	}

	public static Jewel findWeapon(int id) {
		Jewel j = new Jewel();

		try {
			Connection conn = Database.connect();
			String sql = "Select * from jewel where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setP_def(rs.getFloat("p_def"));
				j.setM_def(rs.getFloat("m_def"));
				j.setTradable(rs.getBoolean("tradable"));
			}
			conn.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return j;

	}

	public boolean update(Jewel j) {

		try {
			Connection conn = Database.connect();

			String sql = "update jewel set name=?, p_def=?, m_def=?, tradable=? where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getName());
			ps.setFloat(2, j.getP_def());
			ps.setFloat(3, j.getM_def());
			ps.setBoolean(4, j.isTradable());
			ps.setInt(5, j.getId());

			ps.executeUpdate();

			conn.close();
			ps.close();

			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	public void delete(Jewel j) {
		try {
			String sql = "delete from jewel where id=?";

			Connection connection = Database.connect();

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, j.getId());

			ps.executeUpdate();

			connection.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
