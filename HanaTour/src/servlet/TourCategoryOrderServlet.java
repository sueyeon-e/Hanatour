package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import dto.ShowCategoryOneLineInfoDto;


@WebServlet("/TourCategoryOrderServlet")
public class TourCategoryOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
