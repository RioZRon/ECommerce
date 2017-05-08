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

<title>电商平台</title>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<style type="text/css">
body {
	background: #ebebeb;
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
	background: #008ead;
	width: 100%;
	height: 400px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

.u_logo {
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;
}

.p_logo {
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}

a {
	text-decoration: none;
}

.tou {
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}

.left_hand {
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}

.right_hand {
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}

.initial_left_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}

.initial_right_hand {
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}

.left_handing {
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}

.right_handinging {
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}

#tishi {
	color: red;
}
</style>

<script type="text/javascript">
	$(function() {
		//得到焦点
		$("#pwd").focus(function() {
			$("#left_hand").animate({
				left : "150",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 140) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-64",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -70) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#pwd").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:100px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-112px;top:-12px");
		});

	});
</script>

<script type="text/javascript">
	function res() {
		$("#login")[0].reset();
	}

	function check() {
		var users = $("#users").val();
		var pwd = $("#pwd").val();
		if (users.length == 0) {
			alert("用户名不能为空！");
			return false;
		}
		if (pwd.length == 0) {
			alert("密码不能为空！");
			return false;
		}
		return true;
	}

	function sub() {
		var bool = check();
		if (bool == true) {
			$.ajax({
				async : false,
				type : 'post',
				url : "login.action",
				data : $("#login").serialize(),
				dataType : "text",
				success : function(data) {
					if (data == "1") {
						window.location.href = "mg/mgindex.jsp";
						//alert("登录成功");
						if ($.browser.msie) {
							// 此浏览器为 IE
							window.location.href = "mgindex.jsp";
						} else {
							// 非 IE
							window.location.href = "mg/mgindex.jsp";
						}
					} else if (data == "2") {
						res();
						$("#tishi").html("此账号权限不足");
					} else {
						res();
						$("#tishi").html("登录失败，账号或密码错误");
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

	/*document.onkeydown = function(event) {
		e = event ? event : (window.event ? window.event : null);
		if (e.keyCode == 13) {
			//执行的方法
			sub();
		}
	}*/
</script>

</head>
<body>
	<div class="top_div"></div>
	<div
		style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 220px; text-align: center;">
		<div style="width: 165px; height: 96px; position: absolute;">
			<div class="tou"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>

		<form id="login" method="post">
			<p style="padding: 30px 0px 10px; position: relative;">
				<span class="u_logo"></span> <input class="ipt" type="text"
					required="required"  name="users" id="users" placeholder="请输入登录名" />
			</p>			
			<p id="uname"></p>

			<p style="position: relative;">
				<span class="p_logo"></span> <input class="ipt" type="password"
					required="required" name="pwd" id="pwd" placeholder="请输入密码" />
			</p>
			<p id="upwd"></p>

			<p id="tishi" class="login_wzbt"></p>

			<p style="margin-top: 15px;margin-bottom: 8px;margin-left: 215px;">
				<button style="height: 30px;width:60px;" onclick="res()">重置</button>
				<input style="height: 30px;width:60px;" type="button"
					value="登录" onclick="sub();" />
			</p>
			<hr />
			<p style="font-size: 16px;margin-top: 6px;display: block;float: right; margin-right: 30px;">
				技术支持：<a href="http://www.gznantuo.com" target="_blank">南拓科技</a>
			</p>
		</form>

	</div>
	<div style="text-align:center;"></div>

</body>
</html>
