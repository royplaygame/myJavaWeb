<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%=session.getId() %>
		
		
		<!-- 持久化的Session的Cookie,关闭浏览器后还能获取到 -->
		<%
			Cookie cookie=new Cookie("JSESSIONID",session.getId());
			cookie.setMaxAge(30);
			response.addCookie(cookie);
		%>
</body>
</html>