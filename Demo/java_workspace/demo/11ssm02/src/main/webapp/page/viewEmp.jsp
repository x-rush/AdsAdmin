<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>查看员工</title>
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
						<a href="#">员工信息管理</a>
					</h1>
				</div>
				<div id="navigation"></div>
			</div>
			<div id="content">
				<p id="whereami"></p>
				<h1>更新员工信息:</h1>
				<h2>
					<font color="red">${emp_update_err}</font>
				</h2>
				<form action="#" method="post">
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">

						<tr>
							<td valign="middle" align="right">姓名:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="empname" value="${emp.empname}"
								disabled="disabled" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">工资:</td>
							<td valign="middle" align="left"><input readonly="readonly"
								type="text" class="inputgri" name="salary" value="${emp.salary}" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">职位:</td>
							<td valign="middle" align="left"><select name="job"
								class="inputgri" style="width: 178px" disabled="disabled">
									<option value="10" ${emp.job==10?selected:""}>老板</option>
									<option value="20" ${emp.job==20?selected:""}>经理</option>
									<option value="30" ${emp.job==30?selected:""}>组长</option>
									<option value="40" ${emp.job==40?selected:""}>员工</option>
							</select></td>
						</tr>
						<tr>
							<td valign="middle" align="right">备注:</td>
							<td valign="middle" align="left"><input readonly="readonly"
								type="text" class="inputgri" name="other" value="${emp.other}" disabled="disabled"/>
							</td>
						</tr>
					</table>
					<p>
						<input type="button" class="button" value="返回"
							onclick="history.go(-1)" />
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
