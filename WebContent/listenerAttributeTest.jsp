<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h4>Listener Test Attribute Page</h4>
		
		<!-- Request -->
		<% 
			request.setAttribute("name", "zhangsan");
			System.out.println("-------------------------------");
			
			request.setAttribute("name", "lisi");
			System.out.println("-------------------------------");
			
			request.removeAttribute("name");
			System.out.println("-------------------------------");
		
		%>
		
		<!-- Session -->
		
		<%
			session.setAttribute("sessionKey", "sessionValue");
			System.out.println("-------------------------------");
		
			session.setAttribute("sessionKey", "sessionNewValue");
			System.out.println("-------------------------------");
		
			session.removeAttribute("sessionKey");
			System.out.println("-------------------------------");
		%>
		
		<!-- Application -->
		
		<%
			application.setAttribute("applicationKey", "applicationValue");
			System.out.println("-------------------------------");
		
			application.setAttribute("applicationKey", "applicationNewValue");
			System.out.println("-------------------------------");
		
			application.removeAttribute("applicationKey");
			System.out.println("-------------------------------");
		%>
		
</body>
</html>