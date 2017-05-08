<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css"/>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="easyui/demo.css"/>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript">
		var setting = {
			view: {
				selectedMulti: false,
				addDiyDom: addDiyDom,
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom
			},
			async: {
				enable: true,
				url:"dhtree!select.action",
				autoParam:["id"],
				otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filter
			},
			callback: {
				//单击左键
				onClick: zTreeOnClick,
				//异步加载后
				onAsyncSuccess: zTreeOnAsyncSuccess,
				
				onExpand: zTreeOnExpand,
				onCollapse: zTreeOnCollapse
			}
		};
		
		//异步加载后自动执行单击事件
		function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var cookie = $.cookie("z_tree");  
            if(cookie){  
                z_trees = JSON.parse(cookie);
                for(var i=0; i< z_trees.length; i++){  
                    var nodes = treeObj.getNodeByParam("id", z_trees[i]);
                    treeObj.expandNode(nodes, true);  
                }  
            }  
		}
		
		function zTreeOnExpand(event, treeId, treeNode){
			var cookie = $.cookie("z_tree");
			var z_trees = null;
			if(cookie){
				z_trees = JSON.parse(cookie);
			}
			if(!z_trees){
				z_trees = new Array();
			}
			if(jQuery.inArray(treeNode.id, z_trees)<0){
				z_trees.push(treeNode.id);
			}
			$.cookie("z_tree", JSON.stringify(z_trees))
		}
		
		function zTreeOnCollapse(event, treeId, treeNode){
			var cookie = $.cookie("z_tree");
			var z_trees = null;
			if(cookie){
				z_trees = JSON.parse(cookie);
			}
			if(!z_trees){
				z_trees = new Array();
			}
			var index = jQuery.inArray(treeNode.id, z_trees);
			z_trees.splice(index, 1);
			$.cookie("z_tree", JSON.stringify(z_trees))
		}
		
		//自定义按钮
		function addDiyDom(treeId, treeNode) {
			var aObj = $("#" + treeNode.tId);
			if ($("#diyBtn_"+treeNode.id).length>0) return;
			if ($("#inst_"+treeNode.id).length>0) return;
			if ($("#del_"+treeNode.id).length>0) return;
			if ($("#"+treeNode.id).length>0) return;
			var editStr = "<b><input id='"+treeNode.id+"' name='px' value='"+treeNode.num+"' size='4'></b>"
				+"<b class='ztde' id='del_" + treeNode.id+ "'>删除</b><b class='ztin' id='inst_"+treeNode.id
				+"'>新建子项</b><b class='ztup' id='diyBtn_"+treeNode.id+"' title='"+treeNode.name	+"'>修改</b>";
			aObj.append(editStr);
			//修改按钮
			var btn = $("#diyBtn_"+treeNode.id);
			if (btn) btn.bind("click", function(){
				var l = treeNode.level;
                var tempnode;
                if(treeNode.level!=0){
                    for(var i=0;i< l;i++){
                        if(i==0){
                            tempnode=treeNode.getParentNode();
                        }else{
                            tempnode = tempnode.getParentNode();
                        }
                    }
            	}
				del();
				$("#w").window('open');
				$("#w").attr("title","修改");
				$("#id").val(treeNode.id);
				$("#pid").val(treeNode.pId);
				$("#name").val(treeNode.name);
				$("#type").val(treeNode.type);
				$("#num").val(treeNode.num);
				$("input[name='dan'][value="+treeNode.dan+"]").attr("checked",true);
				$("input[name='encrypt'][value="+treeNode.encrypt+"]").attr("checked",true);
				
				$("#ok").click(function(){
					$.ajax({
						async : true,
						type : "post",
						url : "updatedh.action",
						data : $("#form1").serialize(),
						dataType:"text",
						success : function(data) {
							if (data > 0) {
								window.parent.resh("导航内容管理","mg/dhnr.jsp");
								location.reload();
							}else if(data==0){
								alert("修改失败！");
								location.reload();
							}
							
						}
					});
				});
			});
			//新增子项按钮
			var btn1 = $("#inst_"+treeNode.id);
			if (btn1) btn1.bind("click", function(){
                var l = treeNode.level;
                var tempnode;
                if(treeNode.level!=0){
                    for(var i=0;i< l;i++){
                        if(i==0){
                            tempnode=treeNode.getParentNode();
                        }else{
                            tempnode = tempnode.getParentNode();
                        }
                    }
            	}
				del();
				//如果已经是5级目录，就不给点击
				if(treeNode.type==5){
					alert("最多只能新增到5级目录！");
					return false;
				}else{
					$("#w").window('open');
					$("#w").attr("title","新增子项导航");
					$("#id").val(treeNode.id);
					$("#pid").val(treeNode.pId);
					$("#type").val(treeNode.type);
					$("#ok").click(function(){
						$.ajax({
							async : true,
							type : "post",
							url : "updatedh!insert.action",
							data : $("#form1").serialize(),
							dataType:"text",
							success : function(data) {
								if (data > 0) {
									window.parent.resh("导航内容管理","mg/dhnr.jsp");
									location.reload();
								}else if(data==0){
									alert("添加失败！");
									location.reload();
								}
							}
						});
					});
				}
			});
			//删除按钮
			var btn2 = $("#del_"+treeNode.id);
			if (btn2) btn2.bind("click", function(){
				if(treeNode.isParent==true){
					alert("请先删除子项才可删除此导航！");
					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
					treeObj.expandNode(treeNode,true);
					return false;
				}
				var bool=confirm("确认删除吗？");
				if(bool==true){
					$.ajax({
						async : false,
						type : "post",
						url : "updatedh!delect.action",
						data : "id="+treeNode.id+"&pid="+treeNode.pId,
						dataType:"text",
						success : function(data) {
							if (data > 0) {
								window.parent.resh("导航内容管理","mg/dhnr.jsp");
								location.reload();
							}else if(data==0){
								alert("删除失败！");
								//location.reload();
							}
						}
					});
				}
			});
			
		};
		
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if ($("#nr_"+treeNode.id).length>0) return;
			var addStr="<span style='margin-left:5px' class='button nrup' id='nr_"+treeNode.id
				+"' title='修改页面内容' onfocus='this.blur();'></span>";
			sObj.append(addStr);
			if(treeNode.isParent==true){
				$("#nr_"+treeNode.id).hide();
			}
			var btn = $("#nr_"+treeNode.id);
			if (btn) btn.bind("click", function(){
				window.parent.updh(treeNode.id,treeNode.dan,treeNode.name);
			});
		}
		//鼠标移出节点时隐藏按钮
		function removeHoverDom(treeId, treeNode) {
			$("#nr_"+treeNode.id).unbind().remove();
		};
		
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		
		//单击事件
		function zTreeOnClick(event, treeId, treeNode) {
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var isOpen=treeObj.expandNode(treeNode);
			if(isOpen==true){
				zTreeOnExpand(event, treeId, treeNode);
			}else{
				zTreeOnCollapse(event, treeId, treeNode)
			}
		};
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
		
		//添加跟节点
		function insertgen(){
			del();
			$("#w").window('open');
			$("#w").attr("title","新增根节点");
			$("#ok").click(function(){
				$.ajax({
					async : false,
					type : "post",
					url : "dhtree!insert.action",
					data : $("#form1").serialize(),
					dataType:"text",
					success : function(data) {
						if (data > 0) {
							window.parent.resh("导航内容管理","mg/dhnr.jsp");
							location.reload();
						}else if(data==0){
							alert("添加失败！");
							location.reload();
						}
					}
				});
			});
		}
		
		//初始化公用表格数据
		function del(){
			$("#id").val("");
			$("#pid").val("");
			$("#type").val("");
			$("#name").val("");
		}
		
		//排序按钮
		function butpx(){
			var li=document.getElementsByName("px");
			for(var i=0;i<li.length;i++){
				$.ajax({
					async : false,
					type : "post",
					url : "dhtree.action",
					data : {"id":li[i].id,"num":li[i].value},
					dataType:"text",
					success : function(data) {
						location.reload();
					}
				});
			}
		}
	</script>
