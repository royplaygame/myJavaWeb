package com.hy.ly.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyHttpServlet extends MyGenericServlet {

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		if (arg0 instanceof HttpServletRequest) {
			HttpServletRequest request = (HttpServletRequest) arg0;
			if (arg1 instanceof HttpServletResponse) {
				HttpServletResponse response = (HttpServletResponse) arg1;
				service(request, response);
			}
		}
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.获取请求方式
		String method = request.getMethod();

		// 2. 根据请求的方式，来调用相应的方法
		if ("get".equalsIgnoreCase(method)) {
			doGet(request, response);
		}

		if ("post".equalsIgnoreCase(method)) {
			doPost(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
