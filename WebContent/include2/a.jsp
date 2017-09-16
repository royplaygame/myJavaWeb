<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>AAA Page</h2>
	<% String str="abcde"; %>
	<!-- 动态包含，生成两个文件，是通过命令的方式来调用 -->
	<%-- <jsp:include page="b.jsp"></jsp:include> --%>
	
	<jsp:forward page="/include2/b.jsp">
	<jsp:param value="123456" name="password"/>
	</jsp:forward>
	<!-- 相当于下面 -->
	<%--
		request.getRequestDispatcher("/include2/b.jsp").forward(request, response);
	--%>
</body>
</html>