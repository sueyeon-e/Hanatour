package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TicketTourMainAction implements TourAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TicketTourMainAction까지 넘어옴.");
		request.getRequestDispatcher("/hanatour/jsp/main8_tour/tour_main.jsp").forward(request, response);
	}

}
