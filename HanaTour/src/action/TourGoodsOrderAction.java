package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TourGoodsOrderAction implements TourAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("command : order");
	 	String startDate = request.getParameter("startDate");
		String paramGoodsIdx = request.getParameter("goodsIdx");
		int goodsIdx = Integer.parseInt(paramGoodsIdx); 
		String paramTotalPrice = request.getParameter("totalPrice");
		int totalPrice = Integer.parseInt(paramTotalPrice);
		
		request.setAttribute("startDate", startDate);
		request.setAttribute("goodsIdx", goodsIdx);
		request.setAttribute("totalPrice", totalPrice);
		
		request.getRequestDispatcher("/hanatour/jsp/main8_tour/tour_order.jsp").forward(request, response);
	}

}
