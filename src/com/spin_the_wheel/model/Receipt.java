package com.spin_the_wheel.model;

import java.io.Serializable;

public class Receipt implements Serializable {
	private int id;
	private String imagePath;
	private String prizeWon;
	
	
	public String getPrizeWon() {
		return prizeWon;
	}
	public void setPrizeWon(String prizeWon) {
		this.prizeWon = prizeWon;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	
	
	
	

}
