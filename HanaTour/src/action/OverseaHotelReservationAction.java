package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OverseaHotelReservationDao;
import dto.OverseaHotelReservationDto;

public class OverseaHotelReservationAction implements OverseaAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
		int price = Integer.parseInt(request.getParameter("price"));
		String paramInputCheckout = request.getParameter("inputCheckout");
		int inputCheckout = Integer.parseInt(paramInputCheckout);
		int totalPrice = price * inputCheckout;
	  	OverseaHotelReservationDao rDao = new OverseaHotelReservationDao(); 
		ArrayList<OverseaHotelReservationDto> listHotelReservation = null;
		
		try {
			listHotelReservation = rDao.getReservation(roomIdx);
		}catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("roomIdx", roomIdx);
		request.setAttribute("price", price);
		request.setAttribute("inputCheckout", inputCheckout);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("listHotelReservation", listHotelReservation);
		System.out.println("OverseaHotelReservationAction까지 옴2.");
		request.getRequestDispatcher("/hanatour/jsp/main6_oversea/oversea_hotel_reservation.jsp").forward(request, response);
	}

}
