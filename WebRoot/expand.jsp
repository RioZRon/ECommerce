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
	
	<!--中间内容-->
	<div class="page_course">
		<div class="tbtm">
			<div class="tbtm_l">
				<div class="tbtm_l_bk" data-pid="${map['拓展中心'].id }" id="${map['淘宝天猫'].id }">
					<div class="tbtm_tit">
						<h3>
							${map['淘宝天猫'].name }<a href="${map['淘宝天猫'].url }">更多&gt;&gt;</a>
						</h3>
					</div>
					<div class="tbtm_dbt">
						<div class="tbtm_dbt_pic">
							
						</div>
						<div class="tbtm_dbt_wz">
							
						</div>
					</div>
					<div class="tbtm_xbt">
						<ul class="tbtm_xbt_ul">
							
						</ul>
					</div>
				</div>
				
				<div class="o2o_l_bk" data-pid="${map['拓展中心'].id }" id="${map['O2O电商'].id }">
					<div class="tbtm_tit" >
						<h3>
							O2O电商<a href="${map['O2O电商'].url }">更多&gt;&gt;</a>
						</h3>
					</div>
					<div class="tbtm_dbt">
						<div class="o2o_dbt_pic">
							
						</div>
						<div class="tbtm_dbt_wz">
							
						</div>
					</div>
					<div class="tbtm_xbt">
						<ul class="o2o_xbt">
							
						</ul>
					</div>
				</div>
				
				<div class="page_banner">
					<a href="10-2.html"><img src="images/page_banner.jpg" /></a>
				</div>

				<div class="wxgh_l_bk" data-pid="${map['跨境电商'].id }" id="${map['微信'].id }">
					<div class="tbtm_tit">
						<h3>
							微信<a href="${map['微信'].url }">更多&gt;&gt;</a>
						</h3>
					</div>
					<div class="tbtm_dbt">
						<div class="wxgh_dbt_pic">
							
						</div>
						<div class="tbtm_dbt_wz">
							
						</div>
					</div>
					<div class="tbtm_xbt">
						<ul class="wxgh_xbt">
							
						</ul>
					</div>
				</div>

				<div class="wxyx_l_bk" data-pid="${map['跨境电商'].id }" id="${map['商城平台'].id }">
					<div class="tbtm_tit">
						<h3>
							商城平台<a href="${map['商城平台'].url }">更多&gt;&gt;</a>
						</h3>
					</div>
					<div class="tbtm_dbt">
						<div class="wxyx_dbt_pic">
							
						</div>
						<div class="tbtm_dbt_wz">
							
						</div>
					</div>
					<div class="tbtm_xbt">
						<ul class="wxyx_xbt">
							
						</ul>
					</div>
				</div>
			</div>
			
		<script>
		$(function() {
		//拓展中心
		$.get("/ECommerce/findDhnrById",{
				"id" : $(".tbtm_l_bk").attr("id") * 1 	//淘宝天猫
			},function(data) {
				$.each(data,function(index, value) {
					$(".tbtm_dbt_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
							.replace("@id",value.id).replace("@pid",$(".tbtm_l_bk").attr("data-pid"))
							.replace("@img",value.img).replace("@title",value.title));
					$(".tbtm_xbt_ul").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
						.replace("@id",value.id).replace("@pid",$(".tbtm_l_bk").attr("data-pid"))
						.replace("@title",value.title).replace("@text",value.text));
			});
			//最新文章
			$.each(data,function(index, value) {
				$(".tbtm_r_tit_nr_tb").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
					.replace("@id",value.id).replace("@pid",$(".tbtm_r_tit_nr").attr("data-pid"))
					.replace("@title",value.title).replace("@text",value.text));
			});
		});
			
		$.get("/ECommerce/findDhnrById",{
				"id" : $(".o2o_l_bk").attr("id") * 1
			},function(data) {
				//O2O电商
				$.each(data,function(index, value) {
					$(".o2o_dbt_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
							.replace("@id",value.id).replace("@pid",$(".o2o_l_bk").attr("data-pid"))
							.replace("@img",value.img).replace("@title",value.title));
					$(".o2o_xbt").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
						.replace("@id",value.id).replace("@pid",$(".o2o_l_bk").attr("data-pid"))
						.replace("@title",value.title).replace("@text",value.text));
			});
		});
		
		$.get("/ECommerce/findDhnrById",{
			"id" : $(".wxgh_l_bk").attr("id") * 1
		},function(data) {
			//微信
			$.each(data,function(index, value) {
				$(".wxgh_dbt_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
						.replace("@id",value.id).replace("@pid",$(".wxgh_l_bk").attr("data-pid"))
						.replace("@img",value.img).replace("@title",value.title));
				$(".wxgh_xbt").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
					.replace("@id",value.id).replace("@pid",$(".wxgh_l_bk").attr("data-pid"))
					.replace("@title",value.title).replace("@text",value.text));
		});
			
		$.get("/ECommerce/findDhnrById",{
			"id" : $(".wxyx_l_bk").attr("id") * 1
		},function(data) {
			//微信营销
			$.each(data,function(index, value) {
				$(".wxyx_dbt_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
						.replace("@id",value.id).replace("@pid",$(".wxyx_l_bk").attr("data-pid"))
						.replace("@img",value.img).replace("@title",value.title));
				$(".wxyx_xbt").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
					.replace("@id",value.id).replace("@pid",$(".wxyx_l_bk").attr("data-pid"))
					.replace("@title",value.title).replace("@text",value.text));
		  });
		});
	  });
	});
	</script>
			
			<div class="tbtm_r">
				<div class="tbtm_r_tit">
					<h3>最新文章</h3>
				</div>
				<div class="tbtm_r_tit_nr" data-pid="${map['拓展中心'].id }" id="${map['淘宝天猫'].id }">
					<ul class="tbtm_r_tit_nr_tb">
						
					</ul>
				</div>

				<div class="tbtm_r_tit01">
					<h3>推荐课程</h3>
				</div>
				<div class="tbtm_r_kctj">
					<ul>
						<li><a href="dnr.action?id=26"><img src="images/006.jpg" />图形图像处理</a></li>
						<li><a href="dnr.action?id=27"><img src="images/007.jpg" />电子商务基础</a></li>
						<li><a href="dnr.action?id=28"><img src="images/008.jpg" />网络营销</a></li>
						<li><a href="dnr.action?id=29"><img src="images/009.jpg" />网站基础运营与维护</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
