package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymentDao;
import dto.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		// System.out.println("post 요청"); (확인 완)
		
		//	파라미터 받기
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int birth = Integer.parseInt(request.getParameter("birth"));
		int phoneNumber = Integer.parseInt(request.getParameter("phonenumber"));
		int totalPrice = Integer.parseInt(request.getParameter("total_price"));
		
		
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("birth", birth);
		request.setAttribute("phoneNumber", phoneNumber);
		request.setAttribute("totalPrice", totalPrice);
		request.getRequestDispatcher("/hanatour/jsp/tour/payment.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
	}

}
