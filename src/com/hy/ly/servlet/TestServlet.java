package com.hy.ly.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("testServlet's doGet");
		
		System.out.println(request.getAttribute("name"));
		
		request.setAttribute("requestKey", "mytestServlet");
		
		//请求转发，一个请求
		request.getRequestDispatcher("/testPage.jsp").forward(request, response);
		
		//请求重定向：两个请求
		//response.sendRedirect(request.getContextPath()+"/testPage.jsp");
	}

}
