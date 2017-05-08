<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>课程平台</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/scrollTop.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/gdt.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/slide.js"></script>

</head>

<body>
	<!-- 头部内容 -->
	<s:action name="head" executeResult="true" />

	<!--广告图-->
	<div class="bannerbg">
		<div class="banner">
			<!--左侧伸展导航-->
			<div class="l_szdh">
				<div class="hc_lnav jslist">
					<div class="allbtn">
						<h2>
							<a href="#"><strong>&nbsp;</strong>课程资源库<i>&nbsp;</i></a>
						</h2>
						<ul style="width:250px" class="jspop box">
							<li class=a1>
								<div class=tx>
									<a href="dnr.action?id=25"><i>&nbsp;</i>现代商务基础课程资源</a>
								</div>
								<dl>
									<dt></dt>
									<dd>
										<a href="dnr.action?id=35">电子教材</a> <a href="dnr.action?id=37">教学课件</a> <a href="dnr.action?id=36">教学案例</a> <a
											href="dnr.action?id=34">课程标准</a>
									</dd>
								</dl>
								<dl>
								</dl>
							</li>
							<li class=a2>
								<div class=tx>
									<a href="dnr.action?id=26"><i>&nbsp;</i>图形图像处理课程资源</a>
								</div>
								<dl>
									<dt></dt>
									<dd>
										<a href="dnr.action?id=59">电子教材</a> <a href="dnr.action?id=60">教学案例</a> <a href="dnr.action?id=61">教学课件</a> <a
											href="dnr.action?id=64">实训指导</a>
									</dd>
								</dl>
							</li>
							<li class=a3>
								<div class=tx>
									<a href="dnr.action?id=27"><i>&nbsp;</i>电子商务基础课程资源</a>
								</div>
								<dl>
									<dt></dt>
									<dd>
										<a href="dnr.action?id=67">电子教材</a> <a href="dnr.action?id=72">实训指导</a> <a href="dnr.action?id=73">学习拓展</a> <a
											href="dnr.action?id=71">试题库</a>
									</dd>
								</dl>
							</li>
							<li class=a4>
								<div class=tx>
									<a href="dnr.action?id=29"><i>&nbsp;</i>网站基础运营与维护</a>
								</div>
								<dl>
									<dt></dt>
									<dd>
										<a href="dnr.action?id=84">电子教材</a><a href="dnr.action?id=86">教学课件</a> <a href="dnr.action?id=89">实训指导</a>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--左侧伸展导航-->

			<!--广告图-->
			<div class="ck-slide">
				<ul class="ck-slide-wrapper">
					<li><a><img src="images/1.jpg" alt=""/></a></li>
					<li style="display:none"><a><img
							src="images/2.jpg" alt=""/></a></li>
					<li style="display:none"><a><img
							src="images/3.jpg" alt=""/></a></li>
				</ul>
			</div>
		</div>
		<script>
			$('.ck-slide').ckSlide({
				autoPlay : true
			});
		</script>
		<!--广告图结束-->
	</div>


	<!--中间内容-->
	<div class="guess">
		<!-- <div class="i_title">
			<span></span><strong>猜你喜欢</strong><a href="#">更多内容&gt;&gt;</a>
		</div>
		<div class="guess_pic">
			<ul>
				<li><img src="images/pic1.jpg" /></li>
				<li><img src="images/pic2.jpg" /></li>
				<li><img src="images/pic3.jpg" /></li>
				<li><img src="images/pic4.jpg" /></li>
				<li><img src="images/pic5.jpg" /></li>
			</ul>
		</div> -->

		<div class="i_title">
			<span></span><strong>最新资讯</strong><a href="dnri.action?id=2">更多内容&gt;&gt;</a>
		</div>
		<div class="t_news">
			
			<div class="t_news_left"  data-pid="${map['最新资讯'].id }" id="${map['资讯列表'].id }">
				<div class="t_news_pic">
					
				</div>
				<div class="t_news_nav">
					<div class="t_news_ms">
					  <div class="t_news_mse" style="height: 80px;overflow: hidden;">
					  
					  </div>
						
					</div>
					<div class="t_news_fx">
						<ul class="t_news_fxs">
							
						</ul>
					</div>
				</div>
			</div>
			
			
			<script>
		$(function() {
			//最新资讯
			$.get("/ECommerce/findDhnrById",{
					"id" : $(".t_news_left").attr("id") * 1
				},function(data) {
					$.each(data,function(index, value) {
						$(".t_news_pic").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
								.replace("@id",value.id).replace("@pid",$(".t_news_left").attr("data-pid"))
								.replace("@img",value.img));
						
						$(".t_news_mse").append("<h3><a href='dnri.action?did=@id&id=@pid'>@title</a></h3><p style='font-size:16px;'>@features</p>"
							.replace("@features",value.features.length > 300 ? value.features.substring(0,220)+ '...': value.features)
							.replace("@id",value.id).replace("@pid",$(".t_news_left").attr("data-pid"))
							.replace("@title",value.title));
						
						$(".t_news_fxs").append("<li class='t_chg'><a href='dnri.action?did=@id&id=@pid'><img src='@img'/>@title</a></li>"
								.replace("@id",value.id).replace("@pid",$(".t_news_left").attr("data-pid"))
								.replace("@img",value.img).replace("@title",value.title));
						
						$(".t_news_rights").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
								.replace("@id",value.id).replace("@pid",$(".t_news_left").attr("data-pid"))
								.replace("@img",value.img).replace("@title",value.title));
						
				});
			});

			//拓展中心
			$.get("/ECommerce/findDhnrById",{
				"id" : $(".t_news_ms2").attr("id") * 1
			},function(data) {
				$.each(data,function(index, value) {
					$(".t_news_pic2").append("<a href='dnri.action?did=@id&id=@pid'><img src='@img'/></a>"
							.replace("@id",value.id).replace("@pid",$(".t_news_ms2").attr("data-pid"))
							.replace("@img",value.img));
					
					$(".t_news_mse2").append("<h3><a href='dnri.action?did=@id&id=@pid'>@title</a></h3><p style='font-size:16px;'>@features<a href='dnr.action?did=@id&id=@pid'></a></p>"
							.replace("@features",value.features)
							.replace("@id",value.id).replace("@pid",$(".t_news_ms2").attr("data-pid"))
							.replace("@id",value.id).replace("@pid",$(".t_news_ms2").attr("data-pid"))
							.replace("@title",value.title));
					
					$(".t_news_fxs2").append("<li class='t_chg'><a href='dnri.action?did=@id&id=@pid'><img src='@img'/>@title</a></li>"
							.replace("@id",value.id).replace("@pid",$(".t_news_ms2").attr("data-pid"))
							.replace("@img",value.img).replace("@title",value.title));
					
					$(".t_news_rights2").append("<li><a href='dnri.action?did=@id&id=@pid'>@title</a></li>"
							.replace("@id",value.id).replace("@pid",$(".t_news_ms2").attr("data-pid"))
							.replace("@img",value.img).replace("@title",value.title));
					});
			});

		});
	</script>
			<div class="t_news_right">
				<ul class="t_news_rights">
					
				</ul>
			</div>
		</div>

		<div class="i_title">
			<span></span><strong>课程中心</strong><a href="dnr.action?id=3">更多内容&gt;&gt;</a>
		</div>
		<div class="i_kczx">
			<div class="i_kczx_left">
				<a href="dnr.action?id=25"><img src="images/005.jpg" /></a>
			</div>
			<div class="i_kczx_right">
				<ul>
					<li><a href="dnr.action?id=26"><img src="images/006.jpg" />图像图像处理课程资源</a></li>
					<li><a href="dnr.action?id=27"><img src="images/007.jpg" />电子商务基础课程资源</a></li>
					<li><a href="dnr.action?id=28"><img src="images/008.jpg" />网络营销课程资源</a></li>
					<li class="i_kczx_chg"><a href="dnr.action?id=29"><img
							src="images/009.jpg" />网站基础运营与维护课程资源</a></li>
					<li><a href="dnr.action?id=30"><img src="images/010.jpg" />网店经营管理课程资源</a></li>
					<li><a href="dnr.action?id=31"><img src="images/011.jpg" />电子商务综合实训课程资源</a></li>
					<li><a href="dnr.action?id=32"><img src="images/012.jpg" />现代物流与仓储技术</a></li>
					<li class="i_kczx_chg"><a href="dnr.action?id=33"><img
							src="images/013.jpg" />数据库原理及应用</a></li>
				</ul>
			</div>
		</div>

		<div class="i_banner">
			<a><img src="images/i_banner.jpg" /></a>
		</div>

		<div class="i_title">
			<span></span><strong>拓展中心</strong><a href="dnri.action?id=41">淘宝天猫</a><a href="dnri.action?id=42">O2O电商</a><a
				href="dnri.action?id=44">微信干货</a><a href="dnri.action?id=45">微信营销</a><a href="dnri.action?id=38">更多内容&gt;&gt;</a>
		</div>
		<div class="t_news2">
			<div class="t_news_left2">
				<div class="t_news_pic2">
					
				</div>
				<div class="t_news_nav2">
					<div class="t_news_ms2" data-pid="${map['拓展中心'].id }" id="${map['淘宝天猫'].id }">
					 <div class="t_news_mse2" style="height: 80px;overflow: hidden;">
					  
					  </div>
					</div>
					<div class="t_news_fx2">
						<ul class="t_news_fxs2">
						
						</ul>
					</div>
				</div>
			</div>
			<div class="t_news_right2">
				<ul class="t_news_rights2">

				</ul>
			</div>
		</div>
	</div>

<!--页脚-->
	<s:action name="foot" executeResult="true" />
</body>
</html>
