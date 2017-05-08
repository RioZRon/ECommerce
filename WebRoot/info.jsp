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

<body>
	<!-- 头部 -->
	<s:action name="heads" executeResult="true" />

	<div class="page_nav">
		<!--左边内容-->
		<div class="page_nav_l">
			<div class="location">
				<a href="zindex">首页</a>&gt;<a href="dnri.action?id=2">最新资讯</a>&gt;<span>资讯列表</span>
			</div>
			<div class="page_list">
				<ul>
					<li>
						<div class="page_list_nr" data-pid="${map['最新资讯'].id }" id="${map['资讯列表'].id }">
							<div class="page_list_nr_pic">
								
							</div>
							<div class="page_list_nr_wz">

							</div>
						</div>
					</li>
					
				</ul>
			</div>
		</div>
		
		
					<script>
		$(function() {
			//最新资讯
			$.get("/ECommerce/findDhnrById",{
					"id" : $(".page_list_nr").attr("id") * 1
				},function(data) {
					//资讯列表
					$.each(data,function(index, value) {
						$(".page_list_nr_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
								.replace("@id",value.id).replace("@pid",$(".page_list_nr").attr("data-pid"))
								.replace("@img",value.img));
						
						$(".page_list_nr_wz").append("<h3><a href='dnri.action?did=@id&id=@pid'>@title</a></h3><p style='width:620px; height:70px; display:block; overflow: hidden;'>@text</p>"
							.replace("@id",value.id).replace("@pid",$(".page_list_nr").attr("data-pid"))
							.replace("@title",value.title).replace("@text",value.text));
				});
				//最新推荐	
				$.each(data,function(index, value) {
						$(".recommended_nr_ul").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
							.replace("@id",value.id).replace("@pid",$(".page_list_nr").attr("data-pid"))
							.replace("@title",value.title).replace("@text",value.text));
				});	
					
					
			});

		});
	</script>
		
		<!--右边内容-->
		<div class="page_nav_r">
			<div class="recommended">
				<h3>最新推荐</h3>
			</div>
			<div class="recommended_nr">
				<ul class="recommended_nr_ul">
					
				</ul>
			</div>
			<div class="recommended">
				<h3>课程推荐</h3>
			</div>
			<div class="kctj">
				<ul>
					<li><a href="#"><img src="images/006.jpg" />图像图像处理</a></li>
					<li><a href="#"><img src="images/007.jpg" />电子商务基础</a></li>
					<li><a href="#"><img src="images/008.jpg" />网络营销</a></li>
					<li><a href="#"><img src="images/009.jpg" />网站基础运营与维护</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
