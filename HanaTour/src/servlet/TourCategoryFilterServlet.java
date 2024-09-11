package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dto.CategoryBottomTagDto;
import dto.CategoryFlagDto;
import dto.CategoryPackageFlightInfoDto;
import dto.CategoryPackageInfoDto;
import dto.CategoryTagDto;
import dto.ShowCategoryOneLineInfoDto;

@WebServlet("/TourCategoryFilterServlet")
public class TourCategoryFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get 요청");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 파라미터 받기
		String countryCity = request.getParameter("countryCity");
		String startDate = request.getParameter("startDate");
		String sortOrder = request.getParameter("sortOrder");
		String tour = request.getParameter("tour");
		String flight = request.getParameter("flight");
		String departureDate = request.getParameter("departureDate");
		
		System.out.println(countryCity);
		System.out.println(startDate);
		System.out.println(sortOrder);
		System.out.println(tour);
		
		// 객체 생성 
		CategoryDao cDao = new CategoryDao();
		ArrayList<ShowCategoryOneLineInfoDto> categoryOneLine = null;
		ArrayList<CategoryTagDto> categoryTag = null;
		ArrayList<CategoryBottomTagDto> categoryBottomTag = null;
		ArrayList<CategoryPackageInfoDto> categoryPackage = null;
		ArrayList<CategoryFlagDto> categoryFlag = null;
		ArrayList<CategoryPackageFlightInfoDto> categoryPackageFlight = null;
		try {
			categoryOneLine = cDao.showCategoryOneLineInfo(countryCity, sortOrder,tour);
			categoryPackage = cDao.cetegoryPackageInfo(departureDate, flight);
			categoryFlag = cDao.categoryFlag(countryCity);
			categoryPackageFlight = cDao.categoryPackageFligthInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 파라미터 보내기 
		request.setAttribute("categoryOneLine", categoryOneLine);
		request.setAttribute("categoryTag", categoryTag);
		request.setAttribute("categoryBottomTag", categoryBottomTag);
		request.setAttribute("categoryFlag", categoryFlag);
		request.setAttribute("categoryPackageFlight", categoryPackageFlight);
		request.setAttribute("sortOrder", sortOrder);
		request.setAttribute("startDate", startDate);
		request.setAttribute("countryCity", countryCity);
		request.setAttribute("flight", flight);
		request.setAttribute("tour", tour);
		request.getRequestDispatcher("/hanatour/jsp/tour/tour_category.jsp?countryCity="+countryCity+"&startDate="+startDate+"&sortOrder="+sortOrder+"&tour="+tour+"&flight="+flight).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 요청");
	}

}
