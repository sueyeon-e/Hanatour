package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TourTicketSearchDao;
import dto.TourTicketSearchDto;
import dto.TourTicketSearchPriceDto;

public class TourSearchAction implements TourAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TourTicketSearchDao tourSearchDao = new TourTicketSearchDao();
		String cityName = request.getParameter("cityName");
		int countTourByCity = tourSearchDao.getCountTourByCity(cityName);
		tourSearchDao.getCountTourByCity(cityName);
		ArrayList<TourTicketSearchDto> listTourSearch = tourSearchDao.getTourSearchList(cityName);
		ArrayList<TourTicketSearchPriceDto> listTourPrice = tourSearchDao.getTourPriceDto();
		
		request.setAttribute("cityName", cityName);
		request.setAttribute("listTourSearch", listTourSearch);
		request.setAttribute("listTourPrice", listTourPrice);
		request.setAttribute("countTourByCity", countTourByCity);
		
		RequestDispatcher rd = request.getRequestDispatcher("/hanatour/jsp/main8_tour/tour_search.jsp?cityName="+cityName);
		rd.forward(request, response);
		
		
	}

}
