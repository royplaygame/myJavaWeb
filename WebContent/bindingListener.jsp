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
	<!-- HttpSessionBindingListener -->
	<%--
		Customer cust=new Customer("zhangsan","洛阳","Visa","10002");
		session.setAttribute("customer", cust);
		System.out.println("----------------------");
		session.removeAttribute("customer");
	--%>
	
	<%
		Object customer=session.getAttribute("customer");
		if(customer==null){
			customer=new Customer("zhangsan","洛阳","Visa","10002");
			session.setAttribute("customer", customer);
			System.out.println("向Session中写入一个:"+customer+"对象");
		}else{
			System.out.println("从Session中读取一个:"+customer+"对象");
		}
	
	%>
</body>
</html>