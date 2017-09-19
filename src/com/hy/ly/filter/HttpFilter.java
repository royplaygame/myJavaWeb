package com.hy.ly.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义HttpFilter,实现Filter接口
 * 
 * @author ssr
 *
 */
public abstract class HttpFilter implements Filter {

	private FilterConfig filterConfig;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		doFilter(request, response, chain);
	}

	public abstract void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException;

	// 不建议子类直接覆盖,如果覆盖可能导致FilterConfig成员变量赋值失败
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		init();
	}

	// 这个方法，供子类继承的初始化方法
	protected void init() {
	}

	public FilterConfig getFilterConfig() {
		return filterConfig;
	}

}
