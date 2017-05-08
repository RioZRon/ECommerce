<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>电商平台</title>
    
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link rel="stylesheet" type="text/css" href="../css/style.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/demo.css"/>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
  </head>
  
  <body>
  <input class="easyui-linkbutton" type="button" value="刷新本页" onclick="location.reload();" style="padding: 5px;float: right;"/>
  <span style="color: #f00;">提示：所注册账号皆要有管理员审批通过才可使用！</span>
    <div class="zcbd">
    	<form id="form" class="zcbdform">
    		 <table align="center">
    		 	<tr>
    		 		<td>账号：</td>
    		 		<td><input type="text" id="users" name="users" onblur="userblur()"/></td>
    		 		<td><span style="color: red;width: auto;display: block;" id="user"></span></td>
    		 	</tr>
    		 	<tr>
    		 		<td>密码：</td>
    		 		<td><input type="text" id="pwd" name="pwd"/></td>
    		 		<td><span style="color: red;width: auto;display: block;" id="pwds"></span></td>
    		 	</tr>
    		 	<tr>
    		 		<td>名称：</td>
    		 		<td><input type="text" id="name" name="name"/></td>
    		 		<td><span style="color: red;width: auto;display: block;" id="names"></span></td>
    		 	</tr>
    		 </table>
	        <div align="center">
	        	<input class="easyui-linkbutton" type="reset" value="清除" style="padding: 5px;"/>
	            <input class="easyui-linkbutton" type="button" onclick="sub()" value="注册" style="padding: 5px;"/>
	            
	        </div>
    	</form>
    </div>
    <script type="text/javascript">
    	function userblur(){
    		var users=$("#users").val();
    		$.ajax({
    			async: false,
				url : "login!name.action",
				data : "users="+users,
				dataType:"text",
				success : function(data) {
					if(data=="1"){
						$("#users").val("");
						$("#user").html("用户名已被使用！");
					}else{
						$("#user").html("");
					}
				}
    		});
    	}
    	
    	function check(){
   		  //进行表单验证
	        var users=$("#users").val();
	        var pwd=$("#pwd").val();
	        var name=$("#name").val();
	        if(users.length==0){
	        	$("#users").focus();
	        	$("#user").html("用户名必须填写！");
	        	return false;
	        }else if(pwd.length==0){
	        	$("#pwd").focus();
	        	$("#pwds").html("密码必须填写！");
	        	return false;
	        }else if(name.length==0){
	        	$("#name").focus();
	        	$("#names").html("姓名必须填写！");
	        	return false;
	        }else{
	        	return true;
	        }
    	}
    	
    	function sub(){
    		var bool=check();
    		if(bool==true){
    			$.ajax({
	    			async: false,
	    			type:'post',
					url : "login!insert.action",
					data : $("#form").serialize(),
					dataType:"text",
					success : function(data) {
						$("#users").val("");
		        		$("#pwd").val("");
		        		$("#name").val("");
						if(data=="1"){
				        	var bool=confirm("注册成功！，是否停留本页？");
				        	if(bool==true){
				        		
				        	}else{
								parent.window.closetabs("账号注册");		        	
				        	}
				        }else{
				        	alert("新增失败！");
				        }
					}
	    		});
    		}
    	}
    	
    	
    </script>
  </body>
</html>
