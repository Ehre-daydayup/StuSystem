package com.stusystem.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stusystem.dao.StudentDao;
import com.stusystem.entity.StudentBean;

@Controller
@RequestMapping(value = "student")
public class StudentController {
	@Autowired
	private StudentDao studentDao;
//	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring-context.xml");
//	StudentDao studentDao = (StudentDao) applicationContext.getBean("studentDao");
	
	//得到学生列表和页数.返回到学生信息页面
	@RequestMapping(value = {"/studentlist"})
	public String getStudent(StudentBean stu,Model model) throws Exception{
		if(stu.getStuName()!=null&&stu.getStuName()!=""){
			stu.setStuName(URLDecoder.decode(stu.getStuName(), "UTF-8"));
		}
		List<StudentBean> stulist = studentDao.getStudent(stu);
		int stupage = studentDao.getstupage(stu);
		model.addAttribute("studentlist", stulist);
		model.addAttribute("stupage", stupage);
		model.addAttribute("studentname", stu.getStuName());
		return "studentlist";
	}
	//得到一个学生信息。返回到一个学生信息页面
	@RequestMapping(value = {"/studentone"})
	public String getStudentone(StudentBean stu,Model model) throws Exception {
		StudentBean studentone = studentDao.getStudentone(stu);
		model.addAttribute("stuone", studentone);
		return "studentone";
	}
	//得到一个学生信息。返回到学生编辑页面
	@RequestMapping(value = {"/studenteditor"})
	public String studenteditor(StudentBean stu,Model model) throws Exception {
		if(stu.getStuId()==0){
			return "studenteditor";
		}else{
			StudentBean studentone = studentDao.getStudentone(stu);
			model.addAttribute("studentone", studentone);
			return "studenteditor";
		}
	}
	//删除学生信息
	@RequestMapping(value = {"/studentdel"})
	public void studentdel(StudentBean stu,HttpServletResponse response) throws IOException {
		int a = 0;
		try {
			studentDao.studentdel(stu);
		} catch (Exception e) {
			a=a+1;
			response.getWriter().println("{'status':'0'}");
			e.printStackTrace();
		}
		if(a==0){
			response.getWriter().println("{'status':'1'}");
		}else{
		}
	}
	//添加/修改   （ 以是否有stuId来判断）     学生信息
	@RequestMapping(value = {"/studentadd"})
	public void studentadd(StudentBean stu,HttpServletResponse response) throws IOException{
		int a = 0;
		try {
			if(stu.getStuId()==0){
				stu.setStuName(URLDecoder.decode(stu.getStuName(), "UTF-8"));
				stu.setStuSystem(URLDecoder.decode(stu.getStuSystem(), "UTF-8"));
				stu.setStuSex(URLDecoder.decode(stu.getStuSex(), "UTF-8"));
				stu.setStuClass(URLDecoder.decode(stu.getStuClass(), "UTF-8"));
				studentDao.studentadd(stu);
			}else{
				stu.setStuName(URLDecoder.decode(stu.getStuName(), "UTF-8"));
				stu.setStuSystem(URLDecoder.decode(stu.getStuSystem(), "UTF-8"));
				stu.setStuSex(URLDecoder.decode(stu.getStuSex(), "UTF-8"));
				stu.setStuClass(URLDecoder.decode(stu.getStuClass(), "UTF-8"));
				studentDao.studentxiugai(stu);
			}
		} catch (Exception e) {
			a=a+1;
			response.getWriter().println("{'status':'0'}");
			e.printStackTrace();
		}
		if(a==0){
			response.getWriter().println("{'status':'1'}");
		}else{
		}
	}
}