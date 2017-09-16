<%@page import="java.util.Date" session="true"%>
<%-- <%@page import="java.util.Date" session="true" errorPage="/WEB-INF/error.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" contentType="application/msword; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 指定当前jsp页面响应的类型，实际调用的是：response.setContentType("text/html; charset=UTF-8"); charset指定页面返回的编码-->
	<!-- contentType="text/html; charset=UTF-8" -->
	<!--  pageEncoding="UTF-8" 当前jsp页面的字符编码，通常和setContentType一致-->
	<h2>AAA Page</h2>
	<%
		Date date=new Date();
		System.out.println(session.getId());
		
		int i=10/0;
	%>
</body>
</html>