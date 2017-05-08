<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>

<title>课程平台</title>

</head>
<link rel="stylesheet" type="text/css" href="css/style.css" />

<body>
	<div class="head">
		<div class="head_nav">
			<div class="page_logo">
				<a href="zindex"><img src="images/logo.png" /></a>
			</div>
			<div class="top_wrap_nr">
				<ul>
					<li>您好！欢迎进入南拓科技电子商务课程平台！</li>
					<li class="fgx"></li>
					<!-- <li>
						<div class="login">
							<a href="#" id="login_box_btn">登录</a>
						</div>
						<div class="registered">
							<a href="../../paging/registered.html">注册</a>
						</div>
					</li>
					<li class="fgx"></li> -->
					<li><span class="tel">4008-520-538</span></li>
					<li></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="i_dhlist">
		<div class="page_dhdhz">
			<div class="page_zdkc">
				<ul>
					<li><a href="zindex">平台首页</a></li>
					<c:forEach var="list" items="${requestScope.list }">
						<c:if test="${list.id==2 }">
							<!-- 最新资讯 -->
							<li><a id="${list.id}" href="dnri.action?id=2">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==3 }">
							<!-- 课程中心 -->
							<li><a id="${list.id}" href="course.jsp">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==4 }">
							<!-- 跨境电商 -->
							<li><a id="${list.id}" href="cross">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==38 }">
							<!-- 拓展中心 -->
							<li><a id="${list.id}" href="expand">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==39 }">
							<!-- 电商培训 -->
							<li><a id="${list.id}" href="training">${list.name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			
		</div>
	</div>

</body>