<style type="text/css">
body{ background: #f1f1f1;}
.ztree li{  padding:5px 0px;}
.ztree li:hover{background: #FFE6B0;}
.ztree li ul li:hover{background: #fff;}
.ztree li ul li ul li:hover{background:#FFE6B0;}
.ztree li ul li ul li ul li:hover{background:#fff;}
.ztree li ul{margin-top: 5px;}
.ztree li b{ float: right; font-weight: normal; margin-right: 40px; cursor: pointer; color:#3186c8;}
.ztree li b:hover{ text-decoration: underline; color: #f00;}
</style>
  </head>
  
  <body>
  <input class="easyui-linkbutton" type="button" value="刷新本页" onclick="location.reload();" style="padding: 5px;float: right;"/>
	<a onclick="insertgen()"><img src="images/tjnr.jpg" /></a>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree" style="width:100%"></ul>
	</div>
	<input class="easyui-linkbutton" type="button" value="排序" onclick="butpx()" style="padding: 5px;float: right;margin-right:20px;"/>
	<div id="w" title=" " class="easyui-window" data-options="modal:true,closed:true" style="width:300px;height:200px;padding:5px;top:30px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:10px;">
				<form style="text-align: center;" id="form1">
				<input type="hidden" id="id" name="id"/>
				<input type="hidden" id="pid" name="pid"/>
				<input type="hidden" id="type" name="type"/>
				<input type="hidden" id="num" name="num"/>
				名称:<input id="name" name="name"/><br/><br/>
				
				是否单页面:<input class="radiox" type="radio" name="dan" value="yes" checked="checked"/>
				是<input class="radiox" type="radio" name="dan" value="no"/>否
				<br/><span style="color: red;">如果有多个内容请选否，单个内容请选是</span>
				<!-- <br/>
				是否公开:<input class="radiox" type="radio" name="encrypt" value="yes" checked="checked"/>
				是<input class="radiox" type="radio" name="encrypt" value="no"/>否
				<br/><span style="color: red;">如果公开，请选是，不公开请选否</span> -->
				</form>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#w').window('close')" style="width:80px">关闭</a>
				<a id="ok" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" style="width:80px">确定</a>
			</div>
		</div>
	</div>
	
  </body>
  
</html>
