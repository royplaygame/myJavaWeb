<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	<!-- 7.关系运算符 -->
	${param.score>60 ? "及格":"不及格" }
	<br/>
	<%
		List<String> names=new ArrayList<String>();
		request.setAttribute("names", names);
	%>
	Empty:${requestScope.names }
	<br/>
	Empty:${empty requestScope.names }
	<br/>
	<!-- 6.与隐含对象相关的  pageContext (了解即可：header headerValues initParam cookie) -->
	pageContext： ${pageContext.request.contextPath }
	<br/>
	pageContext： ${pageContext.session.id }
	<br/>
	userName: ${initParam.userName }
	<br/>
	Accept-Language: ${header["Accept-Language"] }
	<br/>
	JSESSIONID: ${cookie.JSESSIONID }
	<br/>
	JSESSIONID: ${cookie.JSESSIONID.name }
	<br/>
	JSESSIONID: ${cookie.JSESSIONID.value }
	<br/>
	<!-- 5.与隐含对象相关的 param   paramValues  -->
	Score: ${param.score}
	<br /><br />
	Names: ${paramValues.name }
	<br />
	Names: ${paramValues.name[1] }
	<br />
	<br />
	
	<%--
		<%=request.getParameter("score") %>
	 --%>
	 <br /><br />
	<!-- 4.与隐含对象相关的 pageScope requestScope sessionScope applicationScope -->
	Time: ${applicationScope.time }
	<br/>
	Time: ${applicationScope.time.time }
	<%-- 
		<%=application.getAttribute("time") %>
	--%>
	<br /><br />
	<!-- 获取customer的name属性  -->
	UserName:${sessionScope.customer.name }
	<br /> 
	UserName:${sessionScope.customer["name"] }
	<br />
	<!-- 相当于上面的代码  -->
	<%--
		Customer customer=(Customer)session.getAttribute("customer");
		out.println("UserName:"+customer.getName());
	--%>


	<!-- 像如下方式给Session中放置数据 -->
	<%
		Customer cust = new Customer("李四", "北京", "Visa", "100002");
		session.setAttribute("com.hy.ly.customer", cust);
	%>
	<!-- 输出其中的值 -->
	<br /> UserName:${sessionScope["com.hy.ly.customer"].name }
	<br />
	<!--3. EL可以进行自动的类型转换 -->
	Score: ${param.score +11}
	<br /> Score:
	<%=request.getParameter("score") + 11%>
</body>
</html>