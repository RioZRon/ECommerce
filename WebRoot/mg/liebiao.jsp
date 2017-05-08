<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>电商平台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<style type="text/css">
.htdhz {
	width: 800px;
}

.tjnr {
	width: 800px;
	height: 30px;
	border: 1px solid #d6d6d6;
	background: #f5f5f5;
}

.tjnr a img {
	margin-left: 10px;
	margin-top: 3px;
}

.htlb ul {
	margin: 0px;
	padding: 0px;
}

.htlb ul li {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}

.htlb ul li.htbtl {
	width: 802px;
	height: 30px;
	background: #eef3f7;
	border-bottom: 1px solid #d5dfe8;
	border-top: 1px solid #fff;
}

.htlb ul li.htbt2 {
	width: 802px;
	height: 30px;
	border-bottom: 1px solid #fff;
	background: #f1f1f1;
}

.htlb ul li.htbt2:hover {
	background: #FFE6B0;
}

.htlb ul li span {
	float: left;
	line-height: 30px;
	display: block;
	text-align: center;
	font-size: 12px;
}

.htlb ul li span.ht_01 {
	width: 350px;
}

.htlb ul li span.ht_02 {
	width: 90px;
}

.htlb ul li span.ht_03 {
	width: 90px;
}

.htlb ul li span.ht_04 {
	width: 130px;
}

.htlb ul li span.ht_05 {
	width: 140px;
	float: right;
}

.htlb ul li span.ht_05 a {
	margin: 0px 5px;
	cursor: pointer;
	color: #3186c8;
}

.htlb ul li span.ht_05 a:hover {
	text-decoration: underline;
	color: #f00;
}
</style>

<script type="text/javascript">	
		function del(id){
			var bool=confirm("确认删除数据吗？删除后不可恢复！");
   			if(bool==true){
   				$.ajax({
					async: true,
					type : "post",
					url : "dnrup!delete.action",
					data : "id="+id,
					dataType:"text",
					success : function(data) {
						if (data == 0) {
							alert("删除失败！");
						}else{
							alert("删除成功！");
							location.reload();
						}
					}
				});
   			}
		}
		
		function ref(){
			location.reload();
		}
		
	</script>
</head>

<body>
	<input class="easyui-linkbutton" type="button" value="刷新本页"
		onclick="location.reload();" style="padding: 5px;float: right;" />
	<div class="htdhz">
		<div class="tjnr">
			<a onclick="window.parent.insert('${hid}')"><img
				src="images/tjnr.jpg" /></a>
		</div>
		<div class="htlb">
			<ul>
				<li class="htbtl"><span class="ht_01">标题</span><span
					class="ht_02">点击量</span><span
					class="ht_04">更新时间</span><span class="ht_05">管理操作</span></li>
				<c:forEach var="list" items="${requestScope.list}">
					<li class="htbt2"><span class="ht_01">${list.title}</span> <span
						class="ht_02">${list.count}</span>
						<span class="ht_04">${list.time}</span> <span class="ht_05">
							<a onclick="window.parent.update('${list.id}')">修改</a> <a
							onclick="del('${list.id}')">删除</a>
					</span></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>
