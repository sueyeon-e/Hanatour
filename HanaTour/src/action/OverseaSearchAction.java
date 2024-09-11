package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OverseaHotelSearchDao;
import dto.*;

public class OverseaSearchAction implements OverseaAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OverseaHotelSearchDao sDao = new OverseaHotelSearchDao();
		ArrayList<OverseaHotelSearchDto> listOverseaSearch = null;
		ArrayList<OverseaHotelPrice> listHotelPrice = null;
		
		try {
		listOverseaSearch = sDao.getHotelSearch("240805", "3", 2, 2, "오사카");
		listHotelPrice = sDao.getLowestPrice();
		} catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("listOverseaSearch", listOverseaSearch);
		request.setAttribute("listHotelPrice", listHotelPrice);
		request.getRequestDispatcher("/hanatour/jsp/main6_oversea/hotel_search.jsp").forward(request, response);
		
	}
	
}
