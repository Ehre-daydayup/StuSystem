package com.stusystem.entity;


public class StudentBean {
	private int stuId;
	private String stuName;
	private String stuSex;
	private String stuSystem;
	private String stuClass;
	private String stuPhone;
	private int page;
	public int getPage() {
		return (page-1)*6;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuSex() {
		return stuSex;
	}
	public void setStuSex(String stuSex) {
		this.stuSex = stuSex;
	}
	public String getStuSystem() {
		return stuSystem;
	}
	public void setStuSystem(String stuSystem) {
		this.stuSystem = stuSystem;
	}
	public String getStuClass() {
		return stuClass;
	}
	public void setStuClass(String stuClass) {
		this.stuClass = stuClass;
	}
	public String getStuPhone() {
		return stuPhone;
	}
	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone;
	}
} 
