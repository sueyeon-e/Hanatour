package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.*;

@WebServlet("/TourController")
public class TourController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command;
		if(request.getParameter("command") == null) {
			command = "oversea_tour_form";
		} else {
			command = request.getParameter("command");
		}
		
		System.out.println("컨트롤러 command : " + command);
		
		Action action = null;
		switch(command) {
		case "oversea_tour_form" : action = new OverSeaTourFormAction(); break;
		case "category_form": action = new TourCategoryFormAction(); break;
		case "package_form" : action = new TourPackageFormAction(); break;
		case "oversea_reservation" : action = new OverSeaReservationFormAction(); break;
		case "tourPayment" : action = new PaymentFormAction(); break; 
		case "reservationCheck" : action = new ReservationCheckFormAction(); break;
		case "main_search" : action = new MainSearchFormAction(); break;
		 
		}
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
 