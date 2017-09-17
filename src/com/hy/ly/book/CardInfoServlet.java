package com.hy.ly.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hy.ly.po.Customer;

@WebServlet("/cardInfoServlet")
public class CardInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取请求参数
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String cardType=request.getParameter("cardType");
		String cardNo=request.getParameter("cardNo");
		Customer cust=new Customer(name,address,cardType,cardNo);
		//放到session中去
		HttpSession session=request.getSession();
		System.out.println(cust);
		session.setAttribute("myCustomer", cust);
		Customer customer=(Customer)session.getAttribute("myCustomer");
		System.out.println(customer);
		//重定向到另一个页面
		response.sendRedirect(request.getContextPath()+"/shoppingcart/confirm.jsp");
	}

}
