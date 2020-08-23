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
<script type="text/javascript">
function del(teacherid) {
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
	    				  			var b = '${teapage}' ;
				  					b = Math.ceil(b/6) ;
	    				  			location.href = "teacherlist?page="+b;
						    });
	    		  }else{
	    			  swal("哦豁","删除失败，请重试！","error");
	    		  }
	    	    }
	    	  }	;											//服务器响应时完成相应操作
	    	xmlhttp.open("post","teacherdel?teacherId="+teacherid,true);
	    	xmlhttp.send();
	    });
}
</script>
<title>教师列表</title>
</head>
<body background="<%=request.getContextPath()%>/images/010.gif">
<div class="container-fluid">
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h2 class="text-center">教师信息管理表</h2></div>
	  <div class="col-md-4"></div>
	</div>
</div>
		<div class="row">
		  <div class="col-md-3">
		  	<div class="input-group">
		      <input type="text" class="form-control" id ="sousuo" placeholder="输入教师姓名搜索" value = "${teachername}" >
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" onclick="sousuo();">Go!</button>
		      </span>
	    	</div>
		  </div>
		  <div class="col-md-3"><button type="button" class="btn btn-default" onclick="tianjia();">添加+</button></div>
		  <div class="col-md-6"></div>
		</div>
	<br/>
	<table class="table table-hover">
		<tr class="info">
			<th>教师编号</th>
			<th>教师姓名</th>
			<th>教师性别</th>
			<th>所在系</th>
			<th>电话号码</th>
			<th>邮箱</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${teacherlist}" var="tea">
			<tr>
				<td>${tea.teacherId}</td>
				<td>${tea.teacherName}</td>
				<td>${tea.teacherSex}</td>
				<td>${tea.teacherSystem}</td>
				<td>${tea.teacherPhone}</td>
				<td>${tea.teacherEmail}</td>
				<td><button type="button" class="btn btn-info btn-xs" onclick="bianji(${tea.teacherId});" ><i class="iconfont">&#xe66e;</i>&nbsp;编辑</button>&nbsp;&nbsp;<button type="button" onclick="del(${tea.teacherId});" class="btn btn-danger btn-xs"><i class="iconfont">&#xe614;</i>&nbsp;删除</button></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page11" style="margin-top:5px; text-align:center;"></div>
</body>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
laypage({
    cont: 'page11',
    pages: Math.ceil("${teapage}"/6), //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18
    skip: true, //是否开启跳页
    skin: '#6699FF',
    curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
        var page = location.search.match(/page=(\d+)/);
        return page ? page[1] : 1;
    }(), 
    jump: function(e, first){ //触发分页后的回调
        if(!first){ //一定要加此判断，否则初始时会无限刷新
        	var teachername = document.getElementById("sousuo").value;
            location.href = '?page='+e.curr + '&teacherName=' + encodeURI(encodeURI(teachername));
        }
    }
});
</script>
<script type="text/javascript">
	function bianji(teacherId) {
		layer.open({
		    type: 2,
		    title: '教师信息编辑页面',
		    shadeClose: true,
		    shade: 0.8,
		    shift: 1, //0-6的动画形式，-1不开启
		    area: ['800px', '80%'],
		    content: 'teachereditor?teacherId='+ teacherId
		});
	}
	 function tianjia() {
		 layer.open({
			    type: 2,
			    title: '教师信息编辑页面',
			    shadeClose: true,
			    shade: 0.8,
			    shift: 1, //0-6的动画形式，-1不开启
			    area: ['800px', '80%'],
			    content: 'teachereditor?teacherId=0'
			}); 
	}
</script>
<script type="text/javascript">
	function sousuo() {
		var teachername = document.getElementById("sousuo").value;
		location.href = 'teacherlist?teacherName='+ encodeURI(encodeURI(teachername)) + '&page=1' ;
	}
</script>
</html>