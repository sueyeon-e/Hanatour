package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourTicketDao;
import dto.TourDetailPriceDto;
import dto.TourIconDto;
import dto.TourInquiryDto;
import dto.TourTicketDto;
import dto.TourTicketTypeDto;
import dto.TourTypeTitleDto;

public class GetGoodsDetailAction implements TourAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paramGoodsIdx = request.getParameter("goodsIdx");
		int goodsIdx = Integer.parseInt(paramGoodsIdx);
		
		ArrayList<TourTicketDto> listTourTicket = null;
		ArrayList<TourInquiryDto> listTourInquiry = null;
		ArrayList<TourIconDto> listTourIcon = null;
		ArrayList<TourTicketTypeDto> listTourType = null;
		ArrayList<TourTypeTitleDto> listTourTypeTitle = null;
		ArrayList<TourDetailPriceDto> listDetailPrice = null;
		
		try {
		TourTicketDao tDao = new TourTicketDao();
		listTourTicket = tDao.getTourTicketInfo(1);
		listTourInquiry = tDao.getTourInquiry(1);
		listTourIcon = tDao.getTourIcon(1);
		listTourType = tDao.getTourType(5, "240808");
		listTourTypeTitle = tDao.getTourTypeTitle();
		listDetailPrice = tDao.getTourDetailPriceInfo(14);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("goodsIdx", goodsIdx);
		request.setAttribute("listTourTicket", listTourTicket);
		request.setAttribute("listTourInquiry",listTourInquiry);
		request.setAttribute("listTourIcon", listTourIcon);
		request.setAttribute("listTourType", listTourType);
		request.setAttribute("listTourTypeTitle", listTourTypeTitle);
		request.setAttribute("listDetailPrice", listDetailPrice);
		
		//tour_detail.jsp로 이동!
		request.getRequestDispatcher("/hanatour/jsp/main8_tour/tour_detail.jsp?goodsIdx="+ goodsIdx).forward(request, response);

	}

}
