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
		<h4>步骤一：选择要购买的图书</h4>
		<form action="<%=request.getContextPath() %>/bookSelectServlet" method="post">
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>书名</td>
					<td>购买</td>
				</tr>
				<tr>
					<td>Java</td>
					<td><input type="checkbox" name="book" value="Java" /></td>
				</tr>
				<tr>
					<td>SSH</td>
					<td><input type="checkbox" name="book" value="SSH" /></td>
				</tr>
				<tr>
					<td>JavaWeb</td>
					<td><input type="checkbox" name="book" value="JavaWeb" /></td>
				</tr>
				<tr>
					<td>JQuery</td>
					<td><input type="checkbox" name="book" value="JQuery" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"  value="提交" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>