package com.stusystem.entity;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;
@Alias("scoreBean")
@Component
public class ScoreBean {
private int scoreId;
private int studentId;
private String subjectName;
private String studentName;
private String score;
private int subjectId;
private String teacherName;
private String subjectCredit;
private int page;
public int getPage() {
	return (page-1)*6;
}
public void setPage(int page) {
	this.page = page;
}
public String getSubjectCredit() {
	return subjectCredit;
}
public void setSubjectCredit(String subjectCredit) {
	this.subjectCredit = subjectCredit;
}
public String getTeacherName() {
	return teacherName;
}
public void setTeacherName(String teacherName) {
	this.teacherName = teacherName;
}
public int getScoreId() {
	return scoreId;
}
public void setScoreId(int scoreId) {
	this.scoreId = scoreId;
}
public int getStudentId() {
	return studentId;
}
public void setStudentId(int studentId) {
	this.studentId = studentId;
}
public String getSubjectName() {
	return subjectName;
}
public void setSubjectName(String subjectName) {
	this.subjectName = subjectName;
}
public String getStudentName() {
	return studentName;
}
public void setStudentName(String studentName) {
	this.studentName = studentName;
}
public String getScore() {
	return score;
}
public void setScore(String score) {
	this.score = score;
}
public int getSubjectId() {
	return subjectId;
}
public void setSubjectId(int subjectId) {
	this.subjectId = subjectId;
}
}
