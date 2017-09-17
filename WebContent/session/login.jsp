<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	SessionID:<%=session.getId() %>
	<br/><br/>
	IsNew:<%=session.isNew() %>
	<br/><br/>
	MaxInactiveInterval:<%=session.getMaxInactiveInterval() %>
	<br/><br/>
	CreationTime:<%=session.getCreationTime() %>
	<br/><br/>
	LastAccessedTime：<%=session.getLastAccessedTime() %>
	<br/><br/>
	
	<%
		Object username=session.getAttribute("username");
		if(username==null){
			username="";
		}
	
	%>
	
	<%-- <form action="hello.jsp" method="post">
	UserName: <input type="text" name="username" value="<%=username %>"/>
	<!-- PassWord: <input type="text" name="password"/> -->
	<br/><br/>
	<input type="submit" value="登录"/>
    </form> --%>
    
    <!-- Url重写的方法（在禁用Cookie的情况使用）  -->
	<form action="<%=response.encodeURL("hello.jsp") %>" method="post">
	UserName: <input type="text" name="username" value="<%=username %>"/>
	<!-- PassWord: <input type="text" name="password"/> -->
	<br/><br/>
	<input type="submit" value="登录"/>
    </form>
</body>
</html>