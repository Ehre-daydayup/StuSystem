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
	<form action="mmxg" method="post" class="form form-horizontal responsive" id="demoform-2">
          <div class="row cl">
            <label class="form-label col-2">旧密码：</label>
            <div class="formControls col-5">
              <input type="text" name="userId" id = "userId" value="${userbean.userId}"  style="display:none;"/>
              <input type="text" name="admin" id = "admin" value="${userbean.admin}"  style="display:none;"/>
              <input type="password" class="input-text" placeholder="请输入旧密码" name="password" id="password" datatype="*6-16" nullmsg="旧密码不能为空"  value = "">
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
          <label class="form-label col-2">新密码：</label>
            <div class="formControls col-5">
              <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="xmm" id="password1" datatype="*6-18" nullmsg="请输入密码！" >
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <label class="form-label col-2">密码验证：</label>
            <div class="formControls col-5">
              <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password2" id="password2" recheck="xmm" datatype="*6-18" nullmsg="请再输入一次密码！" errormsg="您两次输入的密码不一致！" >
            </div>
            <div class="col-5">
            </div>
          </div>
          <div class="row cl">
            <div class="col-10 col-offset-2">
              <input class="btn btn-primary" type="submit" onclick="tijiao();" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
          </div>
        </form>
</body>
<script type="text/javascript">

if("${status}" == '1'){
	swal({title:"密码修改成功！",text:"您已经向服务器了这条信息!",type:"success"}, 
			function () {
	  			location.href = "dlmmxg";
	    });
	
}else if("${status}" == '0'){
	swal("哦豁","修改失败失败，请确保密码输入正确！","error");
}else{}

</script>
</html>