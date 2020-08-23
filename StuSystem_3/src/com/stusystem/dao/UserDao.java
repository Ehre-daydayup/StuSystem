package com.stusystem.dao;

import com.stusystem.entity.Userbean;


public interface  UserDao {
	//验证登录信息
	public Userbean getUsrInfoByNameAndPsw(Userbean userbean);
	//修改密码
	public void mmxg(Userbean userbean);
}
