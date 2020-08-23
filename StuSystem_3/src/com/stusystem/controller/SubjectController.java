package com.stusystem.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stusystem.dao.SubjectDao;
import com.stusystem.entity.SubjectBean;

@Controller
@RequestMapping("subject")
public class SubjectController {
	@Autowired
	SubjectDao subjectDao;
	@RequestMapping("/subjectlist")
	public String getSubject(SubjectBean sbj,Model model) throws Exception{
		if(sbj.getSubjectName()!=null&&sbj.getSubjectName()!=""){
			sbj.setSubjectName(URLDecoder.decode(sbj.getSubjectName(), "UTF-8"));
		}
		List<SubjectBean> subjectlist=subjectDao.getSubject(sbj);
		int sbjpage=subjectDao.getsbjpage(sbj);
		model.addAttribute("subjectlist",subjectlist);
		model.addAttribute("sbjpage",sbjpage);
		model.addAttribute("subjectName", sbj.getSubjectName());
		return "subjectlist";
	}
    
	@RequestMapping("/subjecteditor")
	public String studenteditor(SubjectBean sbj,Model model) throws Exception {
		if(sbj.getSubjectId()==0){
			return "subjecteditor";
		}else{
			SubjectBean subjectone = subjectDao.getSubjectone(sbj);
			model.addAttribute("subjectone", subjectone);//如subjecteditor.jsp中可用subjectone.sybjectId来获取课程号
			return "subjecteditor";
		}
	}
	//删除一条课程信息
	@RequestMapping(value = {"/subjectdel"})
	public void subjectdel(SubjectBean sbj,HttpServletResponse response) throws IOException {
		int a = 0;
		try {
			subjectDao.subjectdel(sbj);
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
	//添加一条课程信息
	@RequestMapping(value = {"/subjectadd"})
	public void subjectadd(SubjectBean sbj,HttpServletResponse response) throws IOException{
		int a = 0;
		try {
			if(sbj.getSubjectId()==0){
				sbj.setSubjectName(URLDecoder.decode(sbj.getSubjectName(), "UTF-8"));
				sbj.setTeacherName(URLDecoder.decode(sbj.getTeacherName(), "UTF-8"));
				subjectDao.subjectadd(sbj);
			}else{
				sbj.setSubjectName(URLDecoder.decode(sbj.getSubjectName(), "UTF-8"));
				sbj.setTeacherName(URLDecoder.decode(sbj.getTeacherName(), "UTF-8"));
				subjectDao.subjectxiugai(sbj);
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
