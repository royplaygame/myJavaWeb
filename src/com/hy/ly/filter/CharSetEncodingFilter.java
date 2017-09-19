package com.hy.ly.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/filter/encoding/*")
public class CharSetEncodingFilter extends HttpFilter{

	private String charEncode;
	
	public void init(){
		this.charEncode=getFilterConfig().getServletContext().getInitParameter("charEncode");
	}
	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("charEncode:"+this.charEncode);
		request.setCharacterEncoding(this.charEncode);
		chain.doFilter(request, response);
	}

}
