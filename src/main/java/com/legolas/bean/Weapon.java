package com.legolas.bean;

public class Weapon {
	private int id;
	private String name;
	private float atk_speed;
	private boolean droppable;
	private int level;
	private int c_damage;
	
	public Weapon() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getAtk_speed() {
		return atk_speed;
	}
	public void setAtk_speed(float atk_speed) {
		this.atk_speed = atk_speed;
	}
	public boolean isDroppable() {
		return droppable;
	}
	
	public void setDroppable(boolean droppable) {
		if(droppable) {
			droppable = true;
		}else {
			droppable = false;
		}
		this.droppable = droppable;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getC_damage() {
		return c_damage;
	}

	public void setC_damage(int c_damage) {
		this.c_damage = c_damage;
	}
}
