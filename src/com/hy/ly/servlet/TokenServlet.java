package com.hy.ly.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/tokenServlet")
public class TokenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 可以用sleep来模拟网络响应慢的情况
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String token = (String) session.getAttribute("token");
		String tokenValue=request.getParameter("token");
		System.out.println(token);
		System.out.println(tokenValue);
		
		if (token != null&&token.equals(tokenValue)) {
			session.removeAttribute("token");
		} else {
			response.sendRedirect(request.getContextPath() + "/token/token.jsp");
			return;
		}

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String cardNo = request.getParameter("cardNo");
		System.out.println(name + "\t" + address + "\t" + cardNo);

		request.getRequestDispatcher("/token/success.jsp").forward(request, response);
	}

}
