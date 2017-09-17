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
	<jsp:useBean id="customer" class="com.hy.ly.po.Customer" scope="session"></jsp:useBean>
	
	<!-- 为单多属性赋值,可以通过传参数方式给下面所有属性赋值：javabean.jsp?name=lisi&address=luoyang&cardType=visa&cardNo=1002  -->
	<jsp:setProperty property="*" name="customer"/>
	
	<!-- 为单个属性赋值  -->
	<%-- <jsp:setProperty property="name" value="张三" name="customer"/> --%>
	
	<jsp:getProperty property="name" name="customer"/>
	<jsp:getProperty property="address" name="customer"/>
	<jsp:getProperty property="cardType" name="customer"/>
	<jsp:getProperty property="cardNo" name="customer"/>
	
	<%-- <%=customer.getName() %> --%>
	
	<%--
		customer.setName("张三");
	--%>
	
	<%--
		//从session获取一个Customer赋值给customer
		Customer customer =(Customer)session.getAttribute("customer");
	
		//如果从session中获取的是空，则通过反射创建一个Customer放入到customer,并入到session中
		if(customer==null){
			customer=(Customer)Class.forName("com.hy.ly.po.Customer").newInstance();
			session.setAttribute("customer", customer);
		}
		
	--%>
</body>
</html>