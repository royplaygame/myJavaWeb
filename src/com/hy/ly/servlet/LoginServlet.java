package com.hy.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LoginServlet implements Servlet {
	
	private ServletConfig servletConfig;

	@Override
	public void destroy() {

	}

	@Override
	public ServletConfig getServletConfig() {
		return null;
	}

	@Override
	public String getServletInfo() {
		return null;
	}
	
	@Override
	public void init(ServletConfig servletConfig) throws ServletException {
		this.servletConfig=servletConfig;
	}

	// ServletRequest request封装了请求信息，可以从中获取到任何请求信息
	// ServletResponse response封装了响应信息，想给用户响应，就可以通过相应的方法来实现
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 根据参数名获取返回值，如果是checkbox只能返回第一个值
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username + "\t" + password);
		
		//获取web.xml中的参数
		ServletContext servletContext=servletConfig.getServletContext();
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

	/*	// 根据参数名称，返回请求参数返回的字符串数组
		String[] hobbys = request.getParameterValues("hobby");
		for(String hb:hobbys){
			String str=new String(hb.getBytes("iso8859-1"),"utf-8");
			System.out.println(str);
		}

		// 获取参数名称
		Enumeration<String> paras = request.getParameterNames();
		while (paras.hasMoreElements()) {
			System.out.println(paras.nextElement());
		}

		// 获取参数的键值对：
		Map<String, String[]> map = request.getParameterMap();
		for (Map.Entry<String, String[]> entry : map.entrySet()) {
			System.out.println(entry.getKey() + "\t" + Arrays.toString(entry.getValue()));
		}

		// 获取请求的Url、端口（这些是HttpServletRequest信息，可以进行强转）
		HttpServletRequest req = (HttpServletRequest) request;
		StringBuffer sb = req.getRequestURL();
		String uri=req.getRequestURI();
		int port = req.getServerPort();
		String method=req.getMethod();
		System.out.println(uri);
		System.out.println(sb.toString() + "\t" + port+"\t"+method);
		
		//获取请求字符串
		String reqStr=req.getQueryString();
		System.out.println(reqStr);
		
		//获取servlet名称
		String servletPath=req.getServletPath();
		System.out.println(servletPath);
		
		
		//响应对象
		//设置响应类型
		response.setContentType("appliation/msword");
		
		//向客户端输出信息
		PrintWriter out=response.getWriter();
		out.println("this is print");
		out.write("HelloWrod......");*/
	}

}
