<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>

<html>
<head>
	<title>HTML DEMO FORM</title>
</head>
<%
//中文
request.setCharacterEncoding("gbk");
String text = request.getParameter("txt");
%>
<body>

<br/>
<!-- 使用表达式输出方法返回值 -->
获得数据显示为, [<font color="red"><%=text%></font>]
</body>
</html>