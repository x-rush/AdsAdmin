<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<title>登陆</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="../static/css/style.css" />
		<script type="text/javascript">
			function changeImg(){
				var v = document.getElementById("verifyCodeImage");
				v.setAttribute("src","/user/getVerifyCode.do?date="+new Date());
			}
		</script>
		<script type="text/javascript" src="../static/js/dateshow.js"></script>
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								<span id="show"></span>
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="#">欢迎登录</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						登陆
					</h1>
					<h3>
						<font color="red">${err1}</font>
						<font color="red">${err2}</font>
						${reg_succ}
					</h3>
					<form action="/user/login.do" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									用户名:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="name" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									密&nbsp;&nbsp;&nbsp;码:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="pwd" />
								</td>
							</tr>
							<!-- 验证码 -->
							<tr>
								<td valign="middle" align="right">
									<img src="/user/getVerifyCode.do" 
										width="80" height="34" id="verifyCodeImage"
										onclick="changeImg();" />
								</td>
								<td valign="middle" align="right">
									<input type="text" class="inputgri" id="verifyCode" 
										name="verifyCode" maxlength="4"/>
									<font color="red">${message}</font>
								</td>
							</tr>
						</table>
						<p>
							<input type="submit" class="button" value="登陆 &raquo;" />
							<input type="reset" class="button" value="重置 &raquo;" />
						</p>
						<p>
							<a href="/page/regist.jsp">注册账号</a>
						</p>
					</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
					ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
