package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CustomerServiceAction;
import action.OverseaAction;
import action.OverseaHotelDetailAction;
import action.OverseaHotelReservationAction;
import action.OverseaMainAction;
import action.OverseaSearchAction;
import action.PrivateInquiryAction;

@WebServlet("/ControllerOversea")
public class ControllerOversea extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String command = request.getParameter("command");
		System.out.println("컨트롤러 command : " + command );
		OverseaAction action = null;
		
		switch(command) {
		case "oversea_main" : action = new OverseaMainAction(); break;
		case "oversea_search" : action = new OverseaSearchAction(); break;
		case "oversea_hotel_detail" : action = new OverseaHotelDetailAction(); break;
		case "oversea_hotel_reservation" : action = new OverseaHotelReservationAction(); break;
		case "customer_service" : action = new CustomerServiceAction(); break;
		case "private_inquiry" : action = new PrivateInquiryAction(); break;
		}
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
