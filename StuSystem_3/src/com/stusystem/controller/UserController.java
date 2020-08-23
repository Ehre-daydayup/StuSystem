package com.stusystem.controller;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.stusystem.dao.UserDao;
import com.stusystem.entity.Userbean;
@Controller
@RequestMapping(value = "user")
public class UserController {
	@Autowired
	private UserDao userDao;
//	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring-context.xml");
//	UserDao userDao = (UserDao) applicationContext.getBean("userDao");
	//返回登陆界面
	//验证用户的用户名和密码是有和数据库中的匹配
	@RequestMapping(value = {"/login"})
	public String userlogin() {
		return "login";
	}
	//登陆验证
	@RequestMapping(value = {"/loginyanzheng"})
	public void loginyanzheng(Userbean userbean,HttpServletResponse response,HttpServletRequest request) throws IOException {
		Userbean user = userDao.getUsrInfoByNameAndPsw(userbean);
		if(user==null){
			response.getWriter().println("{\"status\":0,\"msg\":\"用户名或密码有误！\"}");
		}else{
			// 用户的信息存放到session中。
			HttpSession session = request.getSession();
			session.setAttribute("userbean", user);
			response.getWriter().println("{\"status\":1,\"url\":\"index\"}");
		}
	}
	//返回系统主界面
	@RequestMapping(value = {"/index"})
	public String index() {
		return "index";
	}
	//返回关于页面
	@RequestMapping(value = {"/gy"})
	public String guanyu() {
		return "gy";
	}
	//返回密码修改页面
	@RequestMapping(value = {"/dlmmxg"})
	public String dlmmxg() {
		return "dlmmxg";
	}
	//修改登录密码
	@RequestMapping(value = {"/mmxg"})
	public String mmxg(Userbean userbean,HttpServletResponse response,HttpServletRequest request){
		Userbean user = userDao.getUsrInfoByNameAndPsw(userbean);
		if(user==null){
			request.setAttribute("status", '0');
		}else{
			userDao.mmxg(userbean);
			request.setAttribute("status", '1');
		}
		return "dlmmxg";
	}
	//退出系统
	@RequestMapping(value = {"/loginout"})
	public String loginout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";
	}
}
