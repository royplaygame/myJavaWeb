<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<center>
		<%
			String tokenValue=new Date().getTime()+"";
			session.setAttribute("token", tokenValue);
			out.println(session.getAttribute("token"));
		%>
		<h4>请输入如下信息</h4>
		<form action="<%=request.getContextPath()%>/tokenServlet" method="post">
			<!-- 隐藏域  -->
			<input type="hidden"  name="token" value="<%=tokenValue %>" />
			
			<!-- request域   行不通 -->
			
			
			<!-- session域 ，这样写不完美-->
			<%--
				session.setAttribute("token", "luoyang");
			--%>
			
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>姓名</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>寄送地址</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>卡号</td>
					<td><input type="text" name="cardNo" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>