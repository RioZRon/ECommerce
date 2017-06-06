<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>高州农校汽车教学资源课程平台</title>

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
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="easyui/demo.css" />
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('.editor_text', {
			resizeType : 1,
			cssPath : 'kind/plugins/code/prettify.css',
			uploadJson : 'kind/jsp/upload_json.jsp',
			fileManagerJson : 'kind/jsp/file_manager_json.jsp',
			allowFileManager : true,
			height : "100px",
			width : "400px",
			afterBlur : function() {
				this.sync();
			},
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', 'image' ]
		});
	});
	$(function() {
		$("#table")
				.datagrid(
						{
							title : '题目管理',
							iconCls : 'icon-edit',//图标 
							width : 800,
							height : 420,
							nowrap : true,
							striped : true,
							border : true,
							collapsible : true,//是否可折叠的 
							fit : false,//自动大小 
							loadMsg : '数据加载中,请稍后……',
							type : "post",
							url : "qaction!showQuestions.action?hnid="
									+ '${hnid}',
							columns : [ [ {
								field : 'id',
								title : '编号',
								hidden : true
							}, {
								field : 'hnid',
								title : 'hdnrid',
								hidden : true
							}, {
								field : 'title',
								title : '题目',
								width : 120
							}, {
								field : 'type',
								title : '类型',
								width : 56
							}, {
								field : 'answer',
								title : '答案',
								width : 100
							}, {
								field : 'score',
								title : '分值',
								width : 56
							}, {
								field : 'sequence',
								title : '排序',
								width : 56
							}, {
								field : 'choise',
								title : '选项',
								//hidden : true
								width : 170
							},

							] ],
							//sortName: 'code', 
							//sortOrder: 'title', 
							remoteSort : false,
							//idField:'id', 
							singleSelect : true,//是否单选 
							pagination : true,//分页控件 
							rownumbers : true,//行号 
							toolbar : [
									{
										text : '新增',
										iconCls : 'icon-add',
										handler : function() {
											$("#dias").dialog("open").dialog(
													'setTitle', '新增用户');
											$("#up_sub").hide();
											$("#in_sub").show();
											KindEditor.html(".editor_text", "");
											$(".select_count").hide();
											$("#form").form("clear");
											$("#dhnr").val('${hnid}');
											
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var row = $("#table").datagrid(
													"getSelected");
											if (row == null) {
												alert("请先选择要修改的项");
											} else {
												$("#dias").dialog("open").dialog('refresh').dialog('setTitle','修改题目信息');
												$(".choise_txt").val("");
												KindEditor.html(".choise_txt","");
												$("#count").removeAttr('selected');
												$("#in_sub").hide();
												$("#up_sub").show();
												$(".select_count").show();
												$("#id").val(row.id);
												$("#dhnr").val('${hnid}');
												$("#choise").val(row.choise);
												$("#count").val(decstr(row.choise));
												$("#type option").attr("selected", false);
												$("#type option[value='"+ row.type+ "']").attr("selected", true);
												$("#title").val(row.title);
												KindEditor.html("#title",row.title);
												typecheck();
												$("#answer").val(row.answer);
												KindEditor.html("#answer",row.answer);
												$("#score").val(row.score);
												$("#sequence")
														.val(row.sequence);
											}
										}
									},
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											var row = $("#table").datagrid(
													"getSelected");
											if (row == null) {
												alert("请先选择要删除的项！");
											} else {
												var bool = confirm("确认删除数据吗？删除后不可恢复！");
												if (bool == true) {
													$.ajax({
																async : true,
																type : 'post',
																url : "qaction!delete.action",
																data : {"questions.id" : row.id
																},
																dataType : "text",
																success : function(
																		data) {
																	if (data == 0) {
																		alert("删除失败！");
																	} else {
																		alert("删除成功！");
																		$("#table").datagrid('reload');
																	}
																}
															});
												}
											}
										}
									} ],

						});
		//设置分页控件 
		var p = $("#table").datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
			onSelectPage : function(pageNumber, pageSize) {
				var _pageNumber = pageNumber;
				var _pageSize = pageSize;
				//异步获取数据到javascript对象，入参为查询条件和页码信息  
				$.post("qaction!showQuestions.action", {
					hnid : '${hnid}',
					pageNumber : _pageNumber,
					pageSize : _pageSize
				}, function(data) {
					//注意此处从数据库传来的data数据有记录总行数的total列  
					var total = JSON.parse(data).rows[0].total;
					$("#table").datagrid('loadData', JSON.parse(data));
					$(p).pagination({
						//更新pagination的导航列表各参数  
						total : total,//总数  
						pageSize : _pageSize,//行数  
						pageNumber : _pageNumber
					});
				});
			}
		});
	});

	//修改
	function upsub() {
		splistr();
		var bool = check();
		if (bool == true) {
			$.ajax({
				async : false,
				type : 'post',
				url : "qaction!update.action",
				data : $("#form").serialize(),
				dataType : "text",
				success : function(data) {
					if (data == "1") {
						$("#dias").dialog("close");
						alert("修改成功！");
						$("#table").datagrid('reload');
					} else {
						$("#dias").dialog("close");
						alert("修改失败！");
					}
				}
			});
		}
	}
	//新增
	function insub() {
		splistr();
		var bool = check();
		if (bool == true) {
			$.ajax({
				async : false,
				type : 'post',
				url : "qaction!insert.action",
				data : $("#form").serialize(),
				dataType : "text",
				success : function(data) {
					$("#dias").dialog("close").dialog('refresh');
					if (data == "1") {
						alert("新增成功！");
						$("#table").datagrid('reload');
					} else {
						alert("新增失败！");
					}
				}
			});
		}
	}

	//进行表单验证
	function check() {
		var title = $("#title").val();
		//alert(title);
		if (title.length == 0) {
			alert("题目必须填写！");
			$("#title").focus();
			return false;
		} else {
			return true;
		}
	}
	
	//题型识别
	function typecheck(){
		if ($("#type option:selected").val() == "选择题"
				|| $("#type option:selected").val() == "多选题") {
			gradeChange();
			$(".select_count").show();
		} else {
			$(".select_count").hide();
			$(".select_tr").hide();
		}
	}
	
	//选项数目识别
	function gradeChange() {
		var count=$("#count option:selected").val();
		$(".select_tr").hide();
		for(var i=1;i<=count;i++){
			$("#choisetr_"+i).val(i);
			KindEditor.html("#choisetr_"+i,i);
			$("#choisetr_"+i).show();
		}
	}
	//拼接选项内容
	function splistr(){
		var count = $("#count option:selected").val();
		var str="";
		for(var i=1;i<=count;i++){
			str+=$("#choise_"+i).val();
			if(i==count){
				$("#choise").val(str);
				return str;
			}
			str+="|";
		}
	}
	//拆解选项内容
	function decstr(str){
		var s=str.split("|");
		for(var i=1;i<=s.length;i++){
			$("#choise_"+i).val(s[i-1]);
			KindEditor.html("#choise_"+i,s[i-1]);
		}
		return s.length;
	}
