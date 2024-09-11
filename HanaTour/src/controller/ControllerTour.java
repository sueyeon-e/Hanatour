package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.GetGoodsDetailAction;
import action.TicketTourMainAction;
import action.TourAction;
import action.TourGoodsInquiryAction;
import action.TourGoodsOrderAction;
import action.TourSearchAction;

@WebServlet("/ControllerTour")
public class ControllerTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//request. 객체를 사용하기 전에 먼저 실행해줘야 한다.(여기에선 Controller)
		String cityName = request.getParameter("cityName");
		String command = request.getParameter("command");
//		String totalPrice = request.getParameter("totalPrice");
//		String goodsIdx = request.getParameter("goodsIdx");
//		String startDate = request.getParameter("startDate");
//		System.out.println("totalPrice"+ totalPrice + "goodsIdx"+goodsIdx + "startDate"+ startDate);
		System.out.println("컨트롤러 command : " + command );
		TourAction action = null;
		
		switch(command) {
		case "tour_main" : action = new TicketTourMainAction(); break;
		case "tour_search" : action = new TourSearchAction(); break;
		case "tour_goods_detail" : action = new GetGoodsDetailAction(); break;
//		case "tour_get_price" : action = new GetGoodsPriceAction(); break;
		case "tour_goods_inquiry" : action = new TourGoodsInquiryAction(); break;
		case "tour_goods_order" : action = new TourGoodsOrderAction(); break;
		}
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
