package com.hy.ly.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HelloFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("destroy Filter>>>>>>>>>");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("do HelloFilter's chain.doFilter before");
		filterChain.doFilter(request, response);
		System.out.println("do HelloFilter's chain.doFilter after");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("init Filter>>>>>>>>>");
		String param=filterConfig.getInitParameter("myFilter");
		System.out.println(param);
	}

}
