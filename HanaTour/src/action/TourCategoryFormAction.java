package action;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dto.*;

public class TourCategoryFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 현재 년도
		LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
		int nowYear = Integer.parseInt(now.format(dtf));	
		// 현재 달
		dtf = DateTimeFormatter.ofPattern("MM");
		int nowMonth = Integer.parseInt(now.format(dtf));
		
		// 파라미터 받기 
		String countryCity = null;
		countryCity = request.getParameter("countryCity");
		String startDate = null;
		startDate = request.getParameter("startDate");
		String endDate = null; 
		endDate = request.getParameter("endDate");
		String sortOrder = null;
		sortOrder = request.getParameter("sortOrder");
		String tour = null;
		tour = request.getParameter("tour");
		String flight = null;
		flight = request.getParameter("flight");
		
		// 파라미터 출발일 형식 맞추기 
		String departureDate = null;
		 if (startDate != null && startDate.length() >= 8) {
		       departureDate =  startDate.substring(0,4) + "-" +
		    		   			startDate.substring(4,6) + "-" +
		    		   			startDate.substring(6,8);
		  }
		  
		// Dao
		CategoryDao cDao = new CategoryDao();
		
		// Dto
		ArrayList<ShowCategoryOneLineInfoDto> categoryOneLine = null; // 카테고리 한줄 정보 
		try {
			categoryOneLine = cDao.showCategoryOneLineInfo(countryCity, sortOrder, tour);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CategoryTagDto> categoryTag = null; // 카테고리 태그 
		try {
			categoryTag = cDao.categoryTag();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CategoryBottomTagDto> categoryBottomTag = null; // 카테고리 하위 태그
		try {
			categoryBottomTag = cDao.categoryBottomTag();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CategoryPackageInfoDto> categoryPackage  = null;	// 카테고리 패키지
		try {
			categoryPackage = cDao.cetegoryPackageInfo(departureDate, (String)request.getAttribute("tour")); // 여기 숫자 고정
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CategoryPackageFlightInfoDto> categoryPackageFlight = null;	// 카테고리 항공 
		try {
			categoryPackageFlight = cDao.categoryPackageFligthInfo();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<CategoryFlagDto> categoryFlag = null;	// 카데고리 국기
		try {
			categoryFlag = cDao.categoryFlag(countryCity);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("countryCity", countryCity);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("departureDate", departureDate);
		request.setAttribute("nowYear", nowYear);
		request.setAttribute("nowMonth", nowMonth);
		request.setAttribute("sortOrder", sortOrder);
		request.setAttribute("tour", tour);
		request.setAttribute("categoryOneLine", categoryOneLine);
		request.setAttribute("categoryTag", categoryTag );
		request.setAttribute("categoryBottomTag", categoryBottomTag );
		request.setAttribute("categoryPackage", categoryPackage );
		request.setAttribute("categoryPackageFlight", categoryPackageFlight );
		request.setAttribute("categoryFlag", categoryFlag );
		
		request.getRequestDispatcher("hanatour/jsp/tour/tour_category.jsp").forward(request, response);
		
		
	}

}
