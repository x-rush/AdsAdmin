<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>

<html>
<head>
	<title>HTML DEMO FORM</title>
</head>
<%
//����
request.setCharacterEncoding("gbk");
String text = request.getParameter("txt");
%>
<body>

<br/>
<!-- ʹ�ñ��ʽ�����������ֵ -->
���������ʾΪ, [<font color="red"><%=text%></font>]
</body>
</html>