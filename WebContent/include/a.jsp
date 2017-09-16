<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>AAA Page</h2>
	<% String str="abcde"; %>
	<!-- 静态包含，只生成一个文件，/表示当前web应用的根目录，否则表示相对于当前文件 -->
	<%@ include file="b.jsp" %>
	解决中文乱码
</body>
</html>