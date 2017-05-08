<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>高州农校汽车教学资源课程平台</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="" />
<meta http-equiv="description" content="" />

</head>

<body style="background:#fff; text-align: center;">
	<div class="error">
		<img src="images/error.jpg" usemap="#Map" border="0" />
		<map name="Map" id="Map">
			<area shape="rect" coords="145,93,270,126" href="#" />
		</map>
	</div>
</body>

</html>
