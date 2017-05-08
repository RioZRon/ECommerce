<%@page import="java.io.PrintWriter"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>电商平台</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />

<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style2.css" />
<link rel="stylesheet" href="css/style3.css" />
<link rel="stylesheet" href="css/pub.css" />
<link rel="stylesheet" href="css/guan.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/jPages.css" />


<script type="text/javascript" src="js/urchin.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/pub.js"></script>
<script type="text/javascript" src="js/jPages.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/layer.min.js"></script>
<script type="text/javascript" src="js/close.js"></script>

</head>


<body class="page_body">

	<!-- 头部 -->
	<s:action name="heads" executeResult="true" />


	<div  class="page_nav">
		<div class="page_nav_l">
			<div class="location">
				<a href="zindex">首页</a>&gt;<a href="dnri.action?id=2">
					${requestScope.title }</a>&gt;<span>${requestScope.name }</span>
			</div>
			<c:if
				test="${requestScope.listdan==null||fn:length(requestScope.listdan) == 0}">
				<script>
					$(function() {
						$("div.holder").jPages({
							containerID : "itemContainer",
							perPage : 5
						});
					});
				</script>
				<div class="page_list">
					<ul id="itemContainer">
						<c:forEach var="list" items="${requestScope.listlie }">
							<c:if test="${list.img!=null||fn:length(list.img)!=0}">
								<li>
									<div class="page_list_nr">
										<div class="page_list_nr_pic">
											<a href="dnri.action?id=${id}&did=${list.id}"><img
												src="${list.img}" /></a>
										</div>
										<div class="page_list_nr_wz">
											<h3>
												<a href="dnri.action?id=${id}&did=${list.id}">${list.title}</a>
											</h3>
											<p
												style="width:620px; height:70px; display:block; 
													overflow: hidden;">${list.features}</p>
										</div>
									</div>
								</li>
							</c:if>

							<c:if test="${list.img==null||fn:length(list.img)==0}">
								<li>
									<div class="page_list_nr">
										<div class="page_list_nr_pic">
											<a href="dnri.action?id=${id}&did=${list.id}"><img
												src="images/001.jpg" /></a>
										</div>
										<div class="page_list_nr_wz">
											<h3>
												<a href="dnri.action?id=${id}&did=${list.id}">${list.title}</a>
											</h3>
											<p
												style="width:620px; height:70px; display:block; 
													overflow: hidden;">${list.features}</p>
										</div>
									</div>
								</li>
							</c:if>

						</c:forEach>
					</ul>
					<div class="holder"></div>
				</div>
			</c:if>

			<c:if
				test="${requestScope.listdan!=null||fn:length(requestScope.listdan) != 0}">
				<div class="flash">
					<c:forEach var="list" items="${requestScope.listdan}">
						<h2>${list.title}</h2>

						<!--${list.text}-->
						<c:if test="${list.img==null||fn:length(list.img)==0}">
							<p>${list.text}</p>
						</c:if>
						<c:if test="${list.img!=null||fn:length(list.img)!=0}">
							<p>${list.text}</p>
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>



		<!--右边内容-->
		<div class="page_nav_r">
			<div class="recommended">
				<h3>最新推荐</h3>
			</div>
			<div class="recommended_nr">
				<ul>
					<c:forEach var="list" items="${requestScope.listlie }">
						<li><a href="dnri.action?id=${id}&did=${list.id}">${list.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="recommended">
				<h3>课程推荐</h3>
			</div>
			<div class="kctj">
				<ul>
					<li><a href="dnr.action?id=26"><img src="images/006.jpg" />图形图像处理</a></li>
					<li><a href="dnr.action?id=27"><img src="images/007.jpg" />电子商务基础</a></li>
					<li><a href="dnr.action?id=28"><img src="images/008.jpg" />网络营销</a></li>
					<li><a href="dnr.action?id=29"><img src="images/009.jpg" />网站基础运营与维护</a></li>
				</ul>
			</div>
			<!-- <div class="recommended">
				<h3>热门文章</h3>
			</div>
			<div class="recommended_nr">
				<ul>
					<li><a href="#">京东众筹是什么意思?</a></li>
					<li><a href="#">详解滴滴代驾收费标准</a></li>
					<li><a href="#"> 农村淘宝2.0项目是什么，村淘合伙人怎么当</a></li>
					<li><a href="#">2016腾讯QQ公众号平台账号注册申请条件与</a></li>
					<li><a href="#">2015年物流快递过年放假时间表（最新版）</a></li>
					<li><a href="#">微信朋友圈广告费多少？</a></li>
					<li><a href="#">2016年抢红包活动全民活动等你来抢！</a></li>
					<li><a href="#">货车帮运营模式是什么?</a></li>
				</ul>
			</div> -->
		</div>
	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
