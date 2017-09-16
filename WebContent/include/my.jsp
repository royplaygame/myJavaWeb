<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      this is good for my jsp
      <%
      	request.setCharacterEncoding("utf-8");
      	String username=request.getParameter("username");
      	String password=request.getParameter("password");
      %>
      <%=username %>
      <%=password %>
      <br/> <br/>
      <%
        String uname=request.getParameter("username");
        String pwd=request.getParameter("password");
        String newUsername=new String(uname.getBytes("utf-8"),"utf-8");
        String newPassword=new String(pwd.getBytes("utf-8"),"utf-8");
        out.println(newUsername);
        out.println(newPassword);
      %>
</body>
</html>