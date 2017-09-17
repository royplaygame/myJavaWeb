package com.hy.ly.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/bookSelectServlet")
public class BookSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取图书信息
		String []books=request.getParameterValues("book");
		
		//放到session中去
		request.getSession().setAttribute("books", books);
		
		//重定向到另一个页面
		System.out.println(request.getContextPath()+ "/shoppingcart/step_2.jsp");
		response.sendRedirect(request.getContextPath()+ "/shoppingcart/step_2.jsp");
	}

}
