package com.hy.ly.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;



@WebFilter(urlPatterns="/filter/hello.jsp")
public class PassWordFilter implements Filter {

 
    public PassWordFilter() {
    	System.out.println(" PassWordFilter   destroy");
    }


	public void destroy() {
		System.out.println(" PassWordFilter   destroy");
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println(" PassWordFilter   doFilter");
		// 获取参数
		String initPassword=this.filterConfig.getServletContext().getInitParameter("password");
		String password=request.getParameter("password");
		if(!initPassword.equals(password)){
			request.setAttribute("message", "密码不正确");
			request.getRequestDispatcher("/filter/login.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	private FilterConfig filterConfig;
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("PassWordFilter   init");
		this.filterConfig=fConfig;
	}

}
