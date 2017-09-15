package com.hy.ly.servlet;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public abstract class MyGenericServlet implements Servlet,ServletConfig {

	/**
	 * 以下是Servlet的方法的实现
	 */
	@Override
	public void destroy() {
	}

	@Override
	public ServletConfig getServletConfig() {
		return servletConfig;
	}

	@Override
	public String getServletInfo() {
		return null;
	}

	private ServletConfig servletConfig;

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		this.servletConfig = arg0;
	}

	@Override
	public abstract void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException;

	
	/**
	 * 以下是ServletConfig的方法的实现
	 */
	@Override
	public String getInitParameter(String arg0) {
		return servletConfig.getInitParameter(arg0);
	}

	@Override
	public Enumeration<String> getInitParameterNames() {
		return servletConfig.getInitParameterNames();
	}

	@Override
	public ServletContext getServletContext() {
		return servletConfig.getServletContext();
	}

	@Override
	public String getServletName() {
		return servletConfig.getServletName();
	}
}
