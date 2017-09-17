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
		<h4>请输入如下信息</h4>
		<font color="red"><%=session.getAttribute("message")==null?"":session.getAttribute("message")%></font>
		<br/><br/>
		<form action="<%=request.getContextPath() %>/checkCodeServlet" method="post">
			
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>用户名称：</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>用户密码：</td>
					<td><input type="text" name="password" /></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td><input type="text" name="CHECK_CODE_KEY" /><img alt="" src="<%=request.getContextPath() %>/validateColorServlet"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="submit" value="提交" /></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>