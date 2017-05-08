<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>高州农校汽车教学资源课程平台</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/login/demo.css" />
<link rel="stylesheet" type="text/css" href="css/login/style.css" />
<link rel="stylesheet" type="text/css" href="css/login/animate-custom.css" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

</head>
<script type="text/javascript">
	function getMsg() {
		$.post("isexists.action", {
			"users" : $("#username").val()
		}, function(msg) {
			if (msg.trim() == 'yes') {
				//用户名存在
				$('.userserror').html("");
			} else {
				$('.userserror').html("账号不存在");
			}
		}, "Text");
	}

	function res() {
		$("#form1")[0].reset();
	}

	function check() {
		var users = $("#username").val();
		var pwd = $("#password").val();
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
				data : $("#qtlogins").serialize(),
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
						$("#username").val("");
						$("#password").val("");
						$("#tishi").html("您的账号暂未审核通过，请向管理员申请！");
					} else {
						$("#username").val("");
						$("#password").val("");
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

<body>

	<div class="i_login_bg">
		<div class="i_lo_nav">

			<div class="i_lo_box">

				<div class="container">
					<div id="container_demo">
						<div id="wrapper">
							<div id="login" class="animate form">

								<form id="qtlogins" method="post">
									<h1>高州农校汽车教学资源课程平台</h1>
									<p>
										<label for="users" class="users" data-icon="u"> 用户名</label> <input id="username" name="users"
											required="required" type="text" placeholder="请输入你的用户名"
											onblur="getMsg();" />
									</p>
									<p style="color: red;" class="userserror"></p>
									<p>
										<label for="pwd" class="youpasswd" data-icon="p">密码</label> <input id="password" name="pwd" required="required"
											type="password" placeholder="请输入你的密码" />
									</p>
									<p style="color: red;" class="error" id="tishi"></p>
									<p class="login button">
										<input type="button" value="登录" onclick="sub();" />
									</p>
								</form>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>