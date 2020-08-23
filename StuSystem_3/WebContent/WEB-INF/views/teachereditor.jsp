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
	<form action=""  class="form form-horizontal responsive" id="demoform-2">
          <div class="row cl">
            <label class="form-label col-2">姓名：</label>
            <div class="formControls col-5">
              <input type="text" name="teacherid" id = "teacherid" value="${teacherone.teacherId}"  style="display:none;"/>
              <input type="text" value = "${teacherone.teacherName}" class="input-text" placeholder="请输入教师姓名" name="teachername" id="teachername" datatype="s2-5" nullmsg="教师姓名不能为空" >
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">所在系：</label>
            <div class="formControls col-5">
              <input type="text" class="input-text" placeholder="请输入教师所在系" name="teachersystem" id="teachersystem" datatype="s2-10" nullmsg="请输入所在系" value = '${teacherone.teacherSystem}' >
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">电话号码：</label>
            <div class="formControls col-5">
              <input type="text" class="input-text" autocomplete="off" placeholder="手机号码" name="teacherphone" id="teacherphone" datatype="m" nullmsg="电话号码不能为空" value = '${teacherone.teacherPhone}'>
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">邮箱：</label>
            <div class="formControls col-5">
              <input type="text" class="input-text" placeholder="@" name="teacheremail" id="teacheremail" datatype="e" nullmsg="请输入邮箱！" value = '${teacherone.teacherEmail}'>
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">教师性别：</label>
            <div class="formControls skin-minimal col-5">
              <div class="radio-box">
                <input type="radio" id="sex-1" value = "男" name="teachersex" datatype="*" nullmsg="请选择性别！" >
                <label for="sex-1">男</label>
              </div>
              <div class="radio-box">
                <input type="radio" id="sex-2" name="teachersex" value = "女">
                <label for="sex-2">女</label>
              </div>
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <div class="col-10 col-offset-2">
              <input class="btn btn-primary" type="button" onclick="hehe();" id = "tijiao" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
          </div>
        </form>
</body>
		<script type="text/javascript">
        	if('${teacherone.teacherSex}' =="女"){
        		document.getElementById('sex-2').checked="checked";
        	}else if('${teacherone.teacherSex}' =="男") {
        		document.getElementById('sex-1').checked="checked";
        	}else{
        		
        	}
        </script>
         <script type="text/javascript">
         function hehe() {
        	 var teachername = document.getElementById("teachername").value;
             var teachersystem = document.getElementById("teachersystem").value;
             var teacherid = document.getElementById("teacherid").value;
             if(teacherid==""){
            	 teacherid = 0;
             }
             var teacherphone = document.getElementById("teacherphone").value;
             var teacheremail = document.getElementById("teacheremail").value;
             var list = document.getElementsByName("teachersex");
             var teachersex = null;
             for(var i = 0 ; i < list.length ; i++){
    				if(list[i].checked){
    					teachersex = list[i].value;
    				}
    			}
             if(teachername==""||teachersystem==""||teacherphone==""||teacheremail==""||teachersex==""){
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
    	    				  			parent.top.topManager.reloadPage();//刷新父页
    	    				  			parent.layer.closeAll();
    						    });
    	    		  }else{
    	    			  swal("哦豁","提交失败，请重试！","error");
    	    		  }
    	    	    }
    	    	  }	;											//服务器响应时完成相应操作
    	    	xmlhttp.open("post","teacheradd?teacherName="+encodeURI(encodeURI(teachername)) + "&teacherSystem=" + encodeURI(encodeURI(teachersystem))+ "&teacherId=" + encodeURI(encodeURI(teacherid))+ "&teacherPhone=" + encodeURI(encodeURI(teacherphone))+ "&teacherEmail=" + encodeURI(encodeURI(teacheremail))+ "&teacherSex=" + encodeURI(encodeURI(teachersex)) ,true);
    	    	xmlhttp.send();
		}
		</script>
</html>