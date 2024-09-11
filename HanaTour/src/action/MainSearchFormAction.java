package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainSearchDao;
import dto.RecommendAttractionTopDto;
import dto.RecommendHotelDto;
import dto.RecommendPackageCityDto;
import dto.RecommendPackageDateDto;
import dto.RecommendPackageOneInfoDto;
import dto.RecommendTicketDto;

public class MainSearchFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 받기 
		String countryCity = request.getParameter("search_keyword");
		
		//MainSearchDao 객체 생성
		MainSearchDao mDao = new MainSearchDao();
		
		// CategoryDao 메소드 
		ArrayList<RecommendPackageOneInfoDto> recommendPackageOneInfo = mDao.recommendPackageOneInfo(countryCity); // 해외여행 추천 한줄 정보
		ArrayList<RecommendPackageDateDto> recommendPackageDate = mDao.recommendPackageDate(); // 해외여행 추천 출발일 도착일 정보
		ArrayList<RecommendPackageCityDto> recommendPackageCity = mDao.recommendPackageCity(); // 추천 해외여행 지역 
		ArrayList<RecommendAttractionTopDto> recommendAttractionTop = mDao.recommendAttractionTop(countryCity); // 추천여행지 
		ArrayList<RecommendHotelDto> recommendHotel = mDao.recommendHotel(countryCity); // 추천 호텔 
		ArrayList<RecommendTicketDto> recommendTicket = mDao.recommendTicket(countryCity);	// 추천 투어 입장권
		
		//setAttribute 
		request.setAttribute("countryCity", countryCity);
		request.setAttribute("recommendPackageOneInfo", recommendPackageOneInfo);
		request.setAttribute("recommendPackageDate", recommendPackageDate);
		request.setAttribute("recommendPackageCity", recommendPackageCity);
		request.setAttribute("recommendAttractionTop", recommendAttractionTop);
		request.setAttribute("recommendHotel", recommendHotel);
		request.setAttribute("recommendTicket", recommendTicket);
		
		request.getRequestDispatcher("hanatour/jsp/tour/main_search.jsp").forward(request, response);


	}

}
