package com.stusystem.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stusystem.dao.ScoreDao;
import com.stusystem.dao.StudentDao;
import com.stusystem.entity.ScoreBean;
import com.stusystem.entity.StudentBean;
import com.stusystem.entity.SubjectBean;
@Controller
@RequestMapping(value = "score")
public class ScoreController {
	@Autowired
	private StudentDao studentDao;
	//要注入必须要将这个类在spring容器中注册
	@Autowired
	private ScoreDao scoreDao;
//	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring-context.xml");
//	StudentDao studentDao = (StudentDao) applicationContext.getBean("studentDao");
//	ScoreDao scoreDao = (ScoreDao) applicationContext.getBean("scoreDao");
	//查询出所有学生信息到学生成绩管理页面
	@RequestMapping(value = {"/scorelist"})
	public String getStudent(StudentBean stu,Model model) throws Exception{
		if(stu.getStuName()!=null&&stu.getStuName()!=""){
			stu.setStuName(URLDecoder.decode(stu.getStuName(), "UTF-8"));
		}
		List<StudentBean> stulist = studentDao.getStudent(stu);
		int stupage = studentDao.getstupage(stu);
		model.addAttribute("studentlist", stulist);
		model.addAttribute("stupage", stupage);
		model.addAttribute("studentname", stu.getStuName());
		return "scorelist";
	}
	//查询出一个学生已选课程信息list到该学生成绩编辑页面
	@RequestMapping(value = {"/scoreeditor"})
	public String scoreeditor(StudentBean stu,Model model) throws Exception{
		List<ScoreBean> scorelist = scoreDao.getscorelist(stu);
		model.addAttribute("scorelist", scorelist);
		if(scorelist.size()==0){
			model.addAttribute("h1", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这位同学还没有选课！！！");
		}
		return "scoreeditor";
	}
	//得到在编辑页面编辑好一个学生的各科成绩的list，循环存入数据库中后，在返回存入结果
	@RequestMapping(value = {"/scoreadd"})
	public void scoreadd(String scorelist,HttpServletResponse response) throws IOException {
		int a = 0;
		String[] scoreStrArray = scorelist.split(",");
		ScoreBean score = new ScoreBean();
		try{
			for(int i = 0 ; i < scoreStrArray.length ; i+=2 ){
				score.setScore(scoreStrArray[i]);
				score.setScoreId(Integer.parseInt(scoreStrArray[i+1]));
				scoreDao.scoreadd(score);
			}
		}catch (Exception e){
			a=a+1;
			response.getWriter().println("{'status':'0'}");
			e.printStackTrace();
		}
		if(a==0){
			response.getWriter().println("{'status':'1'}");
		}
	}
	//查询出一个学生的未选课程的信息list
	@RequestMapping(value = {"/scoreone"})
	public String scoreone(ScoreBean scorebean,Model model)throws Exception{
		String subjectname =scorebean.getSubjectName();
		if (subjectname != null && !"".equals(subjectname)) {
			subjectname= URLDecoder.decode(subjectname, "UTF-8");
			scorebean.setSubjectName(URLDecoder.decode(subjectname, "UTF-8")) ;
		}
		List<SubjectBean> subjectlist = scoreDao.getSubject(scorebean);
		int sbjpage = scoreDao.getsbjpage(scorebean);
		model.addAttribute("sbjpage", sbjpage);
		model.addAttribute("subjectlist", subjectlist);
		model.addAttribute("subjectname", subjectname);
		return "scoreone";
	}
	//添加一个学生的选课记录
	@RequestMapping(value = {"/xuanke"})
	public void xuanke(HttpServletResponse response,ScoreBean scorebean) throws IOException{
		int a = 0;
		try {
			scoreDao.setsubject(scorebean);
		} catch (Exception e) {
			a=a+1;
			response.getWriter().println("{'status':'0'}");
			e.printStackTrace();
		}
		if(a==0){
			response.getWriter().println("{'status':'1'}");
		}
	}
	//返回一个学生的已选课程的list到已选课程编辑页面
	@RequestMapping(value = {"/xsyxkc"})
	public String xsyxkc(ScoreBean scorebean,Model model) throws Exception{
		List<SubjectBean> yxsubjectlist = scoreDao.yxsubjectlist(scorebean);
		model.addAttribute("yxsubjectlist", yxsubjectlist);
		return "xsyxkc";
	}
	//删除一个学生的已选课程
	@RequestMapping(value = {"/yxkcdel"})
	public void yxkcdel(ScoreBean scorebean,HttpServletResponse response) throws IOException{
		int a = 0;
		try {
			scoreDao.delyxkc(scorebean);
		} catch (Exception e) {
			a=a+1;
			response.getWriter().println("{'status':'0'}");
			e.printStackTrace();
		}
		if(a==0){
			response.getWriter().println("{'status':'1'}");
		}
	}
	//查询出一个学生的已选课程成绩信息和相应成绩
	@RequestMapping(value = {"/xsgrcjcx"})
	public String xsgrcjcx(ScoreBean scorebean,Model model)throws Exception{
		List<ScoreBean> scoreonelist = scoreDao.getscoreonelist(scorebean);
		model.addAttribute("scoreonelist", scoreonelist);
		if(scoreonelist.size()==0){
			model.addAttribute("h1", "你还没有选课！！");
		}
		return "xsgrcjcx";
	}
}
