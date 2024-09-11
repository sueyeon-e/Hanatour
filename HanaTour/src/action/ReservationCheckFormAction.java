package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import dto.*;

public class ReservationCheckFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Session 받기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");	// 아이디
		
		// Dao 
		ReservationCheckDao rcDao = new ReservationCheckDao();
		
		// Dto 
		ArrayList<TravelReservationCheckDto> trcDto = rcDao.travelReservationCheck(id); // 여행 예약 
		ArrayList<TravelCancelCheckDto> tccDto = rcDao.travelCancelCheck(id); // 여행 예약 취소
		ArrayList <HotelReservationCheckDto> hrcDto = rcDao.hotelReservationCheck(id); // 숙소 예약 
		ArrayList<HotelCancelCheckDto> hccDto = rcDao.hotelCancelCheck(id); // 숙소 예약 취소
		ArrayList<OverseaFlightReservationCheckDto> ofrcDto = rcDao.overseaFlightReservationCheck(id); // 해외항공 예약
		ArrayList<OverseaFlightCancelCheckDto> ofccDto = rcDao.overseaFlightCancelCheck(id); // 해외 항공 예약 취소
		ArrayList<DomesticFlightReservationCheckDto> dfrcDto = rcDao.domesticFlightReservationCheck(id); // 국내항공 예약
		ArrayList<DomesticFlightCancelCheckDto> dfccDto = rcDao.domesticFlightCancelCheck(id); // 국내항공 예약 취소 
		ArrayList<ShowTourReservationDto> showTourReservation = rcDao.showTourReservation(id); // 투어 예약
		
		request.setAttribute("trcDto", trcDto);
		request.setAttribute("tccDto", tccDto);
		request.setAttribute("hrcDto", hrcDto);
		request.setAttribute("hccDto", hccDto);
		request.setAttribute("ofrcDto", ofrcDto);
		request.setAttribute("ofccDto", ofccDto);
		request.setAttribute("dfrcDto", dfrcDto);
		request.setAttribute("dfccDto", dfccDto);
		request.setAttribute("showTourReservation", showTourReservation);
		
		request.getRequestDispatcher("hanatour/jsp/reservation_check/reservation_check.jsp").forward(request, response);
	}
}
