package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AirlineTicketDao;
import dao.LoginDao;
import dto.AirlineTicketDto;
import dto.UserInfoDto;

public class AirlineRoundtrip6Reservation3Action implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if( session.getAttribute("loginId") != null ) {
			LoginDao lDao = new LoginDao();
			UserInfoDto uDto = lDao.getLoginUserDto( (String)session.getAttribute("loginId") );
			request.setAttribute("userInfo", uDto);
		}	
		
		
		String roundTripDepartureIata = request.getParameter("roundtrip_departure_iata");
		String roundTripDepartureCity = request.getParameter("roundtrip_departure_city");
		String roundTripDepartureDate = request.getParameter("roundtrip_departure_date");
		
		String roundTripArrivalIata = request.getParameter("roundtrip_arrival_iata");
		String roundTripArrivalCity = request.getParameter("roundtrip_arrival_city");
		String roundTripArrivalDate = request.getParameter("roundtrip_arrival_date");
		
		int roundTripAdult = Integer.parseInt( request.getParameter("roundtrip_adult") );
		int roundTripChild = Integer.parseInt( request.getParameter("roundtrip_child") );
		int roundTripInfant = Integer.parseInt( request.getParameter("roundtrip_infant") );
		int totalMember = roundTripAdult + roundTripChild + roundTripInfant;
		request.setAttribute("totalMember", totalMember);
		
		// int seatNumber = roundTripAdult + roundTripChild;
		
		String roundTripSeatClass = request.getParameter("roundtrip_seat_class").trim();
		String roundTripDirectFlight = request.getParameter("roundtrip_direct_flight");
		
		int roundTripAirlineTicket1 = Integer.parseInt( request.getParameter("roundtrip_airline_ticket1") );
		int roundTripAirlineTicket2 = Integer.parseInt( request.getParameter("roundtrip_airline_ticket2") );

		double totalPriceDouble = Double.parseDouble( request.getParameter("roundtrip_total_price") );
		int totalPrice = (int)totalPriceDouble;
		
		
		// 선택된 티켓(2개) 담을 배열
		int[] selectedroundTripAirlineTikcetList = new int[2];
		selectedroundTripAirlineTikcetList[0] = roundTripAirlineTicket1;
		selectedroundTripAirlineTikcetList[1] = roundTripAirlineTicket2;
		request.setAttribute("selectedroundTripAirlineTikcetList", selectedroundTripAirlineTikcetList);
		
		AirlineTicketDao aDao = new AirlineTicketDao();
		ArrayList<AirlineTicketDto> selectedTicketList = aDao.getAirlineTicketByTicektIdx(selectedroundTripAirlineTikcetList, roundTripSeatClass);
		request.setAttribute("selectedTicketList", selectedTicketList);
		
		request.setAttribute("roundTripDepartureIata", roundTripDepartureIata);
		request.setAttribute("roundTripDepartureCity", roundTripDepartureCity);
		request.setAttribute("roundTripDepartureDate", roundTripDepartureDate);
		
		request.setAttribute("roundTripArrivalIata", roundTripArrivalIata);
		request.setAttribute("roundTripArrivalCity", roundTripArrivalCity);
		request.setAttribute("roundTripArrivalDate", roundTripArrivalDate);
		
		request.setAttribute("roundTripAdult", roundTripAdult);
		request.setAttribute("roundTripChild", roundTripChild);
		request.setAttribute("roundTripInfant", roundTripInfant);
		
		
		
		request.setAttribute("roundTripSeatClass", roundTripSeatClass);
		request.setAttribute("roundTripDirectFlight", roundTripDirectFlight);
		
		request.setAttribute("selectedroundTripAirlineTikcetList", selectedroundTripAirlineTikcetList);
		
		request.setAttribute("totalPrice", totalPrice);
		
		request.getRequestDispatcher("hanatour/jsp/main5_airline/main5_airline_payment.jsp").forward(request, response);
		
	}
}
