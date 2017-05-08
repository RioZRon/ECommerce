<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <div class="zcbd">
    	<form id="form" class="zcbdform">
    		 <table align="center">
   		 		<c:forEach var="list" items="${requestScope.list }">
   		 			<input type="hidden" id="id" name="id" value="${list.id}" readonly="readonly"/>
   		 			<tr>
	    		 		<td>账号：</td>
	    		 		<td><input type="text" id="users" name="users" onblur="userblur()" value="${list.users}"/></td>
	    		 		<td><span style="color: red;width: auto;display: block;" id="user"></span></td>
	    		 	</tr>
	    		 	<tr>
	    		 		<td>密码：</td>
	    		 		<td><input type="text" id="pwd" name="pwd" value="${list.pwd}"/></td>
	    		 		<td><span style="color: red;width: auto;display: block;" id="pwds"></span></td>
	    		 	</tr>
	    		 	<tr>
	    		 		<td>名称：</td>
	    		 		<td><input type="text" id="name" name="name" value="${list.name}"/></td>
	    		 		<td><span style="color: red;width: auto;display: block;" id="names"></span></td>
	    		 	</tr>
	    		 	<tr>
	    		 		<td>审核状态：</td>
	    		 		<td><input type="text" id="num" style="background: #f2eada;" name="num" value="${list.num}" readonly="readonly"/></td>
	    		 	</tr>
	    		 	<tr>
	    		 		<td>权限：</td>
	    		 		<td><input type="text" id="admin" style="background: #f2eada;" name="admin" value="${list.admin}" readonly="readonly"/></td>
	    		 	</tr>
   		 		</c:forEach>
    		 </table>
	        <div align="center">
	        	<input class="easyui-linkbutton" type="reset" value="清除" style="padding: 4px;"/>
	            <input class="easyui-linkbutton" type="button" onclick="sub()" value="提交" style="padding: 4px;"/>
	            
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
					url : "login!update.action",
					data : $("#form").serialize(),
					dataType:"text",
					success : function(data) {
						if(data=="1"){
				        	var bool=confirm("修改成功！，是否停留本页？");
				        	if(bool==true){
				        		
				        	}else{
								parent.window.closetabs("密码修改");		        	
				        	}
				        }else{
				        	alert("修改失败！");
				        }
					}
	    		});
    		}
    	}
    	
    	
    </script>
  </body>
</html>
