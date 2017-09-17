<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>图书详情</h1>
	<%=request.getParameter("book") %>
	
	<a href="bookPage.jsp">Return</a>
	
	<%
	String book=request.getParameter("book");
	//用来保存和bookPage传过来相同的cookie
	Cookie tempCookie=null;
	
	//确定要删除的Book
	Cookie []cookies=request.getCookies();
	List<Cookie> listCookies=new ArrayList<Cookie>();
	//判断是否大于5
	if(cookies!=null&&cookies.length>0){
		for(Cookie c:cookies){
			String cookieName=c.getName();
			if(cookieName.startsWith("MY_BOOK_")){
				listCookies.add(c);
				
				if(c.getValue().equals(book)){
					tempCookie=c;
				}
			}
		}
	}
	
	//如果数量大于5
	if(listCookies.size()>=5&&tempCookie==null){
		tempCookie=listCookies.get(0);
	}
	
	//如果tempCookie不空删除
	if(tempCookie!=null){
		tempCookie.setMaxAge(0);
		response.addCookie(tempCookie);
	}
	
	//把当前图书以cookie形式返回
	Cookie cookie=new Cookie("MY_BOOK_"+book,book);
	response.addCookie(cookie);
	%>
</body>
</html>