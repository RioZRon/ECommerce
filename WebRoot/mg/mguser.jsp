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
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/demo.css"/>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#table").datagrid({ 
		        title:'用户管理', 
		        iconCls:'icon-edit',//图标 
		        width: 700, 
		        height: 420, 
		        nowrap: true, 
		        striped: true, 
		        border: true, 
		        collapsible:true,//是否可折叠的 
		        fit: false,//自动大小 
		        loadMsg:'数据加载中,请稍后……',  
		        type:"post",
		        url:"people.action",
		        columns:[[
			        {field:'id',title:'编号',hidden:true},
			        {field:'users',title:'用户名',width:120},
			        {field:'pwd',title:'密码',width:120},
			        {field:'name',title:'老师姓名',width:150},
			        {field:'num',title:'审批状态',width:120},
			        {field:'admin',title:'权限',width:170},
			    ]] ,
		        //sortName: 'code', 
		        //sortOrder: 'title', 
		        remoteSort:false,  
		        //idField:'id', 
		        singleSelect:true,//是否单选 
		        pagination:true,//分页控件 
		        rownumbers:true,//行号 
		        toolbar: [
			        { 
			            text: '新增', 
			            iconCls: 'icon-add', 
			            handler: function() { 
			            	$("#dias").dialog("open").dialog('setTitle', '新增用户');
		           			$("#up_sub").hide();
		           			$("#in_sub").show();
		           			$("#form").form("clear");
		           			$("#num").val("通过");
		           			$("#admin").val("老师");
	           				$("#btn1").val("设置未通过");
	           				$("#btn2").val("设置管理员");
			            } 
			        },
		        	{ 
		            text: '修改', 
		            iconCls: 'icon-edit', 
		            handler: function() { 
		           		var row = $("#table").datagrid("getSelected");
		           		if(row==null){
		           			alert("请先选择要修改的项");
		           		}else{
		           			$("#dias").dialog("open").dialog('setTitle', '修改用户信息');
		           			$("#in_sub").hide();
		           			$("#up_sub").show();
		           			if(row.num=="通过"||row.num=="管理员"||row.num=="系统管理员"){
		           				$("#btn1").val("设置未通过");
		           			}else if(row.num=="未通过"){
		           				$("#btn1").val("设置通过");
		           			}
		           			if(row.id=="1"){
		           				$("#btn1").hide();
		           				$("#btn2").hide();
		           			}else{
		           				$("#btn1").show();
		           				$("#btn2").show();
		           			}
		           			if(row.admin=="老师"){
		           				$("#btn2").val("设置管理员");
		           			}else{
		           				$("#btn2").val("取消管理员");
		           			}
		           		 	$("#form").form("load", row);
		           		}
		            } 
		        }, '-',{ 
		            text: '删除', 
		            iconCls: 'icon-remove', 
		            handler: function(){ 
		                var row = $("#table").datagrid("getSelected");
		                //alert(idField);
		           		if(row==null){
		           			alert("请先选择要删除的项！");
		           		}else if(row.id=="1"){
		           			alert("系统管理员不可删除！");
		           		}else{
		           			var bool=confirm("确认删除数据吗？删除后不可恢复！");
		           			if(bool==true){
		           				$.ajax({
									async: true,
									type : "post",
									url : "login!delete.action",
									data : "id="+row.id,
									dataType:"text",
									success : function(data) {
										if (data == 0) {
											alert("删除失败！");
										}else{
											alert("删除成功！");
											$("#table").datagrid('reload');  
										}
									}
								});
		           			}
		           		}
		            } 
		        }],
		         onLoadSuccess: function(data){   
		         	//$('#table').datagrid('getEditor', { index: 1, field: 'num' }).target.val("ss");
		         }
		    }); 
		
			//设置分页控件 
		    var p = $("#table").datagrid('getPager'); 
		    $(p).pagination({ 
		        pageSize: 10,//每页显示的记录条数，默认为10 
		        pageList: [10,15,20],//可以设置每页记录条数的列表 
		        beforePageText: '第',//页数文本框前显示的汉字 
		        afterPageText: '页    共 {pages} 页', 
		        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', 
		       
		    }); 
		    
		})
		function dia(id){
			var conn = "<iframe scrolling='no' frameborder='0'  src='mg/mgupuser.jsp?id="+id+"' style='width:100%;height:100%;'></iframe>";  
			$("#dias").dialog({
			    title: '佐证材料上传',
			    width: 300,
			    height: 400,
			    maximizable:true,
			    modal: true,
			    content:conn
			});
		}
		
		function btnn1(){
			var num=$("#num").val();
			if(num=="通过"){
				$("#num").val("未通过");
				$("#btn1").val("设置通过");
			}else{
				$("#num").val("通过");
				$("#btn1").val("设置未通过");
			}
		}
		
		function btnn2(){
			var admin=$("#admin").val();
			if(admin=="老师"){
				$("#admin").val("管理员");
				$("#num").val("通过");
				$("#btn2").val("取消管理员");
			}else{
				$("#admin").val("老师");
				$("#btn2").val("设置管理员");
			}
		}
	</script>
  </head>
  
  <body>
  <input class="easyui-linkbutton" type="button" value="刷新本页" onclick="location.reload();" style="padding: 5px;float: right;"/>
	<div class="easyui-panel" title="条件筛选" style="width:700px;margin-bottom: 20px;height: auto;" data-options="collapsible:true,closable:true,collapsed:true">
		<div style="padding:10px 50px 10px 50px">
	    <form id="ff" >
	    	<table cellpadding="5" align="center">
	    		<tr>
	    			<td>老师姓名(模糊查询):</td>
	    			<td><input class="easyui-textbox" type="text" name="name" ></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">查找</a>
	    </div>
	    </div>
	</div>
	<script>
		function submitForm(){
			$.ajax({
				async: false,
				type:'post',
				url : "people.action",
				data : $("#ff").serialize(),
				dataType:"text",
				success : function(data) {
				//alert(data);
					var json = $.parseJSON(data); 
					$("#table").datagrid('loadData', json);
				}
			});
		}
	</script>
	
	
	
	
	<table id="table"></table>
	<div id="dias" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px; top: 50px "data-options="closed:true,modal:true">
		<form id="form" style="margin-top: 30px" method="post">
			<table align="center">
				<tr><td id="tiuser" style="color: #f00"></td></tr>
				<tr>
					<td><span>用户名：</span></td>
					<td><input type="hidden" id="id" name="id"/>
					<input type="text" id="users" name="users" onblur="userblur()"/>
					</td>
				</tr>
				<tr>
					<td><span>密码：</span></td>
					<td><input type="text" id="pwd" name="pwd"/></td>
				</tr>
				<tr>
					<td><span>姓名：</span></td>
					<td><input type="text" id="name" name="name"/></td>
				</tr>
				<tr>
					<td><span>审核状态：</span></td>
					<td><input type="text" id="num" name="num" readonly="readonly"/>
					<input type="button" id="btn1" onclick="btnn1()" class="easyui-linkbutton" style="padding: 4px;"/></td>
				</tr>
				<tr>
					<td><span>权限：</span></td>
					<td><input type="text" id="admin" name="admin" readonly="readonly"/>
					<input type="button" id="btn2" onclick="btnn2()" class="easyui-linkbutton" style="padding: 4px;"/></td>
				</tr>
   			</table>
   			<div style="text-align:center;padding:5px" id="up_sub">
		    	<input class="easyui-linkbutton" type="button" value="确认修改" style="padding: 5px;" onclick="upsub()"/>
	    	</div>
	    	<div style="text-align:center;padding:5px" id="in_sub">
		    	<input class="easyui-linkbutton" type="button" value="保存/新增" style="padding: 5px;" onclick="insub()"/>
	    	</div>
   		</form>
	
	</div>
	 <script type="text/javascript">
    	function userblur(){
    		var users=$("#users").val();
    		$.ajax({
    			async: false,
    			type:'post',
				url : "login!name.action",
				data : "users="+users,
				dataType:"text",
				success : function(data) {
					if(data=="1"){
						$("#tiuser").text("用户名已被使用");
						$("#users").val("");
						$("#users").focus();
					}else{
						$("#tiuser").text("");
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
	        	return false;
	        }else if(pwd.length==0){
	        	$("#pwd").focus();
	        	return false;
	        }else if(name.length==0){
	        	$("#name").focus();
	        	return false;
	        }else{
	        	return true;
	        }
    	}
    	
    	function upsub(){
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
				        	$("#dias").dialog("close");
				        	alert("修改成功！");
				        	$("#table").datagrid('reload');  
				        }else{
				       		$("#dias").dialog("close");
				        	alert("修改失败！");
				        }
					}
	    		});
	    	}else{
	    		return;
	    	}
    	}
    	
    	function insub(){
    		var bool=check();
    		if(bool==true){
		        $.ajax({
	    			async: false,
	    			type:'post',
					url : "login!insert.action",
					data : $("#form").serialize(),
					dataType:"text",
					success : function(data) {
						$("#dias").dialog("close");
						if(data=="1"){
				        	alert("新增成功！");
				        	$("#table").datagrid('reload');  
				        }else{
				        	alert("新增失败！");
				        }
					}
	    		});
	    	}else{
	    		return;
	    	}
    	}
    </script>
  </body>
</html>
