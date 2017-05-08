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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	
    <link rel="stylesheet" href="css/demo.css" type="text/css"/>
	<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css"/>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.exedit-3.5.js"></script>
	<script type="text/javascript">
	var setting = {
			async: {
				enable: true,
				url:"ztre.action",
				autoParam:["id"],
				otherParam:{"otherParam":"zTreeAsyncTest"},
				dataFilter: filter
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick,
				onAsyncSuccess: zTreeOnAsyncSuccess
			}
		};
		
		var firstAsyncSuccessFlag =0;
			function zTreeOnAsyncSuccess(event, treeId, treeNode, msg){
				if(firstAsyncSuccessFlag ==0){
					$("#treeDemo_1_switch").trigger("click");  //让系统自动执行单击事件
					firstAsyncSuccessFlag =1;
				}
			}
		
		function filter(treeId, parentNode, childNodes) {
			if (!childNodes) return null;
			for (var i=0, l=childNodes.length; i<l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}

		function beforeClick(treeId, treeNode) {
			var check = (treeNode && treeNode.isParent);
			if (!check) alert("只能选择文件夹...");
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
			$("#pid").val(treeNode.id);
			hideMenu();
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting);
		});
	</script>
	<link rel="stylesheet" href="kind/themes/default/default.css" />
	<script charset="utf-8" src="kind/kindeditor.js"></script>
	<script charset="utf-8" src="kind/lang/zh_CN.js"></script>
	<script>
			KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : false
				});
				K('#insertfile').click(function() {
					editor.loadPlugin('insertfile', function() {
						editor.plugin.fileDialog({
							fileUrl : K('#url').val(),
							clickFn : function(url, title) {
							editor.hideDialog();
							$("#url").val(url);
							//var pos = strturn(GetFileExt(url));
				          //  var file = strturn(url);
				           // var pos1 =strturn( file.replace(pos, ""));
				           // var pos2 = GetFileName(pos1);
					        //    $.post("mg/tree.jsp",{ filepath: url, swfpath: pos2 }, //要传递的数据 
							//		function(data){ 
							//			if(data==1){
							//				$("#url").attr("value","swf/"+pos2+".swf");
							//			}else{
							//				alert("文件转换失败，请重新上传！");
							//				$("#url").val("");
							//				$("#name").val("");
							//			}
							//		} 
							//	) 
							}
						});
					});
				});
			});
			
      //字符串逆转
        function strturn(str) {
            if (str != "") {
            var str1 = "";
            for (var i = str.length - 1; i >= 0; i--) {
                str1 += str.charAt(i);
            }
            return (str1);
            }
        }
      //取文件后缀名
        function GetFileExt(filepath) {
            if (filepath != "") {
                var pos = "." + filepath.replace(/.+\./, "");
                return pos;
            }
        }
        //取文件全名名称
        function GetFileName(filepath) {
            if (filepath != "") {
                var names = filepath.split("/");
                return names[names.length - 1];
            }
        }
		</script>
	</head>
  
  <body>
  <%//request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id"); 
  	String name=new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
  	
  %>
	
	<form id="form1" class="upform">
		<table class="tableup">
			<tr>
				<td><span>标题：</span></td>
				<td><input type="text" name="name" id="name"/></td>
			</tr>
			<tr>
				<td><span>存放位置：</span></td>
				<td>
					<input type="hidden" id="pid" name="pid" value="<%=id %>"/>
					<input id="citySel" type="text" readonly="readonly" value="<%=name %>" onclick="showMenu(); return false;"/>
				</td>
			</tr>
			<tr>
				<td><span>内容：</span></td>
				<td><input type="text" id="url" name="url" value="" readonly="readonly"/> 
				<input type="button" id="insertfile" value="选择文件" style="width: 80px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="subtd">
					<input type="button" onclick="res()" value="重置" style="width: 100px;"/>
	 				<input type="button" id="sub" onclick="ajaxsub()" value="提交" style="width: 100px;"/>
				</td>
			</tr>
		</table>
		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; width: 230px"></ul>
		</div>
	 	
	</form>
	
 	
	 <script type="text/javascript">

     //重置form表单
     function res(){
     	$("#name").val("");
     	$("#pid").val("");
     	$("#citySel").val("");
     	$("#url").val("");
     }
     function ajaxsub(){
     	var name=$("#name").val();
     	var pid=$("#pid").val();
     	var citySel=$("#citySel").val();
     	var url=$("#url").val();
     	if(name.length==0){
     		alert("标题必须填写！");
     		return false;
     	}else if(pid.length==0||citySel.length==0){
     		alert("存放路径有误，请重新选择！");
     		return false;
     	}else if(url.length==0){
     		alert("找不到上传的文件，请重新上传！");
     		return false;
     	}else{
     		$.ajax({
					async : true,
					type : "post",
					url : "insertzzcl.action",
					data : $("#form1").serialize(),
					dataType:"text",
					success : function(data) {
						if (data == 1) {
							alert("添加成功！");
							var p=window.parent;
							p.closedias();
						}else if(data==0){
							alert("添加失败！请重新上传");
							location.reload();
						}
					}
				});
     	}
     }
     
 </script>
  </body>
</html>
