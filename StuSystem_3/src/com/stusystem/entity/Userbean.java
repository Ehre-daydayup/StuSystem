package com.stusystem.entity;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;
@Alias("userbean")
@Component
public class Userbean {
	private String userName;
	private int userId;
	private String admin;
	private String password;
	private String xmm;
	public String getXmm() {
		return xmm;
	}
	public void setXmm(String xmm) {
		this.xmm = xmm;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
