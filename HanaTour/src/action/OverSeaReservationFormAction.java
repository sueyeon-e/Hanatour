package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TravelReservationDao;
import dto.*;

public class OverSeaReservationFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 받기
		int totalPrice = Integer.parseInt(request.getParameter("total_price"));
		int packageIdx = Integer.parseInt(request.getParameter("packageIdx"));
		System.out.println(totalPrice);
		System.out.println(packageIdx);
		
		// Dao
		TravelReservationDao trDao = new TravelReservationDao();
		
		// Dto
		ArrayList<TravelReservationProductInfoDto> trpiDto = trDao.reservationProductInfo(1);	// 예약상품 정보
		ArrayList<GetUserInfoDto> guiDto = trDao.getUserInfo("subin1222");	// 사용자 정보
		
		// setAttribute
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("trpiDto", trpiDto);
		request.setAttribute("guiDto", guiDto);
		
		request.getRequestDispatcher("hanatour/jsp/tour/tour_oversea_reservation.jsp").forward(request, response);
	}

}
