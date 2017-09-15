package com.hy.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class myLoginServlet extends MyGenericServlet{

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {

		// 根据参数名获取返回值，如果是checkbox只能返回第一个值
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username + "\t" + password);
		
		//获取web.xml中的参数
		ServletContext servletContext=getServletConfig().getServletContext();
		String uName=servletContext.getInitParameter("userName");
		String pwd=servletContext.getInitParameter("password");
		System.out.println("==================");
		System.out.println(uName + "\t" + pwd);
		PrintWriter outPrint=response.getWriter();
		if(username.equals(uName)&&password.equals(pwd)){
			outPrint.println("Hello "+username);
		}else{
			outPrint.println("Sorry "+username);
		}		
	}

}
