<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>已选课程列表</title>
</head>
<body background="<%=request.getContextPath()%>/images/010.gif">
<div class="container-fluid">
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h2 class="text-center">学生已选课程表</h2></div>
	  <div class="col-md-4"></div>
	</div>
</div>
	<br/>
	<table class="table table-hover">
		<tr class="info">
			<th>课程编号</th>
			<th>课程名字</th>
			<th>授课老师</th>
			<th>课程学分</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${yxsubjectlist}" var="sbj">
		<tr>
			<td>${sbj.subjectId}</td>
			<td>${sbj.subjectName}</td>
			<td>${sbj.teacherName}</td>
			<td>${sbj.subjectCredit}</td>
				<td>
					<button type="button" class="btn btn-danger btn-xs" onclick="del(${sbj.subjectId},${userbean.userId});" >
						<i class="iconfont">&#xe614;</i>
						&nbsp;删除本课程
					</button>
				</td>
		</tr>
		</c:forEach>
	</table>
</body>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
function del(subjectid,studentid) {
	swal({
        title: "您确定要删除这条信息吗",
        text: "删除后将无法恢复，请谨慎操作！",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "删除",
        closeOnConfirm: false
    }, function () {
    	if (window.XMLHttpRequest){
    		// code for IE7+, Firefox, Chrome, Opera, Safari
    	  	xmlhttp=new XMLHttpRequest();
    	  }
    	else{// code for IE6, IE5
    	  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }                                                       //创建XMLHttpRequest对象
    	xmlhttp.onreadystatechange=function(){
    	  if (xmlhttp.readyState==4 && xmlhttp.status==200){
    		  var a = eval("("+xmlhttp.responseText+")");
    		  if(a.status== 1){
    			  swal({title:"删除成功！",text:"您已经永久删除了这条信息!",type:"success"}, 
							function () {
    				  			location.href = 'xsyxkc?studentId=' + '${userbean.userId}' ;
					    });
    		  }else{
    			  swal("哦豁","删除失败，请重试！","error");
    		  }
    	    }
    	  }	;											//服务器响应时完成相应操作
    	xmlhttp.open("post","yxkcdel?subjectId=" + subjectid + "&studentId=" + studentid,true);
    	xmlhttp.send();
    });
}
</script>
</html>