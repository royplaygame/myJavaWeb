<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hy.ly.po.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h4>c:forEach</h4>
		<c:forEach begin="1" end="10" step="1" var="i">
			${i }------
		</c:forEach>
		<br/>
		<%
			List<Customer> list=new ArrayList<Customer>();
			Customer cust1=new Customer("zhangsan","luoyang","visa","10001");
			Customer cust2=new Customer("lisi","beijing","visa","10003");
			Customer cust3=new Customer("wangwu","kaifei","visa","10002");
			Customer cust4=new Customer("zhangfei","nanjing","visa","10004");
			Customer cust5=new Customer("guanyu","hangzhou","visa","10006");
			Customer cust6=new Customer("caocao","xian","visa","10008");
			list.add(cust1);
			list.add(cust2);
			list.add(cust3);
			list.add(cust4);
			list.add(cust5);
			list.add(cust6);
			request.setAttribute("list", list);
		%>
		<!-- 遍历Coolection -->
		<c:forEach items="${requestScope.list }" var="cust" varStatus="status">
			${status.last }=${status.first }===${status.count }==${status.index }--${cust.name }---${cust.address }---${cust.cardType }---${cust.cardNo }
			<br/>
		</c:forEach>
		
		<!-- 遍历Map -->
		<br/><br/>
		<%
			Map<String,Customer> custMap=new HashMap<String,Customer>();
		 	custMap.put("a", cust1);
			custMap.put("b", cust2);
			custMap.put("c", cust3);
			custMap.put("d", cust4);
			custMap.put("e", cust5);
			request.setAttribute("custMap", custMap);
		%>
		<c:forEach items="${requestScope.custMap }" var="cust">
			${cust.key }----${cust.value }----${cust.value.name }
			<br/>
		</c:forEach>
		<!-- 遍历数组 -->
		<br/><br/>
		<%
			String []strs={"zhangsan","lisi","wangwu","zhaoyun"};
		 	request.setAttribute("strs", strs);
		%>
		<c:forEach items="${requestScope.strs }" var="str" varStatus="status">
			${status.count }-------${str }<br/>
		</c:forEach>
		<!-- 遍历枚举 -->
		<br/><br/>
		<c:forEach items="${pageContext.session.attributeNames }" var="attributeName">
			${attributeName }<br/>
		</c:forEach>
		
		<h4>c:choose c:when c:otherwise</h4>
		<c:choose>
			<c:when test="${param.age>60 }">老年</c:when>
			<c:when test="${param.age>35 }">中年</c:when>
			<c:when test="${param.age>18 }">青年</c:when>
			<c:when test="${param.age>12 }">青少年</c:when>
			<c:otherwise>少年</c:otherwise>
		</c:choose>
		
		
		<h4>C:if</h4>
		<c:set value="20" var="age" scope="request"></c:set>
		<c:if test="${requestScope.age>18 }">成年了！</c:if>
		<br/>
		<c:if test="${requestScope.age>18 }" var="isAdult" scope="session"></c:if>
		${sessionScope.isAdult }
		<h4>C:remove</h4>
		<c:set var="year" value="2010-2-20" scope="session"></c:set>
		year:${sessionScope.year }
		<br/><br/>
		<c:remove var="year" scope="session"/>
		year:${sessionScope.year }
		<h4>C:set</h4>
		<c:set var="name" value="luoyang" scope="page"></c:set>
		<%--
			pageContext.setAttribute("name", "luoyang");
		--%>
		Name:${pageScope.name}
		<br/><br/>
		<c:set var="city" value="${param.city }" scope="session"></c:set>
		City:${sessionScope.city}
		<br/><br/>
		
		<% 
			Customer cust=new Customer("zhangsan","luoyang","visa","10002");
			request.setAttribute("customer", cust);
		%>
		${requestScope.customer.name }
		<br/>
		address:${requestScope.customer.address}
		<br/>
		<c:set target="${requestScope.customer }" property="address" value="${param.city }"></c:set>
		address:${requestScope.customer.address}
		<h4>C:out</h4>
		<%
			request.setAttribute("book", "<<Java>>");
		%>
		book:${requestScope.book }
		<br/><br/>
		book:<c:out value="${requestScope.book }"></c:out>
		<br/><br/>
		book:<c:out value="${requestScope.book1 }" default="booktitle"></c:out>
		<br/><br/>
		book:<c:out value="${requestScope.book }" escapeXml="false"></c:out>
</body>
</html>