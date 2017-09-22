package com.hy.ly.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/filter/verify/*")
public class LoginFilter extends HttpFilter {

	// 从web.xml获取userSessionKey、redirectPath、uncheckedUrls

	private String userSessionKey;
	private String redirectPath;
	private String uncheckedUrls;
	
	protected void init(){
		ServletContext servletContext=getFilterConfig().getServletContext();
		
		this.userSessionKey=servletContext.getInitParameter("userSessionKey");
		this.redirectPath=servletContext.getInitParameter("redirectPath");
		this.uncheckedUrls=servletContext.getInitParameter("uncheckedUrls");
	}

	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1. 获取请求的servletPath
		// http://localhost:8080/myJavaWeb/filter/verify/list.jsp
		// String requestURL=request.getRequestURL().toString();
		// /myJavaWeb/filter/verify/list.jsp
		// String requestURI=request.getRequestURI();
		// /filter/verify/list.jsp
		String servletPath = request.getServletPath();

		// System.out.println(requestURL);
		// System.out.println(requestURI);
		//System.out.println(servletPath);

		// 2. 检查1获取的servletPath是否为不需要拦截的url, 若是，直接放行，方法结束
		List<String> urls=Arrays.asList(uncheckedUrls.split(","));
		if(urls.contains(servletPath)){
			chain.doFilter(request, response);
			return;
		}
		// 3. 从session中获取userSessionKey的值，若此值没有，重定向到redirectPath
		Object user=request.getSession().getAttribute(userSessionKey);
		if(user==null){
			response.sendRedirect(request.getContextPath()+redirectPath);
			return;
		}
		// 4. 若存在直接放行。
		chain.doFilter(request, response);
	}

}
