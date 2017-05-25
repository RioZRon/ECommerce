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
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>

<body>
	<!-- 头部 -->
	<s:action name="heads" executeResult="true" />

	<!--中间内容-->
	<div class="page_kjds">
		<div class="kjds_nav">
		
			<!--国际站-->
			<div class="kjds_gjz">
				<div class="kjds_tit">
					<h3>
						${map['国际站'].name }<span>The international standing</span><a class="alertwh">更多>></a>
					</h3>
				</div>
				<div class="kjds_gjz_l">
					<a class="alertwh"><img src='images/ban-0.jpg'/></a>
				</div>					
				<div class="kjds_gjz_r" data-pid="${map['跨境电商'].id }" id="${map['国际站'].id }">
					
				</div>
			</div>
			
			
			<script>
		$(function() {
			$(".alertwh,.kjds_gjz_r,.kjds_gjz_rs,.kjds_gjz_ry").click(function(){
				alert("开发中，敬请期待...");
			});
			
			
			//跨境电商
			$.get("/ECommerce/findDhnrById",{
					"id" : $(".kjds_gjz_r").attr("id") * 1
				},function(data) {
					$.each(data,function(index, value) {
						/*$(".kjds_gjz_l").append("<a href='dnr.action?did=@id&id=@pid'><img src='@img'/></a>"
								.replace("@id",value.id).replace("@pid",$(".kjds_gjz_r").attr("data-pid"))
								.replace("@img",vlaue.img));*/
						//国际站
						$(".kjds_gjz_r").append("<div class='kjds_gjz_r_p'><a><img src='@img'/>@title</a></div>"
								.replace("@id",value.id).replace("@pid",$(".kjds_gjz_r").attr("data-pid"))
								.replace("@img",value.img).replace("@title",value.title));
				});
			});
			//速卖通
			$.get("/ECommerce/findDhnrById",{
					"id" : $(".kjds_gjz_rs").attr("id") * 1
				},function(data) {
					$.each(data,function(index, value) {
						/*$(".kjds_gjz_l").append("<a href='dnr.action?did=@id&id=@pid'><img src='@img'/></a>"
								.replace("@id",value.id).replace("@pid",$(".kjds_gjz_r").attr("data-pid"))
								.replace("@img",vlaue.img));*/
						$(".kjds_gjz_rs").append("<div class='kjds_gjz_r_p'><a><img src='@img'/>@title</a></div>"
								.replace("@id",value.id).replace("@pid",$(".kjds_gjz_rs").attr("data-pid"))
								.replace("@img",value.img).replace("@title",value.title));
				});
			});
			
			//亚马逊
			$.get("/ECommerce/findDhnrById",{
				"id" : $(".kjds_gjz_ry").attr("id") * 1
			},function(data) {
				$.each(data,function(index, value) {
					/*$(".kjds_gjz_l").append("<a href='dnr.action?did=@id&id=@pid'><img src='@img'/></a>"
							.replace("@id",value.id).replace("@pid",$(".kjds_gjz_r").attr("data-pid"))
							.replace("@img",vlaue.img));*/
					$(".kjds_gjz_ry").append("<div class='kjds_gjz_r_p'><a><img src='@img'/>@title</a></div>"
							.replace("@id",value.id).replace("@pid",$(".kjds_gjz_ry").attr("data-pid"))
							.replace("@img",value.img).replace("@title",value.title));
			});
		});
			

		});
	</script>

			<div class="kjds_gjz">
				<div class="kjds_tit">
					<h3>
						${map['速卖通'].name }<span>Alixpress</span><a class="alertwh">更多&gt;&gt;</a>
					</h3>
				</div>
				<div class="kjds_gjz_l">
					<a class="alertwh"><img src="images/ban-1.png" /></a>
				</div>
				<div class="kjds_gjz_rs" data-pid="${map['跨境电商'].id }" id="${map['速卖通'].id }">
					
				</div>
			</div>

			<div class="kjds_gjz">
				<div class="kjds_tit">
					<h3>
						${map['亚马逊'].name }<span>Amazon</span><a class="alertwh">更多&gt;&gt;</a>
					</h3>
				</div>
				<div class="kjds_gjz_l">
					<a class="alertwh"><img src="images/ban-2.png" /></a>
				</div>
				<div class="kjds_gjz_ry" data-pid="${map['跨境电商'].id }" id="${map['亚马逊'].id }">
					
				</div>
			</div>

		</div>

	</div>

	<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
