<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html">
	<meta charset="UTF-8">
	<title>学生成绩管理系统|登录</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/host.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/iconfont.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/validator-0.7.3/jquery.validator.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert/sweetalert.css">
	<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator-0.7.3/jquery.validator.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/validator-0.7.3/local/zh_CN.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/host.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		function login() {
			var userid = document.getElementById("userid").value;
			var password = document.getElementById("password").value;
			var list = document.getElementsByName("inlineRadioOptions");
			var admin = null;
			if(!list[0].checked&&!list[1].checked&&!list[2].checked){
				return;
			}
			for(var i = 0 ; i < list.length ; i++){
				if(list[i].checked){
					admin = list[i].value;
				}
			}
			
			$.ajax({
				type : "POST",
				data : "userId=" + userid + "&password=" + password +"&admin=" + admin,
				dataType : "json",
				url : "<%=request.getContextPath()%>/user/loginyanzheng",
				success : function(result) {
					
					if (result.status == 0) {
						swal("哦豁","用户名或密码有误，请重新输入！","error");
					} else {
						swal({title:"太帅了",text:"登录成功，进入系统！",type:"success"}, 
							function () {
							location.href = "/StuSystem_3/user/index";
					    });
					}
				}
			});
		}
	</script>
</head>
<body bgcolor="#FFFFFF">
	<div class="middle-box text-center loginscreen  ">
        <div >
            <div  class="animated animated lightSpeedIn ">
                <i class="icon iconfont">&#xf0028;</i>
            </div>
            <h3>欢迎使用 学生成绩管理系统</h3>
            <form class=" animated rollIn" data-validator-option="{theme:'yellow_right_effect',stopOnError:true}">
                <div class="form-group">
                    <input type="text" class="form-control"  placeholder="用户名" data-rule="用户名:required;digits" id = "userid">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" data-rule="密码:required;password" id = "password">
                </div>
                <fieldset>
	                <label class="radio-inline"  >
					  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1" data-rule="checked"> 管理员
					</label>
					<label class="radio-inline">
					  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2" > 教师
					</label>
					<label class="radio-inline">
					  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="3" > 学生
					</label>
				</fieldset>
				<br/>
            	<br/>
                <button type="submit" class="btn btn-primary block full-width " onclick="login();">登 录</button>
            </form>
            <br/>
            <br/>
            <div class = "animated bounceInLeft">
                © 2016 All Rights Reserved. 邹海清|电子科成
            </div>
        </div>
    </div>
	<div class="part"></div>
</body>
</html>
