package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainTourDao;
import dto.MainOrderDto;

public class OverSeaTourFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// mainTourDao 객체  생성
		MainTourDao mDao = new MainTourDao();
		
		// 메소드 객체 생성
		ArrayList<MainOrderDto> mainOrder = null;
		try {
			mainOrder = mDao.getListMainOrder("해외여행"); // 메인 투어 순서 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("mainOrder", mainOrder);
		request.getRequestDispatcher("hanatour/jsp/main2_oversea/main2_oversea_tour.jsp?main=해외여행").forward(request, response);
		
		
	}

}
