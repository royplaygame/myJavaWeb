<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 写入一个Cookie -->
	<%
		Cookie cookie = new Cookie("cookiePath", "myNewCookieValue");
		//设置Cookie的作用范围
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
		
		//Cookie的作用范围：
		//可以作用当前目录，当前目录的子目录，不能作用于当前目录的上一级目录
		//可以通过cookie.setPath(request.getContextPath())设置Cookie的作用范围。
	%>
	
	<a href="cookiePath.jsp">To Read Cookie</a>
</body>
</html>