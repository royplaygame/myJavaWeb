package com.hy.ly.servlet;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyServlet implements Servlet{
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

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		System.out.println("MyServlet init.......");
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		System.out.println("service......");
	}
	
	public MyServlet(){
		System.out.println("MyServlet's Constructor");
	}

}
