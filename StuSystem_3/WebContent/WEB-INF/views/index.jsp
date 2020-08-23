<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
 <head>
  <title>学生成绩管理系统|首页</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="<%=request.getContextPath()%>/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath()%>/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath()%>/assets/css/main.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
   	var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
   	
   </script>
 </head>
 <body>
   <div class="header">
    <div class="dl-title"><span class="">学生成绩管理系统</span></div>
    <div class="dl-log">欢迎您，<span class="dl-log-user">${userbean.userName}</span>
    <c:choose>
    	<c:when test="${userbean.admin == 1}">
    		<span class="admin">（管理员）</span>
    	</c:when>
    </c:choose>
    <c:choose>
    	<c:when test="${userbean.admin == 2}">
    		<span class="admin">（教师）</span>
    	</c:when>
    </c:choose>
    <c:choose>
    	<c:when test="${userbean.admin == 3}">
    		<span class="admin">（学生）</span>
    	</c:when>
    </c:choose>
        <a href="loginout" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
   </div>
   <div class="content">
    <div class="dl-main-nav">
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-storage">首页</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">
    </ul>
   </div>
  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/config-min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/lib/layer/1.9.3/layer.js"></script>
  <script>
	//学生登录
	if('${userbean.admin}'=='3'){
	BUI.use('common/main',function(){
      var config = [{
          id:'menu',
		  homePage:'gy',
          menu:[{
              text:'学生操作',
              items:[
                {id:'cjcx',text:'成绩查询',href:'/StuSystem_3/score/xsgrcjcx?studentId=' + '${userbean.userId}'},
                {id:'xsgrkcgl',text:'学生个人课程管理',href:'/StuSystem_3/score/scoreone?page=1&studentId=' + '${userbean.userId}' },
				{id:'xsgrxxgl',text:'学生个人信息管理',href:'/StuSystem_3/student/studentone?stuId=' + '${userbean.userId}' },
				{id:'dlmmxg',text:'登录密码修改',href:'/StuSystem_3/user/dlmmxg'},
				{id:'gy',text:'关于',href:'gy'}
              ]
            }]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
}	
	//教师登录
if('${userbean.admin}'=='2'){
	BUI.use('common/main',function(){
      var config = [{
          id:'menu',
		  homePage:'gy',
          menu:[{
              text:'教师操作',
              items:[
                {id:'xsxxgl',text:'学生信息管理',href:'/StuSystem_3/teacher/teacherlist?page=1'},
                {id:'kcxxgl',text:'课程信息管理',href:'/StuSystem_3/student/studentlist?page=1'},
				{id:'jsgrxxgl',text:'教师个人信息管理',href:'/StuSystem_3/teacher/teacherone?teacherId='+'${userbean.userId}'},
				{id:'xscjgl',text:'学生成绩管理',href:'/StuSystem_3/score/scorelist?page=1'},
				{id:'dlmmxg',text:'登录密码修改',href:'/StuSystem_3/user/dlmmxg'},
				{id:'gy',text:'关于',href:'gy'}
              ]
            }]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
}
	//管理员登录
	if('${userbean.admin}'=='1'){
		BUI.use('common/main',function(){
	      var config = [{
	          id:'menu',
			  homePage:'gy',
	          menu:[{
	              text:'管理员操作',
	              items:[
					{id:'jsxxgl',text:'教师信息管理',href:'/StuSystem_3/teacher/teacherlist?page=1'},
	                {id:'xsxxgl',text:'学生信息管理',href:'/StuSystem_3/student/studentlist?page=1'},
	                {id:'kcxxgl',text:'课程信息管理',href:'/StuSystem_3/subject/subjectlist?page=1'},
	                {id:'xscjgl',text:'学生成绩管理',href:'/StuSystem_3/score/scorelist?page=1'},
					{id:'dlmmxg',text:'登录密码修改',href:'/StuSystem_3/user/dlmmxg'},
					{id:'gy',text:'关于',href:'gy'}
	              ]
	            }]
	          }];
	      new PageUtil.MainPage({
	        modulesConfig : config
	      });
	    });
	}
  </script>
 </body>
</html>