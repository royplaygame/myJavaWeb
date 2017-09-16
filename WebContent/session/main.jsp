<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
	<h1>This is main　page</h1>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username!=null&&!username.trim().equals("")){
			Cookie name=new Cookie("username",username);
			name.setMaxAge(30);
			response.addCookie(name);
		}else{
			Cookie []cookies=request.getCookies();
			if(cookies!=null&&cookies.length>0){
				for(Cookie c:cookies){
					String cookieName=c.getName();
					System.out.println(cookieName+"------");
					if("username".equals(cookieName)){
						String value=c.getValue();
						username=value;
					}
				}
			}
		}
		System.out.println(username);
		if(username!=null&&!username.trim().equals("")){
			out.println("欢迎："+username);
		}else{
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>