package com.board.vo;

public class MemberVO {
	private int idx, age;
	private String ID, PWD, name, address, regdate;
	
	public MemberVO() {
		
	}
	
	public MemberVO(int idx, int age, String ID, String PWD, String name, String address, String regdate) {
		super();
		this.idx = idx;
		this.age = age;
		this.ID = ID;
		this.PWD = PWD;
		this.name = name;
		this.address = address;
		this.regdate = regdate;
	}
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getPWD() {
		return PWD;
	}

	public void setPWD(String PWD) {
		this.PWD = PWD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", age=" + age + ", ID=" + ID + ", PWD=" + PWD + ", name=" + name + ", address="
				+ address + ", regdate=" + regdate + "]";
	}
	
}
