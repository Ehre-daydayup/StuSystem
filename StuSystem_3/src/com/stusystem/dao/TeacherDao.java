package com.stusystem.dao;
import com.stusystem.entity.*;
import java.util.*;
public interface TeacherDao {
public List<TeacherBean> getTeacher(TeacherBean teacherbean) throws Exception;
public int getteapage(TeacherBean teacherbean) throws Exception;//返回教师信息有多少页
public TeacherBean getTeacherone(TeacherBean teacherbean) throws Exception;//根据Id返回一条教师记录
public void teacherdel(TeacherBean teacherbean) throws Exception;
public void teacheradd(TeacherBean teacherbean) throws Exception;
public void teacherxiugai(TeacherBean teacherbean) throws Exception;
}
