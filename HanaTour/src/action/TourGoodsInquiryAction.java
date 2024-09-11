package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourTicketDao;

public class TourGoodsInquiryAction implements TourAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String inquiryType = request.getParameter("select_inquiry_type");
		String goodsInquiryTitle = request.getParameter("write_inquiry_title");
		String question = request.getParameter("write_inquiry_content");
		String secret = request.getParameter("secret");
		String isSecret = (secret != null && secret.equals("secret_y")) ? "T" : "F";
		
		TourTicketDao tDao = new TourTicketDao();
		try {
			tDao.registerInquiry(1, "sy@ggmail.com", inquiryType, goodsInquiryTitle, question, isSecret);
		} catch (Exception e){
			e.printStackTrace();
			request.setAttribute("error", "등록 중 에러 발생!");
		}
        
        // RequestDispatcher를 사용하여 JSP로 포워딩
        RequestDispatcher rd = request.getRequestDispatcher("hanatour/jsp/main8_tour/tour_detail.jsp?goodsIdx=5");
        rd.forward(request, response);
	}

}
