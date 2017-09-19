package com.hy.ly.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;


@WebFilter(urlPatterns="/filter/hello.jsp",initParams={@WebInitParam(name="username",value="lisi")})
public class UserNameFilter implements Filter {

 
    public UserNameFilter() {
    	System.out.println("UserNameFilter");
    }

	
	public void destroy() {
		System.out.println("UserNameFilter   destroy");
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("UserNameFilter   doFilter");
		//	获取初始化参数
		String userName=this.filterConfig.getInitParameter("username");
		String paramUser=request.getParameter("username");
		if(!userName.equals(paramUser)){
			request.setAttribute("message", "用户名不正确！");
			request.getRequestDispatcher("/filter/login.jsp").forward(request, response);
			return;
		}
		chain.doFilter(request, response);
	}

	private FilterConfig filterConfig;
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("UserNameFilter   init");
		this.filterConfig=fConfig;
	}

}
