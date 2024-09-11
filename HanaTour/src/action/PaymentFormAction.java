package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PaymentDao;
import dto.*;

public class PaymentFormAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Session 
		HttpSession session = request.getSession();	// Session 객체 가져오기 
		String id = (String)session.getAttribute("loginId");
		
		// 파라미터 받기 
		int totalPrice = Integer.parseInt(request.getParameter("total_price"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int birth = Integer.parseInt(request.getParameter("birth"));
		int phoneNumber = Integer.parseInt(request.getParameter("phonenumber"));
		
		// Dao
		PaymentDao pDao = new PaymentDao();

		// Dto 
		ArrayList<PaymentPriceDto> paymentPrice = pDao.paymentPrice(id); //결제 가격
		PaymentPriceDto dto = paymentPrice.get(0);
		
		request.setAttribute("dto", dto);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("name", name);
		request.setAttribute("gender", gender);
		request.setAttribute("birth", birth);
		request.setAttribute("phoneNumber", phoneNumber);
		
		request.getRequestDispatcher("hanatour/jsp/tour/payment.jsp").forward(request, response);
		
	}
}
 