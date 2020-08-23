package com.stusystem.dao;
import java.util.List;
import com.stusystem.entity.StudentBean;
public interface StudentDao {
public List<StudentBean> getStudent(StudentBean studentbean) throws Exception;//返回学生信息的list
public int getstupage(StudentBean studentbean) throws Exception;//分页处理
public StudentBean getStudentone (StudentBean studentbean) throws Exception;//返回一条学生信息
public void studentdel(StudentBean studentbean) throws Exception;//删除一条学生信息
public void studentadd(StudentBean studentbean) throws Exception;//增加一条学生信息
public void studentxiugai(StudentBean studentbean) throws Exception;//修改一条学生信息
}
