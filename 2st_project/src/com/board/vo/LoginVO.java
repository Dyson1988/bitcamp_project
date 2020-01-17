package com.board.vo;

import java.util.Date;

public class LoginVO {
	
	private int count;
	private int userIDX;
	private String userID;
	private String userPassword;
	private String name;
	private int age;
	private String address;
	private String date; // Date import 해주거나, String 타입으로 받아도 된다.
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getUserIDX() {
		return userIDX;
	}
	public void setUserIDX(int userIDX) {
		this.userIDX = userIDX;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
