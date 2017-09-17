package com.hy.ly.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码
		response.setContentType("text/html; charset=UTF-8");
		// 获取请求参数
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String checkCode = request.getParameter("CHECK_CODE_KEY");

		// 获取Session中checkCode的值
		String sessionCode = (String) request.getSession().getAttribute("CHECK_CODE_KEY");

		System.out.println(checkCode);
		System.out.println(sessionCode);

		// 比对，若一致，验证码正确，不一致，验证码不正确
		if (!(checkCode != null && checkCode.equals(sessionCode))) {
			request.getSession().setAttribute("message", "验证码不一致！");
			response.sendRedirect(request.getContextPath() + "/check/index.jsp");
			return;
		}

		PrintWriter out = response.getWriter();
		out.println("验证码正确,进行业务处理！" + username + "\t" + password);
	}

}
