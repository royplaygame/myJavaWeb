<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=session.getId()%>


	<!-- 持久化的Session的Cookie,关闭浏览器后还能获取到 -->
	<%
		Cookie cookie = new Cookie("JSESSIONID", session.getId());
		cookie.setMaxAge(30);
		response.addCookie(cookie);
	%>

	<!-- session过期时间 -->
	<%
		HttpSession hs = request.getSession();
		out.println(hs.getId());
		out.println("<br>");
		
		//设置session过期时间30秒
		hs.setMaxInactiveInterval(30);
		
		//默认session过期时间是：30分钟
		out.println(hs.getMaxInactiveInterval());
		out.println("<br>");
		
		//使session失效
		//hs.invalidate();
	%>
</body>
</html>