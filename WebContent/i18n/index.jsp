<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国际化设置</title>
</head>
<body>
	<%
		Date date=new Date();
		request.setAttribute("date", date);
		request.setAttribute("salary", 945845.45);
	%>
	<br />
	<%--
		Enumeration<Locale> locals = request.getLocales();
		while (locals.hasMoreElements()) {
			out.println("<br>"+locals.nextElement()+"<br>");
		}
	--%>

	<br />
	<br /> 
	<%-- 
	<fmt:bundle basename="i18n">
		<fmt:message key="date"></fmt:message>
		<fmt:formatDate value="${requestScope.date }"/>
		<fmt:message key="salary"></fmt:message>
		<fmt:formatNumber value="${requestScope.salary }"></fmt:formatNumber>
	</fmt:bundle>
	<br />
	<br />
	--%>
	
	<%
		String code=request.getParameter("code");
		if(code!=null){
			if("en".equals(code)){
				session.setAttribute("locale", Locale.US);
			}else if("zh".equals(code)){
				session.setAttribute("locale", Locale.CHINA);
			}
		}
	
	%>
	<c:if test="${sessionScope.locale!=null }">
		<fmt:setLocale value="${sessionScope.locale}"/>
	</c:if>
	<fmt:setBundle basename="i18n"/>
	<fmt:message key="date"></fmt:message>
	<fmt:formatDate value="${requestScope.date }" dateStyle="LONG"/>
	<fmt:message key="salary"></fmt:message>
	<fmt:formatNumber value="${requestScope.salary }" type="currency"></fmt:formatNumber>
	<br />
	<br />
	
	<a href="index.jsp?code=zh">中文</a>
	<a href="index.jsp?code=en">English</a>
</body>
</html>