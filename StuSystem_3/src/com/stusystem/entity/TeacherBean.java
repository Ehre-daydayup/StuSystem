package com.stusystem.entity;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;
@Alias("teacherBean")
@Component
public class TeacherBean {
	private int teacherId;
	private String teacherName;
	private String teacherSex;
	private String teacherSystem;
	private String teacherPhone;
	private String teacherEmail;
	public String getTeacherEmail() {
		return teacherEmail;
	}
	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail = teacherEmail;
	}
	private int page;
	public int getPage() {
		return (page-1)*6;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherSystem() {
		return teacherSystem;
	}
	public String getTeacherSex() {
		return teacherSex;
	}
	public void setTeacherSex(String teacherSex) {
		this.teacherSex = teacherSex;
	}
	public void setTeacherSystem(String teacherSystem) {
		this.teacherSystem = teacherSystem;
	}
	public String getTeacherPhone() {
		return teacherPhone;
	}
	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
}
