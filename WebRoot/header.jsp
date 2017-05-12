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
<link rel="stylesheet" type="text/css" href="css/search_cs.css" />
<script type="text/javascript" src="js/search_js.js"></script>
<script type="text/javascript">
	function getMsg() {
		$.post("isexists.action", {
			"users" : $("#users").val()
		}, function(msg) {
			if (msg.trim() == 'yes') {
				$('.userserror').html("用户名存在");
			} else {
				$('.userserror').html("账号不存在");
			}
		}, "Text");
	}

	function res() {
		$("#form1")[0].reset();
	}

	function check() {
		var users = $("#users").val();
		var pwd = $("#pwd").val();
		if (users.length == 0) {
			$(".userserror").html("账号不能为空！");
			return false;
		} else {
			$(".userserror").html("");
		}
		if (pwd.length == 0) {
			$(".error").html("密码不能为空！");
			return false;
		} else {
			$(".error").html("");
			return true;
		}
	}

	function sub() {
		var bool = check();
		if (bool == true) {
			$.ajax({
				async : false,
				type : 'post',
				url : "qtlogin.action",
				data : $("#form1").serialize(),
				dataType : "text",
				success : function(data) {
					if (data == "1") {
						window.location.href = "zxindex";
						if ($.browser.msie) {
							// 此浏览器为 IE
							window.location.href = "zxindex";
						} else {
							// 非 IE
							window.location.href = "zxindex";
						}
					} else if (data == "2") {
						$("#users").val("");
						$("#pwd").val("");
						$("#tishi").html("您的账号暂未审核通过，请向管理员申请！");
					} else {
						$("#users").val("");
						$("#pwd").val("");
						$("#tishi").html("登录失败,请重新登录！");
					}
				}
			});
		} else {
			return false;
		}
	}

	document.onkeydown = keyListener;
	function keyListener(e) {
		e = e ? e : event;
		if (e.keyCode == 13) {
			sub();
		}
	}
</script>
<!-- search工具js -->
<script type='text/javascript'>
	function search(){
		if(check()){
			$.ajax({
				url:'searchDh.action?title='+$("#search_text").val(),
				asyn:true,
				dataType:"json",
				type:"post",
				success:function(data){
					$("#result_list").html("");
					$("#result_list").append("<ul >");
					$.each(data, function (i, item) { 
						$("#result_list").append("<li><a href='dnr.action?id="+item.hid+"&did="+item.id+"'>"+item.title+"</a></li>");
			        });  
					$("#result_list").append("</ul >"); 
				}
			});
		}
	}
	$(window).scroll(function(){
		if ($(window).scrollTop() >=150){
			$('.search_k').hide(1000);
		}else{
			$('.search_k').show(1000);
		}
	});
	function check(){
		var b=$("#search_text").val();
		if(b==null||b.length==0){
			$('.search_list').hide();
			return false;
		}else{
			$('.search_list').show();
			return true;
		}
	}
</script>

<body>
	 <div class="head">
		<div class="head_nav">
			<div class="logo">
				<a href="zindex"><img src="images/logo.png" /></a>
			</div>
			<!-- 搜索工具栏 -->
					<div id="search_div" class="search_k" >
						<table border="0" align="center" cellpadding="0" cellspacing="0" class="tab_search">
			  				<tr>
								<td>
									<input type="text" name="q" title="Search" class="searchinput" id="search_text" onkeyup="setTimeout(search(),3000)"  onblur="if(this.value==''){value='- 搜索从这里开始 -';};$('.search_list').hide();" onfocus="if(this.value=='- 搜索从这里开始 -'){value='';}else{$('.search_list').show();}" value="- 搜索从这里开始 -" size="10"/>
								</td>
								<td>
									<input type="image" width="21" height="17" class="searchaction"  alt="Search" src="images/magglass.gif" border="0" hspace="2"/>
								</td>
							</tr>
						</table>
						<div id='result_list' class="search_list" onmouseout="$('.search_list').show();">
						</div>
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
					<li class="fgx"></li>-->
					<li><span class="tel">4008-520-538</span></li>
					<li></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="i_dhlist">
		<div class="i_dhdhz">
			<div class="i_zdkc">
				<ul>
					<c:forEach var="list" items="${requestScope.list }">
						<!-- <c:if test="${list.id!=1 && list.id!=2 && list.id!=3 && list.id!=4 && list.id!=38 && list.id!=39}">
							<li><a id="${list.id}" href="${list.url}">${list.name}</a></li>
						</c:if> -->
						<c:if test="${list.id==2 }">
							<li><a id="${list.id}" href="dnri.action?id=2">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==3 }">
							<li><a id="${list.id}" href="course.jsp">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==4 }">
							<li><a id="${list.id}" href="cross">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==38 }">
							<li><a id="${list.id}" href="expand">${list.name}</a></li>
						</c:if>
						<c:if test="${list.id==39 }">
							<li><a id="${list.id}" href="training">${list.name}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="i_date">
				当前日期：<span id="show"></span>
			</div>
			<script type="text/javascript">
				window.onload = function() {
					var show = document.getElementById("show");
					setInterval(function() {
						var time = new Date();
						// 程序计时的月从0开始取值后+1
						var m = time.getMonth() + 1;
						var t = time.getFullYear() + "-" + m + "-"
								+ time.getDate() + " " + time.getHours() + ":"
								+ time.getMinutes() + ":" + time.getSeconds();
						show.innerHTML = t;
					}, 1000);
				};
			</script>
		</div>
	</div>

	

</body>