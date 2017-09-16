<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		pageContext.setAttribute("pageContextAttr", "pageContextValue");  //作用域当前jsp页面
		request.setAttribute("requestAttr", "requestValue");     //作用域同一个请求
		session.setAttribute("sessionAttr", "sessionValue");     //作用域 一次会话，浏览器打开直到关闭（会话不失效）
		application.setAttribute("applicationAttr", "applicationValue");   //作用域当前Web应用
	%>
	<br/><br/>
	<h2>Attr two page<%=new Date() %></h2>
	pageContextAttr:<%=pageContext.getAttribute("pageContextAttr")%>
	<br/><br/>
	requestAttr:<%=request.getAttribute("requestAttr")%>
	<br/><br/>
	sessionAttr:<%=session.getAttribute("sessionAttr")%>
	<br/><br/>
	applicationAttr:<%=application.getAttribute("applicationAttr")%>
	
	<br/><br/>
	<a href="attr02.jsp">Attr02.jsp</a>
</body>
</html>