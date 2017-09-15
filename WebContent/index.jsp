<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="loginServlet" method="post">
	UserName: <input type="text" name="username"/>
	PassWord: <input type="text" name="password"/>
	
	<br/><br/>
	Hobby:
	<input type="checkbox" name="hobby" value="阅读"/>阅读
	<input type="checkbox" name="hobby" value="游戏"/>游戏
	<input type="checkbox" name="hobby" value="爬山"/>爬山
	<input type="checkbox" name="hobby" value="旅游"/>旅游
	<input type="checkbox" name="hobby" value="游泳"/>游泳
	
	<br/><br/>
	<input type="submit" value="登录"/>
</form>
</body>
</html>