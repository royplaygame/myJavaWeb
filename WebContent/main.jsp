<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date=new Date();
		//out.print(date);
		//System.out.println(date);
	%>
	<%
	//request response out pageContext page config application session exception 隐含对象
	//没有声明就可以使用的对象，就叫隐含对象
	String name=request.getParameter("name");
	System.out.println(name);
	
	//respone(在jsp页面几乎不这个对象的方法)
	Class<?> clazz=response.getClass();
	System.out.println(clazz);
	
	
	//pageContext可以获取其它8个隐含对象，也可以获取当前页面的其它信息（自定义标签会用到）
	ServletRequest req=pageContext.getRequest();
	System.out.println(req==request);
	
	//session
	System.out.println(session.getId());
	
	//application 是servletContext对象
	System.out.println(application.getInitParameter("userName"));
	System.out.println(application.getInitParameter("password"));
	
	//config是servletConfig对象,通过映射的路径才能获取
	String para=config.getInitParameter("myPara");
	System.out.println(para);
	
	
	//out  JspWriter对象
	out.println(para);
	out.println("<br/>");
	
	//指向当前 JSP 对象的 Servlet 对象的引用，但为Object类型，只能调用Object类的方法（几乎不用）
	out.println(this);
	out.println("<br/>");
	out.println(page);
	
	//Exception
	
	
	//需要重点关注的对象
	//pageContext request session application
	
	%>
</body>
</html>