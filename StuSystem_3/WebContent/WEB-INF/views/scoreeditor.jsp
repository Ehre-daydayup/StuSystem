<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>学生成绩编辑页面</title>
</head>
<body>
	<div class="row" id = "demo">
	  <div class="col-md-4"><h1>${h1}</h1></div>
	  <div class="col-md-4"></div>
	  <div class="col-md-4"></div>
	</div>
	<form action=""  class="form form-horizontal responsive" id="demoform-2">
	<c:forEach items="${scorelist}" var="sco">
          <div class="row cl">
            <label class="form-label col-3">${sco.subjectName}：</label>
            <div class="formControls col-5">
              <input type="text" name="scoreid" id = "scoreid" value="${sco.scoreId}"  style="display:none;"/>
              <input type="text" value = "${sco.score}" class="input-text" placeholder="请输入${sco.subjectName}成绩" name="scorelist" datatype="n1-3" nullmsg="成绩不能为空，可以为零" >
            </div>
            <div class="col-4">
            </div>
          </div>
    </c:forEach>
          <div class="row cl">
            <div class="col-10 col-offset-2">
              <input class="btn btn-primary" type="button" onclick="hehe();" id = "tijiao" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
          </div>
        </form>
</body>
         <script type="text/javascript">
         var list = document.getElementsByName("scorelist");
         if(list.length==0){
        	 $("input").hide();
         }
         function hehe() {
        	 var list1 = document.getElementsByName("scorelist");
        	 var list2 = document.getElementsByName("scoreid");
        	 var scorelist = [list1.length];
        	 for(var i = 0 ;i < list1.length ; i++){
         		 scorelist[i] = [list1[i].value,list2[i].value];
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
    	    	xmlhttp.open("post","scoreadd?scorelist="+scorelist ,true);
    	    	xmlhttp.send();
		}
		</script>
</html>