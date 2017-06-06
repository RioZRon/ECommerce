<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>南拓科技课程包教学平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="kind/themes/default/default.css" />
	<script charset="utf-8" src="kind/kindeditor.js"></script>
	<script charset="utf-8" src="kind/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kind/plugins/code/prettify.js"></script>
	
	<script charset="utf-8" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/demo.css"/>
	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="text"]', {
					cssPath : 'kind/plugins/code/prettify.css',
					uploadJson : 'kind/jsp/upload_json.jsp',
					fileManagerJson : 'kind/jsp/file_manager_json.jsp',
					allowFileManager : true,
					afterBlur : function () { this.sync(); }
				});
				K('#insertimages').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							showRemote : false,
							imageUrl : K('#img').val(),
							clickFn : function(url, title, width, height, border, align) {
								$("#img").textbox('setValue',url);
								editor.hideDialog();
							}
						});
					});
				});
			});
			
			
			
			formatterDate = function(date) {
				var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
				var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
				+ (date.getMonth() + 1);
				return date.getFullYear() + '-' + month + '-' + day;
			};
			
			//window.onload = function () { 
			//	$('#time').datebox('setValue', formatterDate(new Date()));
			//}
		</script>
  </head>
  
  <body>
    <input class="easyui-linkbutton" type="button" value="刷新本页" onclick="location.reload();" style="padding: 5px;float: right;"/>
    <form name="example" id="form1">
    <c:if test="${requestScope.list!=null||fn:length(requestScope.list) != 0}">
	<c:forEach var="list" items="${requestScope.list}">
	<div id="div1" class="easyui-panel" style="width:700px;margin-bottom: 20px;height: auto;" data-options="collapsible:true,collapsible:true,minimizable:true,maximizable:true">
    	<div style="padding:10px 50px 10px 50px">
    	<table align="center">
    		<tr id="t1">
    			<td>标题:</td>
    			<td><input type="text"  class="easyui-textbox" id="title" value="${list.title}" name="title" style="width: 500px;"/></td>
    		</tr>
    		<tr id="t2">
    			<td>点击数:</td>
    			<td><input type="text"  class="easyui-textbox" id="count" name="count" value="${list.count}"/></td>
    		</tr>
    		<tr id="t3">
    			<td>发布时间:</td>
    			<td><input type="text" class="easyui-datebox" value="${list.time}" id="time" name="time"></input></td>
    		</tr>
    		<tr id="t4">
    			<td><input type="hidden" id="name" name="name" value="${list.name}"/></td>
    		</tr>
    		<tr id="t5">
	    			<td>缩略图:</td>
	    			<td><input type="text" class="easyui-textbox" id="img" name="img" value="${list.img}"/>
					<input class="easyui-linkbutton" type="button" id="insertimages" value="选择图片" style="padding: 5px;"/>
					<a  href="javascript:0" onclick="del();" style="text-decoration: none;" class="easyui-linkbutton">删除图片</a></td>
    		</tr> 
    		<tr id="t6">
    			<td>是否公开</td>
    			<td>
    			<c:if test="${list.encrypt=='yes' }">
    				<input type="radio" name="encrypt" value="no"/>否
    				<input type="radio" name="encrypt" value="yes" checked="checked"/>是
    			</c:if>
    			<c:if test="${list.encrypt=='no' }">
    				<input type="radio" name="encrypt" value="no" checked="checked"/>否
    				<input type="radio" name="encrypt" value="yes"/>是
    			</c:if>
    			<c:if test="${list.encrypt==null }">
    				<input type="radio" name="encrypt" value="no" checked="checked"/>否
    				<input type="radio" name="encrypt" value="yes"/>是
    			</c:if>
    			</td>
    		</tr>
    		
       	</table>
    	<input type="hidden" id="id" name="id" value="${list.id}">
    	<input type="hidden" id="hid" name="hid" value="${list.hid}">
    	</div>
    	</div>
			<textarea id="text" name="text" style="width:700px;height:400px;visibility:hidden;">${list.text}</textarea>
		<br />
		<!-- <input type="button"  value="提交内容" onclick="return check(1)"/> -->
		<input type="button"  value="提交内容" class="easyui-linkbutton" style="width: 100px;height: 30px"  onclick="return check()"/>
		<input type="button"  value="测试题"  class="easyui-linkbutton" style="width: 100px;height: 30px;"  onclick="insert(${list.id})"/>
		</c:forEach>
		</c:if>
		
		
		<c:if test="${requestScope.list==null||fn:length(requestScope.list) == 0}">
			<div id="div1" class="easyui-panel" style="width:700px;margin-bottom: 20px;height: auto;" data-options="collapsible:true,collapsible:true,minimizable:true,maximizable:true">
	    	<div style="padding:10px 50px 10px 50px">
	    	<table align="center">
	    		<tr id="t1">
	    			<td>标题:</td>
	    			<td><input type="text"  class="easyui-textbox" id="title" name="title" style="width: 500px;"/></td>
	    		</tr>
	    		<tr id="t2">
	    			<td>点击数:</td>
	    			<td><input type="text"  class="easyui-textbox" id="count" name="count"/></td>
	    		</tr>
	    		<tr id="t3">
	    			<td>发布时间:</td>
	    			<td><input type="text" class="easyui-datebox" id="time" name="time"></input></td>
	    		</tr>
	    		<tr id="t4">
	    			<td><input type="hidden" id="name" name="name"/></td>
	    		</tr>
	    		<tr id="t5">
	    			<td>缩略图:</td>
	    			<td><input type="text" class="easyui-textbox" id="img" name="img"/>
					<input class="easyui-linkbutton" type="button" id="insertimages" value="选择图片" style="padding: 5px;"/>
					<a  href="javascript:0" onclick="del();" style="text-decoration: none;" class="easyui-linkbutton">删除图片</a></td>
    			</tr>
    			<tr id="t6">
    				<td>是否公开</td>
    				<td><input type="radio" name="encrypt" value="no" checked="checked"/>否
    				<input type="radio" name="encrypt" value="yes"/>是</td>
    			</tr>
    			
	    	</table>
	    	<%String hid=new String(request.getParameter("hid").getBytes("iso8859-1"),"utf-8"); %>
	    	<input type="hidden" id="hid" name="hid" value="<%=hid%>">
	    	</div>
	    	</div>
				<textarea id="text" name="text" style="width:700px;height:400px;visibility:hidden;"></textarea>
			<br />
			<input type="button"  value="提交内容" onclick="return check(2)"/>
		</c:if>
	</form>
	<script type="text/javascript">
	function insert(hnid){
		var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='qaction.action?hnid="+hnid+"' style='width:100%;height:100%;'></iframe>";  
			if(window.parent.$("#tt").tabs("exists","")){
				closetabs("试题管理");
			}
			window.parent.$("#tt").tabs('add',{
				title:"试题管理",
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
	}
	//删除图片
	function del(){
		$("#img").textbox('setValue',null);
	}
		function check(ever){
			var title=$("#title").val();
			var count=$("#count").val();
			var time=$("#time").datebox("getValue"); 
			var text=$("#text").val();
			var img=$("#img").val();
			if(title.length==0){
				alert("标题必须填写！");
				return false;
			}else if(time.length==0){
				alert("日期必须填写！");
				return false;
			}else if(text.length==0){
				alert("内容必须填写！");
				return false;
			}else{
				if(ever==1){
					$.ajax({
						async: true,
						type : "post",
						url : "dnrin!update.action",
						data : $("#form1").serialize(),
						dataType:"text",
						success : function(data) {
							if (data == 0) {
								alert("修改失败！");
							}else{
								alert("修改成功！");
								window.parent.refreshTab();
								parent.window.closetabs("内容修改");
							}
						}
					});
				}else{
					$.ajax({
						async: true,
						type : "post",
						url : "dnrin.action",
						data : $("#form1").serialize(),
						dataType:"text",
						success : function(data) {
							if (data == 0) {
								alert("新增失败！");
							}else{
								alert("新增成功！");
								window.parent.refreshTab();
								parent.window.closetabs("新增内容");
							}
						}
					});
				}
			}
		}
		
	</script>
  </body>
</html>
