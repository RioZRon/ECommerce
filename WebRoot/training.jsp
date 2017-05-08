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


<body>
	
	<!-- 头部 -->
	<s:action name="heads" executeResult="true" />

	<div class="page_nav">
		<!--左边内容-->
		<div class="page_nav_l">
			<div class="location">
				<a href="#">首页</a>&gt;<span>电商培训</span>
			</div>

			<div class="px_banner">
				<a href="10-2.html"><img src="images/page_banner.jpg" /></a>
			</div>

			<div class="allmenu" data-pid="${map['课程中心'].id }" id="${map['课程中心'].id }">
				<ul class="allmenu_ul">
					<li><strong>课程分类：</strong></li>
					<li><a href="dnr.action?id=25">现代商务基础</a></li>
					<li><a href="dnr.action?id=26">图形图像处理</a></li>
					<li><a href="dnr.action?id=27">电子商务基础</a></li>
					<li><a href="dnr.action?id=28">网络营销</a></li>
					<li><a href="dnr.action?id=29">网站基础运营与维护</a></li>
					<li><a href="dnr.action?id=30">网店经营管理</a></li>
					<li><a href="dnr.action?id=31">电子商务综合实训</a></li>
					<li><a href="dnr.action?id=32">现代物流与仓储技术</a></li>
					<li><a href="dnr.action?id=33">数据库原理及应用</a></li>
				</ul>
			</div>
			<script>
			$(function() {
				//电商培训
				/*$.get("/ECommerce/findDhnrById",{
						"id" : $(".allmenu").attr("id") * 1
					},function(data) {
						//课程分类
						$.each(data,function(index, value) {
							$(".allmenu_ul").append("<li><a href='dnr.action?did=@id&id=@pid'>@title</a></li>"
								.replace("@id",value.id).replace("@pid",$(".allmenu").attr("data-pid"))
								.replace("@title",value.title).replace("@text",value.text));
					});
				});
				//视频
				$.get("/ECommerce/findDhnrById",{
					"id" : $(".menulist").attr("id") * 1
				},function(data) {
					$.each(data,function(index, value) {
						$(".menulist_ul").append("<li><a href='dnr.action?did=@id&id=@pid'>@title</a></li>"
							.replace("@id",value.id).replace("@pid",$(".menulist").attr("data-pid"))
							.replace("@title",value.title).replace("@text",value.text));
				});
			  });*/
				//最新推荐
				$.get("/ECommerce/findDhnrById",{
					"id" : $(".recommended_nr").attr("id") * 1
				},function(data) {
					$.each(data,function(index, value) {
						$(".recommended_ul").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
							.replace("@id",value.id).replace("@pid",$(".recommended_nr").attr("data-pid"))
							.replace("@title",value.title).replace("@text",value.text));
				});
			  });
				
			});
			</script>
			
			<div class="menulist" data-pid="${map['电商培训'].id }" id="${map['电商培训'].id }">
				<ul>
					<li><a href="dnr.action?id=137"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=137">图形图像实战微课培训【南拓教育】</a><span>免费学习</span></li>
					<li><a href="dnr.action?id=138"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=138">ps特效制做案例【南拓教育】</a><span>免费学习</span></li>
					<li><a href="dnr.action?id=139"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=139">SEO优化策略【南拓教育】</a><span>免费学习</span></li>
					<li><a href="dnr.action?id=140"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=140">超强网店经营教程【南拓教育】</a><span>免费学习</span></li>
					<li><a href="dnr.action?id=141"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=141">淘宝开店专业培训【南拓教育】</a><span>免费学习</span></li>
					<li><a href="dnr.action?id=142"><img src="images/011.jpg" /></a><a
						class="jsx" href="dnr.action?id=142">网上开店美工设计实战操作培训【南拓教育】</a><span>免费学习</span></li>
				</ul>
			</div>
		</div>
		<!--右边内容-->
		<div class="page_nav_r">
			<div class="recommended">
				<h3>最新推荐</h3>
			</div>
			<div class="recommended_nr" data-pid="${map['拓展中心'].id }" id="${map['O2O电商'].id }">
				<ul class="recommended_ul">
					
				</ul>
			</div>
			<div class="recommended">
				<h3>课程推荐</h3>
			</div>
			<div class="kctj">
				<ul>
					<li><a href="dnr.action?id=26"><img src="images/006.jpg" />图像图像处理</a></li>
					<li><a href="dnr.action?id=27"><img src="images/007.jpg" />电子商务基础</a></li>
					<li><a href="dnr.action?id=28"><img src="images/008.jpg" />网络营销</a></li>
					<li><a href="dnr.action?id=29"><img src="images/009.jpg" />网站基础运营与维护</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
