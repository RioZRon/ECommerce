<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>课程中心</title>

<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>

<body>

	<!-- 头部 -->
	<s:action name="heads" executeResult="true" />
	
	<!--中间内容-->
	<div class="page_course">
		<ul>
			<li><a href="dnr.action?id=25"><img src="images/0051.jpg" />现代商务基础课程资源</a></li>
			<li><a href="dnr.action?id=26"><img src="images/006.jpg" />图像图像处理课程资源</a></li>
			<li><a href="dnr.action?id=27"><img src="images/007.jpg" />电子商务基础课程资源</a></li>
			<li><a href="dnr.action?id=28"><img src="images/008.jpg" />网络营销课程资源</a></li>
			<li><a href="dnr.action?id=29"><img src="images/009.jpg" />网站基础运营与维护课程资源</a></li>
			<li><a href="dnr.action?id=30"><img src="images/010.jpg" />网店经营管理课程资源</a></li>
			<li><a href="dnr.action?id=31"><img src="images/011.jpg" />电子商务综合实训课程资源</a></li>
			<li><a href="dnr.action?id=32"><img src="images/012.jpg" />现代物流与仓储技术</a></li>
			<li><a href="dnr.action?id=33"><img src="images/013.jpg" />数据库原理及应用</a></li>
		</ul>
	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
