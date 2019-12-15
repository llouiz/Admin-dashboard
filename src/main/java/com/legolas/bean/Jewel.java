package com.legolas.bean;

public class Jewel {
	private int id;
	private String name;
	private float p_def;
	private float m_def;
	private boolean tradable;

	public Jewel() {

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

	public float getP_def() {
		return p_def;
	}

	public void setP_def(float p_def) { 
		this.p_def = p_def;
	}

	public float getM_def() {
		return m_def;
	}

	public void setM_def(float m_def) {
		this.m_def = m_def;
	}

	public boolean isTradable() {
		return tradable;
	}

	public void setTradable(boolean tradable) {
		if(tradable) {
			tradable = true;
		}else {
			tradable = false;
		}
		this.tradable = tradable;
	}

}
