<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/H-ui.1.x.patch.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert/sweetalert.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/Validform/5.3.2/Validform.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/Validform/5.3.2/passwordStrength-min.js"></script>
<script src="<%=request.getContextPath()%>/js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#demoform-2").Validform({
		tiptype:2,
		usePlugin:{
			datepicker:{},//日期控件校验;
			passwordstrength:{
				minLen:6,//设置密码长度最小值，默认为0;
				maxLen:18,//设置密码长度最大值，默认为30;
				trigger:function(obj,error){
					//该表单元素的keyup和blur事件会触发该函数的执行;
					//obj:当前表单元素jquery对象;
					//error:所设密码是否符合验证要求，验证不能通过error为true，验证通过则为false;	
					//console.log(error);
					if(error){
						obj.parent().find(".Validform_checktip").show();
						obj.parent().find(".passwordStrength").hide();
					}else{
						obj.parent().find(".passwordStrength").show();
					}
				}
			}
		}
	});
});
</script>
<title>教师信息编辑页面</title>
</head>
<body>
	<form action="" class="form form-horizontal responsive" id="demoform-2">
          <div class="row cl">
            <label class="form-label col-2">课程名字：</label>
            <div class="formControls col-5">
            	<input type="text" name="subjectid" id = "subjectid" value="${subjectone.subjectId}"  style="display:none;"/>
              <input type="text" class="input-text" placeholder="请输入课程名字" name="subjectname" id="subjectname" value="${subjectone.subjectName}" datatype="s2-10" nullmsg="课程名字不能为空">
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">授课老师：</label>
            <div class="formControls col-5">
              <input type="text" class="input-text" placeholder="请输入授课老师" name="teachername" id="teachername" value="${subjectone.teacherName}" datatype="s2-5" nullmsg="授课老师不能为空">
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">学分：</label>
            <div class="formControls col-5">
              <input type="text" class="input-text" autocomplete="off" placeholder="请输入学分" name="subjectcredit" id="subjectcredit" value="${subjectone.subjectCredit}" datatype="n" nullmsg="学分不能为空">
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <div class="col-10 col-offset-2">
              <input class="btn btn-primary" type="button" onclick="hehe();" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
          </div>
        </form>
</body>
<script type="text/javascript">
         function hehe() {
        	 var subjectid = document.getElementById("subjectid").value;
        	 if(subjectid==""){
        		 subjectid = 0;
        	 }
             var subjectname = document.getElementById("subjectname").value;
             var teachername = document.getElementById("teachername").value;
             var subjectcredit = document.getElementById("subjectcredit").value;
             if(subjectname==""||teachername==""||subjectcredit==""){
            	 swal("哦豁","提交失败，请重试！","error");
            	 return;
             }
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
    	    		  if(a.status == 1){
    	    			  swal({title:"提交成功！",text:"您已经向服务器了这条信息!",type:"success"}, 
    								function () {
    	    				  			parent.top.topManager.reloadPage();
    	    				  			parent.layer.closeAll();
    						    });
    	    		  }else{
    	    			  swal("哦豁","提交失败，请重试！","error");
    	    		  }
    	    	    }
    	    	  }	;											//服务器响应时完成相应操作
    	    	xmlhttp.open("post","subjectadd?subjectId="+encodeURI(encodeURI(subjectid)) + "&subjectName=" + encodeURI(encodeURI(subjectname))+ "&teacherName=" + encodeURI(encodeURI(teachername))+ "&subjectCredit=" + encodeURI(encodeURI(subjectcredit)),true);
    	    	xmlhttp.send();
		}
</script>
</html>