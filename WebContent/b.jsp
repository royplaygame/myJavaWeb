<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>BBB Page</h2>
	<%
		//请求的转发,一个请求,只能转发到当前Web应用的资源,/代表web应用的根目录（http://localhost:8080/myJavaWeb/）
		//request.getRequestDispatcher("c.jsp").forward(request,response);
		request.getRequestDispatcher("c.jsp").forward(request,response);
	
		//请求的重定向,两个请求,可以重定向到任务资源,代表web站点的根目录（http://localhost:8080/）
		//response.sendRedirect("c.jsp");
		response.sendRedirect("http://qzhangsq.com/");
	%>
</body>
</html>