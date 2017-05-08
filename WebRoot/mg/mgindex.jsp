<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HttpSession s = request.getSession(); 
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
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/jquerysession.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/mgindex.js"></script>
	<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css"/>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/zDialog.js"></script>
	<script type="text/javascript" src="js/zDrag.js"></script>
	
	<script type="text/javascript">
		//修改导航内容
		function updh(id,dan,name){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='dnrup.action?id="+id+"&dan="+dan+"' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists",name)){
				closetabs(name);
			}
			$("#tt").tabs('add',{
				title:name,
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
		}
		//列表页修改内容
		function update(id){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='dnrup.action?id="+id+"&dan=up' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists","内容修改")){
				closetabs("内容修改");
			}
			$("#tt").tabs('add',{
				title:"内容修改",
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
		}
		
		//列表页新增内容
		function insert(hid){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='mg/lie.jsp?hid="+hid+"' style='width:100%;height:100%;'></iframe>";  
				if($("#tt").tabs("exists","新增内容")){
					closetabs("新增内容");
				}
				$("#tt").tabs('add',{
					title:"新增内容",
					iconCls: 'icon-edit',
					fit:true,
					closable:true,
					content:contents,  
					cache:false
				});
		}
		//佐证材料内容修改
		function zzcl(id,dan,name){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='zznrup.action?id="+id+"&dan="+dan+"' style='width:100%;height:100%;'></iframe>";  
			if($("#tt").tabs("exists",name)){
				closetabs(name);
			}
			$("#tt").tabs('add',{
				title:name,
				iconCls: 'icon-edit',
				fit:true,
				closable:true,
				content:contents,  
				cache:false
			});
		}
		
		//佐证材料列表页修改内容
		function zzupdate(id){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='zznrup!select.action?id="+id+"' style='width:100%;height:100%;'></iframe>";  
				if($("#tt").tabs("exists","内容修改")){
					closetabs("内容修改");
				}
				$("#tt").tabs('add',{
					title:"内容修改",
					iconCls: 'icon-edit',
					fit:true,
					closable:true,
					content:contents,  
					cache:false
				});
		}
		
		//佐证材料列表页新增内容
		function zzinsert(tid){
			var contents = "<iframe name='childs' id='childs' scrolling='auto' frameborder='0'  src='mg/zzcllie.jsp?tid="+tid+"' style='width:100%;height:100%;'></iframe>";  
				if($("#tt").tabs("exists","新增内容")){
					closetabs("新增内容");
				}
				$("#tt").tabs('add',{
					title:"新增内容",
					iconCls: 'icon-edit',
					fit:true,
					closable:true,
					content:contents,  
					cache:false
				});
		}
		
		function refreshTab(){
			childs.window.ref();  
		}

		function nr(title){
			 $("#aa").accordion('select',title);
		}
		function resh(title,url){
			  var pp = $('#aa').accordion('getPanel',title); // 获取选中的 panel   
			  if (pp){   
			      pp.panel('refresh',url);  // 调用 'refresh' 方法加载新内容   
			  }  
		}
		
	</script>
	<style type="text/css">
		#aa button{margin-bottom: 5px;}
	</style>
  </head>
  
  <body class="easyui-layout">
    <div data-options="region:'west',title:'常用操作',split:true" style="width: 220px;">
    	<!-- 登录号身份权限 -->
    	<input type="hidden" value="<%=s.getAttribute("admin") %>" id="sessionadmin"/>
    	
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
		    <div title="资源管理" data-options="iconCls:'icon-large-chart',selected:true" style="padding:10px;">
		    	<button id="btn_1" lang="mg/dh.jsp" class="easyui-linkbutton" style="width: 100%" >导航管理</button>
		    	<p><a onclick="nr('用户管理')"  class="easyui-linkbutton" style="width: 100%;" >用户管理</a></p>
		    	<p><a  href="zindex" class="easyui-linkbutton" style="width: 100%;" >前台界面</a></p>
		    	<p><a  href="mg/mglogin.jsp" class="easyui-linkbutton" style="width: 100%;" >注销</a></p>
		    </div>
	
		    <div title="用户管理" data-options="iconCls:'icon-large-chart'" style="padding:10px;">
		    	<button id="btn_3" lang="mg/mgreg.jsp" class="easyui-linkbutton" style="width: 100%" >账号注册</button>
		    	<button id="btn_5" lang="login!select.action?id=<%=s.getAttribute("usersid") %>" class="easyui-linkbutton" style="width: 100%" >密码修改</button>
		    	<button id="btn_4" lang="mg/mguser.jsp" class="easyui-linkbutton" style="width: 100%" >用户管理</button>
		    </div>
		</div>
    
    </div>
    <div data-options="region:'center'" style="padding:5px;">
    	<div id="tt" class="easyui-tabs" data-options="fit:true">	</div>
    </div>
   <div id="dd"></div>
   
   <div id="menu" class="easyui-menu" style="width:150px;">
   	<div id="m-close">关闭</div>
    <div class="menu-sep"></div>
    <div id="m-closeall">全部关闭</div>
    <div id="m-closeother">除此之外全部关闭</div>
    
</div>
</body>
</html>
