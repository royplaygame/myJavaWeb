<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>图书列表</h1>
	<a href="bookDetail.jsp?book=JavaBase">Java基础</a>
	<a href="bookDetail.jsp?book=JavaWeb">JavaWeb</a>
	<a href="bookDetail.jsp?book=Oracle">Oracle</a>
	<a href="bookDetail.jsp?book=Html">Html</a>
	<a href="bookDetail.jsp?book=SSH">SSH</a>
	<a href="bookDetail.jsp?book=crazyJava">疯狂Java</a>
	<a href="bookDetail.jsp?book=Coding">编程思想</a>
	<a href="bookDetail.jsp?book=Android">安卓开发</a>

	<br />
	<br />
	<br />

	<%
		//	获取所有cookies
		Cookie[] cookies = request.getCookies();
		//遍历显示所有的符合条件的
		if(cookies!=null&&cookies.length>0){
			for(Cookie c:cookies){
				String cookieName=c.getName();
				if(cookieName.startsWith("MY_BOOK_")){
					out.println(c.getValue()+"<br/>");
				}
			}
		}
	%>
</body>
</html>