</script>
</head>

<body>
	<input class="easyui-linkbutton" type="button" value="刷新本页"
		onclick="location.reload();" style="padding: 5px;float: right;" />
	<input type="hidden" id="hnid">
	<table id="table"></table>

	<div id="dias" class="easyui-dialog"
		style="width: 800px; height: 700px; padding: 10px 20px; top: 50px "
		data-options="closed:true,modal:true">
		<form id="form" style="margin-top: 30px" method="post">
			<table align="center" id="table_form">
				<tr>
					<td id="tiuser" style="color: #f00"></td>
				</tr>
				<tr>
					<td><span>类型：</span> <input type="hidden" id="id"
						name="questions.id" /> 
						<input type="hidden" id="dhnr"
						name="questions.dhnr.id" />
						<input type="hidden" id="choise"
						name="questions.choise" />
						</td>
					<td><select id="type" name="questions.type" onchange="typecheck()"
						style="width:100px;height:30px">
							<option value="选择题">选择题</option>
							<option value="多选题">多选题</option>
							<option value="填空题">填空题</option>
							<option value="简答题">简答题</option>
					</select> <span class="select_count" style="display:none;">选项数目： <select id="count"
							onchange="gradeChange()"  style="width:100px;height:30px">
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
						</select>
					</span></td>
				</tr>
				<tr>
					<td><span>题目：</span></td>
					<td><textarea id="title" class="editor_text"
							name="questions.title"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr>

				<tr>
					<td><span>答案：</span></td>
					<td><textarea id="answer" class="editor_text"
							name="questions.answer"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr>
			 	<tr id="choisetr_1" class="select_tr"  style="display:none;">
					<td><span>选项A：</span></td>
					<td><textarea id="choise_1" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr>
				<tr id="choisetr_2" class=" select_tr"  style="display:none;">
					<td><span>选项B：</span></td>
					<td><textarea id="choise_2" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr> 
				<tr id="choisetr_3" class=" select_tr"  style="display:none;">
					<td><span>选项C：</span></td>
					<td><textarea id="choise_3" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr> 
				<tr id="choisetr_4" class=" select_tr"  style="display:none;">
					<td><span>选项D：</span></td>
					<td><textarea id="choise_4" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr> 
				<tr id="choisetr_5" class=" select_tr"  style="display:none;">
					<td><span>选项E：</span></td>
					<td><textarea id="choise_5" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr> 
				<tr id="choisetr_6" class=" select_tr" style="display:none;">
					<td><span>选项F：</span></td>
					<td><textarea id="choise_6" class="editor_text choise_txt"
							style="width:700px;height:200px;visibility:hidden;"></textarea></td>
				</tr> 
				<tr>
					<td><span>分值：</span></td>
					<td><input type="text" id="score" name="questions.score" />
				</tr>
				<tr>
					<td><span>排序：</span></td>
					<td><input type="text" id="sequence" name="questions.sequence" />
				</tr>
			</table>
			<div style="text-align:center;padding:5px" id="up_sub">
				<input class="easyui-linkbutton" type="button" value="确认修改"
					style="padding: 5px;" onclick="upsub()" />
			</div>
			<div style="text-align:center;padding:5px" id="in_sub">
				<input class="easyui-linkbutton" type="button" value="保存/新增"
					style="padding: 5px;" onclick="insub()" />
			</div>
		</form>
	</div>
</body>
</html>
