package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AirlinePaymentSuccessAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("hanatour/jsp/main5_airline/main5_airline_round_trip_seat_reservation1.jsp").forward(request, response);
	}
}
