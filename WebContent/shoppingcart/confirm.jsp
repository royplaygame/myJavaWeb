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
	

	<%
		Customer cust=(Customer)session.getAttribute("myCustomer");
		
		String []books=(String[])session.getAttribute("books");
	%>

	<center>
	 	<h4>步骤三：信息确认页面</h4>
		<table border="1" cellpadding="10" cellspacing="0">
			<tr>
				<td colspan="2">顾客基本信息</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><%=cust.getName() %></td>
			</tr>
			<tr>
				<td>寄送地址</td>
				<td><%=cust.getAddress() %></td>
			</tr>
			<tr>
				<td colspan="2">信用卡信息</td>
			</tr>
			<tr>
				<td>种类</td>
				<td><%=cust.getCardType() %></td>
			</tr>
			<tr>
				<td>卡号</td>
				<td><%=cust.getCardNo() %></td>
			</tr>
			<tr>
				<td colspan="2">订货项目</td>
			</tr>

			<% for(int i=0;i<books.length;i++){ %>
			   <tr>
				 <td colspan="2"><%=books[i] %></td>
			   </tr>
			<%} %>
			
		</table>
	</center>
</body>
</html>