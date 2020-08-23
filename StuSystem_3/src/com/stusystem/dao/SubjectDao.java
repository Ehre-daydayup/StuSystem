package com.stusystem.dao;

import java.util.List;

import com.stusystem.entity.SubjectBean;

public interface SubjectDao {
public List<SubjectBean> getSubject(SubjectBean subjectBean) throws Exception;
public int getsbjpage(SubjectBean subjectBean) throws Exception;
public SubjectBean getSubjectone(SubjectBean subjectBean) throws Exception;
public void subjectdel(SubjectBean subjectBean) throws Exception;
public void subjectadd(SubjectBean subjectBean) throws Exception;
public void subjectxiugai(SubjectBean subjectBean) throws Exception;
}
