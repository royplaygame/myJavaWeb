package com.hy.ly.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HelloServlet implements Servlet{

	@Override
	public void destroy() {
		System.out.println("destory ......");
		
	}

	@Override
	public ServletConfig getServletConfig() {
		System.out.println("getServletConfig......");
		return null;
	}

	@Override
	public String getServletInfo() {
		System.out.println("getServletInfo......");
		return null;
	}
	
	//1.获取初始化参数
	public void init(ServletConfig servletConfig) throws ServletException {
		//System.out.println(servletConfig.getInitParameter("username"));
		//System.out.println(servletConfig.getInitParameter("password"));
		System.out.println("HelloServlet init.......");
		
		Enumeration<String> names=servletConfig.getInitParameterNames();
		while(names.hasMoreElements()){
			String name=names.nextElement();
			String value=servletConfig.getInitParameter(name);
			System.out.println(name+" "+value);
		}
		
		//获取Servlet名称
		String servletName=servletConfig.getServletName();
		System.out.println(servletName);
		
		//获取ServletContext对象
		ServletContext servletContext=servletConfig.getServletContext();
		//可以用来获取当前Web应用的信息
		Enumeration<String> conNames=servletContext.getInitParameterNames();
		while(conNames.hasMoreElements()){
			String name=conNames.nextElement();
			String value=servletContext.getInitParameter(name);
			System.out.println(name+" "+value);
			
		//获取绝对路径
		String realPath=servletContext.getRealPath("note.txt");
		System.out.println(realPath);
		}
	
		//获取当前web应用的名称
		String contextPath=servletContext.getContextPath();
		System.out.println(contextPath);
		
		//获取当前web应用的某一个输入流
		try {
			ClassLoader classLoader=getClass().getClassLoader();
			InputStream in=classLoader.getResourceAsStream("jdbc.properties");
			System.out.println("1.\t"+in);
			
			InputStream in2=servletContext.getResourceAsStream("/jdbc.properties");
			System.out.println("2.\t"+in2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("service......");
	}
	
	public HelloServlet(){
		System.out.println("HelloServlet's Constructor");
	}

}
