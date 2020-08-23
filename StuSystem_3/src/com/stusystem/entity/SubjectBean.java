package com.stusystem.entity;

public class SubjectBean {
private int subjectId;
private String subjectName;
private String teacherName;
private String subjectCredit;
private int page;
public int getPage() {
	return (page-1)*6;
}
public void setPage(int page) {
	this.page = page;
}
public int getSubjectId() {
	return subjectId;
}
public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}
public String getSubjectName() {
	return subjectName;
}
public void setSubjectName(String subjectName) {
	this.subjectName = subjectName;
}
public String getTeacherName() {
	return teacherName;
}
public void setTeacherName(String teacherName) {
	this.teacherName = teacherName;
}
public String getSubjectCredit() {
	return subjectCredit;
}
public void setSubjectCredit(String subjectCredit) {
	this.subjectCredit = subjectCredit;
}
}
