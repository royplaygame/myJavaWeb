package com.hy.ly.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SecondFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("destroy  SecondFilter-------------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("do SecondFilter's chain.doFilter before");
		filterChain.doFilter(request, response);
		System.out.println("doSecondFilter's chain.doFilter after");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("init SecondFilter-------------");
	}

}
