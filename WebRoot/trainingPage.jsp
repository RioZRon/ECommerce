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
<%-- <script type="text/javascript">
		function opentest() {
			$(".black_overlay,.white_content").fadeToggle(850);
		}
	</script> --%>
</head>


<body class="page_body">
	
	<s:action name="heads" executeResult="true" />

	<!--中间内容-->
	<div class="jpnav">
		<div class="page_list_left">
			<div class="page_l_tit">${title}</div>
			<div class="page_l_uli">
				<ul>
					<c:forEach var="list" items="${list}">

						<div class="left_nav shadow">
							<h2 class="havesub ${requestScope.name==list.name?'show':''}">
								<li id="one${list.id}" onmousemove="move(this,'${list.id}')"><a
									id="one_${list.id}" href="${list.url}" class="adot" title="${list.name}">${list.name}</a></li>
								<!-- href="${list.url}" -->
							</h2>

							<div class="sub2 show"
								data-name="${list.name==requestScope.name?requestScope.name:''}">

								<s:action name="dex" executeResult="true">
									<s:param name="id">${list.id}</s:param>
								</s:action>
							</div>
						</div>

					</c:forEach>
				</ul>
			</div>

			<script>
				$(function() {
					$(".left_nav .sub2").hide();
					$("[data-name='${requestScope.name}']").show();
					$(".sub2 a[data-id]").click(function(){
						alert();
					});
				});
			</script>

			<div class="page_l_tit">联系我们</div>
			<div class="page_left_cte">
				<p>联系电话：4008-520-538</p>
				<p>传 真：020-85373285</p>
				<p>电子信箱：1515964378.com</p>
				<p>地址：广州市天河区天河北路906号高科大厦A栋22楼</p>
			</div>
		</div>




		<div class="jpright">
			<div class="location">
				<span><a href="zxindex">首页</a>&nbsp;&gt;&gt;&nbsp; <a
					href="${requestScope.url}">${requestScope.title}</a>&nbsp;&gt;&gt;&nbsp;
					<a href="${requestScope.erurl}"><label>${requestScope.name}</label>
				</a> <label>${requestScope.sanname}</label> </span> 
			</div>

			<div class="zixunlist">

				<c:if
					test="${requestScope.listdan==null||fn:length(requestScope.listdan) == 0}">
					<script>
						$(function() {
							$("div.holder").jPages({
								containerID : "itemContainer",
								perPage : 12
							});
						});
					</script>
					<div class="coursePage">
						<ul id="itemContainer">
							<c:forEach var="list" items="${requestScope.listlie }">
								<c:if test="${list.img!=null||fn:length(list.img)!=0}">

									<c:if test="${sessionScope.User==null}">
										<c:if test="${list.encrypt=='yes' }">
											<li class="tplb"><a
												href="dnr.action?id=${id}&did=${list.id}"> <img
													src="${list.img}" alt="图片加载失败" /><span>${list.title}</span>
											</a></li>
										</c:if>

										<c:if test="${list.encrypt=='no' }">
											<li class="tplb"><a id="myweb-dns-a2"><i>会员专享</i> <img
													src="${list.img}" alt="图片加载失败" /><span>${list.title}
												</span> </a></li>
										</c:if>
									</c:if>

									<c:if test="${sessionScope.User!=null}">
										<li class="tplb"><a
											href="dnr.action?id=${id}&did=${list.id}"> <img
												src="${list.img}" alt="图片加载失败" /><span>${list.title}
											</span>
										</a></li>
									</c:if>
								</c:if>

								<c:if test="${list.img==null||fn:length(list.img)==0}">
																		
										<li><a href="dnr.action?id=${id}&did=${list.id}">${list.title}</a>
											<label style="font-size: 12px;">${list.time }</label></li>													
										
								</c:if>
								
							</c:forEach>
						</ul>
						<div class="holder"></div>
					</div>
				</c:if>

				<c:if test="${requestScope.listdan!=null||fn:length(requestScope.listdan) != 0}">
					<div class="flash">
						<c:forEach var="list" items="${requestScope.listdan}">
							<h2>${list.title}</h2>

							<!--${list.text}-->
							<c:if test="${list.img==null||fn:length(list.img)==0}">
								<p>${list.text}</p>
							</c:if>
							<c:if test="${list.img!=null||fn:length(list.img)!=0}">
								<p style="text-align: center;">${list.text}</p>
							</c:if>
							<!-- <button onclick="opentest()" style="width:70px;height: 40px;background-color:#00000;border-radius:5px">开始测试</button> -->
						</c:forEach>
					</div>
				</c:if>
			</div>


		</div>
		<%-- <!-- 测试页面开始 -->
		<div class="black_overlay"
		onclick="$('.black_overlay,.white_content').fadeToggle(1000)"></div>
		<%@include file="/testpage.jsp" %>
	     <!-- 测试页面结束 --> --%>
	</div>
	
	<div class="scroll" id="scroll"></div>

	<s:action name="foot" executeResult="true" />
</body>
</html>
