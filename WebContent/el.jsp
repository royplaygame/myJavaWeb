<%@page import="java.util.Date"%>
<%@page import="com.hy.ly.po.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="el.jsp" method="post">
		UserName: <input type="text" name="username"
			value="<%=request.getParameter("username") == null ? "" : request.getParameter("username")%>" />
		UserName: <input type="text" name="username"
			value="${param.username }" />

		<input type="submit" value="提交" />
	</form>

	UserName:
	<%=request.getParameter("username") == null ? "" : request.getParameter("username")%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;
	UserName:${param.username }
	
	<br/><br/><br/>
	
	
	<!-- 原来方式 -->
	<jsp:useBean id="customer" class="com.hy.ly.po.Customer" scope="session"></jsp:useBean>
	<jsp:setProperty property="name" value="张三" name="customer"/>
	<%
		//从session获取一个Customer赋值给customer
		Customer customer2 =(Customer)session.getAttribute("customer");
		out.println(customer2.getName());
	%>
	<jsp:getProperty property="name" name="customer"/>
	
	<br/><br/>
	<a href="el2.jsp?score=100&name=A&name=B&name=C">Goto el2 Page</a>
	<br/><br/>
	<%
		application.setAttribute("time", new Date());
	%>
	
</body>
</html>