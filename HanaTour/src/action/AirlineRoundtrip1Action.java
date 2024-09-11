package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AirlineTicketDao;
import dto.AirlineTicketDto;

public class AirlineRoundtrip1Action implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// SEL 인천/김포 - 출발지
		String roundTripDepartureParam = request.getParameter("round_trip_departure_airport");
		String roundTripDepartureIata = roundTripDepartureParam.split(" ")[0];
		String roundTripDepartureCity = roundTripDepartureParam.split(" ")[1];
		request.setAttribute("roundTripDepartureIata", roundTripDepartureIata);
		request.setAttribute("roundTripDepartureCity", roundTripDepartureCity);
		
		// NRT 나리타 - 도착지
		String roundTripArrivalParam = request.getParameter("round_trip_arrival_airport");
		String roundTripArrivalIata = roundTripArrivalParam.split(" ")[0];
		String roundTripArrivalCity = roundTripArrivalParam.split(" ")[1];
		request.setAttribute("roundTripArrivalIata", roundTripArrivalIata);
		request.setAttribute("roundTripArrivalCity", roundTripArrivalCity);
		
		// 2024.10.08 - 출발일
		String roundTripDepartureDateParam = request.getParameter("round_trip_departure_date_calender");
		String roundTripDepartureDate = roundTripDepartureDateParam.replace(".", "-");
		request.setAttribute("roundTripDepartureDate", roundTripDepartureDate);
		
		// 2024.10.17 - 도착일
		String roundTripArrivalDateParam = request.getParameter("round_trip_arrival_date_calender");
		String roundTripArrivalDate = roundTripArrivalDateParam.replace(".", "-");
		request.setAttribute("roundTripArrivalDate", roundTripArrivalDate);
		
		// 직항여부 ("on" or null)
		String roundTripDirectFlight = request.getParameter("round_trip_direct");
		if(roundTripDirectFlight == null) {
			roundTripDirectFlight = "";
		} 
		request.setAttribute("roundTripDirectFlight", roundTripDirectFlight);
		
		
		
		// 성인 1명  '  일반석
		// 성인 1명,소아 1명  '  프레스티지석
		// 성인 2명,소아 1명,유아 1명  ' 일반석
		String roundTripMemberSeatClass = request.getParameter("round_trip_member");
		
		String roundTripMember = roundTripMemberSeatClass.split("'")[0];
		
		// 좌석
		String roundTripSeatClass = roundTripMemberSeatClass.split("'")[1].trim();
		request.setAttribute("roundTripSeatClass", roundTripSeatClass);
		
		
		String[] roundTripMemberSplit = roundTripMember.split(",");
		int roundTripAdult = 1;
		int roundTripChild = 0;
		int roundTripInfant = 0;
		
		Pattern numPattern = Pattern.compile("\\d+");
		
		Matcher adultNumMatcher = numPattern.matcher(roundTripMemberSplit[0]);
		if( adultNumMatcher.find() ) {
			String adultNumber = adultNumMatcher.group();
			roundTripAdult = Integer.parseInt(adultNumber);
		}
 		
		
		if(roundTripMemberSplit.length == 2) {
			if( roundTripMemberSplit[1].contains("소아") ) {
				Matcher numMatcher = numPattern.matcher(roundTripMemberSplit[1]);
				if( numMatcher.find() ) {
					String childNumber = numMatcher.group();
					roundTripChild = Integer.parseInt(childNumber);
				}
			} else if( roundTripMemberSplit[1].contains("유아") ) {
				Matcher numMatcher = numPattern.matcher(roundTripMemberSplit[1]);
				if( numMatcher.find() ) {
					String infantNumber = numMatcher.group();
					roundTripInfant = Integer.parseInt(infantNumber);
				}
			}
		} else if(roundTripMemberSplit.length == 3) {
			Matcher childNumMatcher = numPattern.matcher(roundTripMemberSplit[1]);
			Matcher infantNumMatcher = numPattern.matcher(roundTripMemberSplit[2]);
			
			if(childNumMatcher.find() ) {
				String childNumber = childNumMatcher.group();
				roundTripChild = Integer.parseInt(childNumber);
			}
			
			if( infantNumMatcher.find() ) {
				String infantNumber = infantNumMatcher.group();
				roundTripInfant = Integer.parseInt(infantNumber);
			}
			
		}
		
		// System.out.println("성인 : " + roundTripAdult);
		// System.out.println("소아 : " + roundTripChild);
		// System.out.println("유아 : " + roundTripInfant);
		// System.out.println("좌석 : " + roundTripSeatClass);
		
		request.setAttribute("roundTripAdult", roundTripAdult);
		request.setAttribute("roundTripChild", roundTripChild);
		request.setAttribute("roundTripInfant", roundTripInfant);
		
		// 좌석 선택수  = 성인 + 소아 (유아 제외)
		int seatNumber = roundTripAdult + roundTripChild;

		
		AirlineTicketDao aDao = new AirlineTicketDao();
		// 왕복 출발지 -> 도착지 티켓 리스트
		ArrayList<AirlineTicketDto> ticketList = aDao.getRoundTripAirlineTicket(roundTripDepartureIata, roundTripArrivalIata, roundTripDepartureDate, roundTripDirectFlight, seatNumber, roundTripSeatClass);
		
		request.setAttribute("ticketList", ticketList);
		
//				for(AirlineTicketDto val : ticketList) {
//					System.out.println(val.getTicketIdx() + ", " + val.getFlyingTime());			
//				}
		
		
		request.getRequestDispatcher("hanatour/jsp/main5_airline/main5_round_trip1.jsp").forward(request, response);
		
	}
}
