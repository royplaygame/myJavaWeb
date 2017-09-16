<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Date date=new Date(); %>
	
	<!-- jsp表达式  -->
	<%=date%>
	<br/><br/>
	
	<!-- jsp小脚本片段，根据输入年龄输出相应结果 -->
	<%
		String ageStr=request.getParameter("age");
		Integer age=Integer.valueOf(ageStr);
		if(age>=18){
	%>
		成年人....
	<%
		}else{
	%>
	           未成年人....
	<%
		}
	%>
	
	<!-- jsp声明，比如声明一个方法，声明会方法放到service的外面,也基本不用-->
	<%!
	  void showInfo(){
			System.out.println("this is showInfo");
		}
	%>
	
	<!-- HTML 注释 -->
	<%-- JSP 注释--%>
	<%-- out.println("this is test"); --%>
	
	
</body>
</html>