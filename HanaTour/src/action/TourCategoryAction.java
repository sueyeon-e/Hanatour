package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import dto.ShowCategoryOneLineInfoDto;

public class TourCategoryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 안쓰는 action 나중까지 안쓰면 지우기
		
		// 한글 인토딩 없으면 깨진다
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("post 요청");
		
		// 파라미터로 값 받기
		String sortOrder = request.getParameter("sortOrder");
		String countryCity = request.getParameter("countryCity");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String tour = request.getParameter("tour");
		System.out.println(sortOrder);
		System.out.println(countryCity);
		
		CategoryDao cDao = new CategoryDao();
		ArrayList<ShowCategoryOneLineInfoDto> dto = null;
		try {
			dto = cDao.showCategoryOneLineInfo(countryCity, sortOrder, tour);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("categoryOneLine", dto);
		request.setAttribute("sortOrder", sortOrder);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("tour", tour);
		request.getRequestDispatcher("TourController?command=category_form").forward(request, response);
		// request.getRequestDispatcher("hanatour/jsp/tour/tour_category.jsp").forward(request, response);
	}

}
