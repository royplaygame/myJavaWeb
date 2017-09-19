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
		<font color="red">${requestScope.message}</font>
		<br /> <br />
		<form action="${pageContext.request.contextPath}/filter/hello.jsp" method="post">
			UserName: <input type="text" name="username"  value="${param.username }" /> <br /><br />
			PassWord: <input type="text" name="password" /> <br /><br />
			<input type="submit" value="登录" />
		</form>
	</center>
</body>
</html>