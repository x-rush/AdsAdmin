<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>添加员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../static/css/style.css" />
<script type="text/javascript" src="../static/js/dateshow.js"></script>
</head>

<body>
	<div id="wrap">
		<div id="top_content">
			<div id="header">
				<div id="rightheader">
					<p>
						<span id="show"></span> <br />
					</p>
				</div>
				<div id="topheader">
					<h1 id="title">
						<a href="#">员工信息</a>
					</h1>
				</div>
				<div id="navigation"></div>
			</div>
			<div id="content">
				<p id="whereami"></p>
				<h1>添加员工信息：</h1>
				<h2>
					<font color="red">${emp_add_err}</font>
				</h2>
				<form action="/emp/add.do" method="post">
					<input type="hidden" name="deleflg" value="0" />
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">
						<tr>
							<td valign="middle" align="right">姓名:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="empname" required="required" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">薪资:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="salary" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">职位:</td>
							<td valign="middle" align="left"><select name="job"
								class="inputgri" style="width: 178px">
									<option value="10">老板</option>
									<option value="20">经理</option>
									<option value="30">组长</option>
									<option value="40">员工</option>
							</select></td>
						</tr>
						<tr>
							<td valign="middle" align="right">备注:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="other" /></td>
						</tr>
					</table>
					<p>
						<input type="submit" class="button" value="添加" /> <input
							type="reset" class="button" value="重置" />
					</p>
				</form>
			</div>
		</div>
		<div id="footer">
			<div id="footer_bg">ABC@126.com</div>
		</div>
	</div>
</body>
</html>
