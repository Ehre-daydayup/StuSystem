<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/font/iconfont.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert/sweetalert.css">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/lib/layer/1.9.3/layer.js"></script>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script src="<%=request.getContextPath()%>/js/sweetalert/sweetalert.min.js"></script>
<title>学生信息列表</title>
</head>
<body background="<%=request.getContextPath()%>/images/010.gif">
<div class="container-fluid">
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h2 class="text-center">学生个人信息管理表</h2></div>
	  <div class="col-md-4"></div>
	</div>
</div>
	<br/>
	<table class="table table-hover">
		<tr class="info">
			<th>学号</th>
			<th>学生姓名</th>
			<th>学生性别</th>
			<th>所在系</th>
			<th>班级</th>
			<th>电话号码</th>
			<th>操作</th>
		</tr>
		<tr>
				<td>${stuone.stuId}</td>
				<td>${stuone.stuName}</td>
				<td>${stuone.stuSex}</td>
				<td>${stuone.stuSystem}</td>
				<td>${stuone.stuClass}</td>
				<td>${stuone.stuPhone}</td>
				<td>
					<button id = "xiugai" type="button" class="btn btn-info btn-xs" onclick="xiugai();" >
						<i class="iconfont">&#xe66e;</i>
						&nbsp;编辑
					</button>
				</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
function xiugai() {
	layer.open({
	    type: 2,
	    title: '学生个人信息修改页面',
	    shadeClose: true,
	    shade: 0.8,
	    shift: 1, //0-6的动画形式，-1不开启
	    area: ['800px', '80%'],
	    content: 'studenteditor?stuId='+"${stuone.stuId}"
	}); 
}
</script>
</html>