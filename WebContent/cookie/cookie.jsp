<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//获取cookies
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length >= 1) {
			for (Cookie c : cookies) {
				out.println(c.getName() + " : " + c.getValue());
				out.println("<br/>");
			}
		} else {
			out.println("正在创建Cookie......");
			//创建一个cookie
			Cookie cookie = new Cookie("name", "zhangsan");
			cookie.setMaxAge(30);
			//调用 response的一个方法把Cookie传给客端
			response.addCookie(cookie);
		}
	%>
</body>
</html>