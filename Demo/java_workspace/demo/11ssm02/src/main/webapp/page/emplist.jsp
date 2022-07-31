<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>员工管理</title>
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
						<span id="show"></span>
						<br />
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
				<h1>欢迎登陆！</h1>
				<h2><font color="red">${emp_del_err}</font></h2>
				<table class="table">
					<tr class="table_header">
						<td>序号</td>
						<td>姓名</td>
						<td>工资</td>
						<td>职位</td>
						<td>备注</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${empList}" var="emp" varStatus="v">
						<tr class="row1">
							<td>${v.index+1}</td>
							<td>${emp.empname }</td>
							<td>${emp.salary }</td>
							<td>
								<c:if test="${emp.job==10}">老板</c:if>
								<c:if test="${emp.job==20}">经理</c:if>
								<c:if test="${emp.job==30}">组长</c:if>
								<c:if test="${emp.job==40}">员工</c:if>
							</td>
							<td>${emp.other}</td>
							<td>
								<a href="/emp/view.do?id=${emp.id}">查看</a>
								<a href="/emp/delete.do?id=${emp.id}">删除</a>&nbsp;
								<a href="/emp/edit.do?id=${emp.id}">编辑</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<p>
					<input type="button" class="button" value="添加员工"
						onclick="location='/page/addEmp.jsp'" />
				</p>
			</div>
			<div style="text-align:center">
				<c:forEach var="i" begin="1" end="${pageCount}">
						<span>
							<a href="/emp/pageList.do?page=${i}">第${i}页</a>
						</span>			
				</c:forEach>
			</div>
		</div>
		<div id="footer">
			<div id="footer_bg">ABC@126.com</div>
		</div>
	</div>
</body>
</html>
