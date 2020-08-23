package com.stusystem.dao;

import java.util.List;

import com.stusystem.entity.ScoreBean;
import com.stusystem.entity.StudentBean;
import com.stusystem.entity.SubjectBean;

public interface ScoreDao {
public List<ScoreBean> getscorelist(StudentBean studentBean) throws Exception;
public void scoreadd(ScoreBean score) throws Exception;
public List<SubjectBean> getSubject(ScoreBean score) throws Exception;
//已选课程信息的分页处理
public int getsbjpage(ScoreBean score)throws Exception;
//添加一个学生的选课信息
public void setsubject(ScoreBean score)throws Exception;
//查询一个学生已选课程信息的list
public List<SubjectBean> yxsubjectlist(ScoreBean score) throws Exception;
//删除一条已选课程
public void delyxkc(ScoreBean score) throws Exception;
//查询一个学生的已选课程成绩和课程信息的list
public List<ScoreBean> getscoreonelist(ScoreBean score)throws Exception;
}
