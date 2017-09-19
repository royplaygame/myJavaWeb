<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//1. 获取用户信息
		String username=request.getParameter("username");
		
		//2. 判断用户信息完整，把信息放入HttpSession中
		if(username!=null&&!username.trim().equals("")){
			session.setAttribute(application.getInitParameter("userSessionKey"), username);
			//3. 重定向到list.jsp中
			System.out.println(request.getContextPath()+"/filter/verify/list.jsp"+">>>>>>>>>>>>>>>>>>>>>>>>>>");
			response.sendRedirect(request.getContextPath()+"/filter/verify/list.jsp");
		}else{
			response.sendRedirect(request.getContextPath()+"/filter/verify/login.jsp");
		}
		
	
	%>
</body>
</html>