package com.legolas.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.legolas.bean.Weapon;
import com.legolas.connection.Database;

public class WeaponDAO {

	public boolean save(Weapon w) {

		String sql = "Insert into weapon(name, atk_speed, droppable, level, c_damage) values(?, ?, ?, ?, ?)";

		try {
			Connection conn = Database.connect();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, w.getName());
			ps.setFloat(2, w.getAtk_speed());
			ps.setBoolean(3, w.isDroppable());
			ps.setInt(4, w.getLevel());
			ps.setInt(5, w.getC_damage());

			ps.executeUpdate();

			conn.close();
			ps.close();

			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	public static ArrayList<Weapon> getAllWeapon() {
		ArrayList<Weapon> weaponList = new ArrayList<Weapon>();

		try {
			Connection conn = Database.connect();
			String sql = "select * from weapon";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Weapon w = new Weapon();
				w.setId(rs.getInt("id"));
				w.setName(rs.getString("name"));
				w.setAtk_speed(rs.getFloat("atk_speed"));
				w.setDroppable(rs.getBoolean("droppable"));
				w.setLevel(rs.getInt("level"));
				w.setC_damage(rs.getInt("c_damage"));
				weaponList.add(w);
			}
			conn.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return weaponList;
	}

	public static Weapon findWeapon(int id) {
		Weapon w = new Weapon();

		try {
			Connection conn = Database.connect();
			String sql = "Select * from weapon where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				w.setId(rs.getInt("id"));
				w.setName(rs.getString("name"));
				w.setAtk_speed(rs.getFloat("atk_speed"));
				w.setDroppable(rs.getBoolean("droppable"));
				w.setLevel(rs.getInt("level"));
				w.setC_damage(rs.getInt("c_damage"));
			}
			conn.close();
			ps.close();
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return w;

	}

	public boolean update(Weapon w) {

		try {
			Connection conn = Database.connect();

			String sql = "update weapon set name=?, atk_speed=?, droppable=?, level=?, c_damage=? where id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, w.getName());
			ps.setFloat(2, w.getAtk_speed());
			ps.setBoolean(3, w.isDroppable());
			ps.setInt(4, w.getLevel());
			ps.setInt(5, w.getC_damage());
			ps.setInt(6, w.getId());

			ps.executeUpdate();

			conn.close();
			ps.close();

			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	public void delete(Weapon w) {
		try {
			String sql = "delete from weapon where id=?";

			Connection connection = Database.connect();

			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, w.getId());

			ps.executeUpdate();

			connection.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
