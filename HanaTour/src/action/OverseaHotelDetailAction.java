package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OverseaHotelDao;
import dto.AmenityDto;
import dto.AmenitySubtDto;
import dto.FacilityDto;
import dto.FacilitySubtDto;
import dto.HotelTagDto;
import dto.OverseaAdditionalInfoDto;
import dto.OverseaHotelDto;
import dto.OverseaHotelInfoDto;
import dto.OverseaHotelReviewDto;
import dto.OverseaReviewImgDto;
import dto.OverseaReviewOptionDto;
import dto.OverseaRoomDto;
import dto.OverseaRoomTypeDto;
import dto.OverseaTotalRatingDto;

public class OverseaHotelDetailAction implements OverseaAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OverseaHotelDao overseaDao = new OverseaHotelDao();
		
		ArrayList<OverseaHotelDto> listHotel = null;
		ArrayList<HotelTagDto> listTag = null;
		ArrayList<OverseaHotelInfoDto> bottomInfo = null;
		ArrayList<OverseaRoomTypeDto> listRoomTypeName = null;
		ArrayList<OverseaRoomDto> listType = null;
		ArrayList<OverseaAdditionalInfoDto> AdditionalInfo = null;
		ArrayList<AmenityDto> listAmenity = null;
		ArrayList<FacilityDto> listFacility = null;
		ArrayList<AmenitySubtDto> listAmenitySubt = null;
		ArrayList<FacilitySubtDto> listFacilitySubt = null;
		ArrayList<OverseaHotelReviewDto> listReview = null;
		ArrayList<OverseaReviewImgDto> listReviewImg = null;
		ArrayList<OverseaReviewOptionDto> listReviewOption = null;
		ArrayList<OverseaTotalRatingDto> listTotalRating = null;
		
		int innIdx = Integer.parseInt(request.getParameter("innIdx"));
		String inputCheckin = request.getParameter("inputCheckin");
		String inputCheckout = request.getParameter("inputCheckout");
		int roomNum = Integer.parseInt(request.getParameter("roomNum"));
		int inputPersonnel = Integer.parseInt(request.getParameter("inputPersonnel"));
		System.out.println("innIdx: "+ innIdx + "inputCheckin: "+inputCheckin + "inputCheckout"+ inputCheckout+ "roomNum: " + roomNum + "inputPersonnel: "+ inputPersonnel);
		
		try {
			listHotel = overseaDao.getHotelInfo(innIdx);
			listTag = overseaDao.getTagList(2);
			bottomInfo = overseaDao.getBottomHotelInfo(2);
			listRoomTypeName = overseaDao.getRoomType(1);
			listType = overseaDao.getRoomList(1, 3, 2, 2, "240803");
			AdditionalInfo = overseaDao.getAdditionalInfo(1);
			listAmenity = overseaDao.getAmenity(1);
			listFacility = overseaDao.getFacility(1);
			listAmenitySubt = overseaDao.getSubtAmenity(1);
			listFacilitySubt = overseaDao.getSubtFacility(1);
			listReview = overseaDao.getOverseaReview(1);	
			listReviewImg = overseaDao.getReviewImg();
			listReviewOption = overseaDao.getReviewOption();
			listTotalRating = overseaDao.getTotalRating(1);
		} catch(Exception e) {
			e.printStackTrace();
		} 
		System.out.println("OverseaHotelDetailAction까지 옴.");
		
		request.setAttribute("listHotel", listHotel);
		request.setAttribute("listTag", listTag);
		request.setAttribute("bottomInfo", bottomInfo);
		request.setAttribute("listRoomTypeName", listRoomTypeName);
		request.setAttribute("listType", listType);
		request.setAttribute("AdditionalInfo", AdditionalInfo);
		request.setAttribute("listAmenity", listAmenity);
		request.setAttribute("listFacility",listFacility );
		request.setAttribute("listAmenitySubt", listAmenitySubt );
		request.setAttribute("listFacilitySubt",listFacilitySubt );
		request.setAttribute("listReview", listReview );
		request.setAttribute("listReviewImg",listReviewImg );
		request.setAttribute("listReviewOption",listReviewOption );
		request.setAttribute("listTotalRating",listTotalRating );
		System.out.println("OverseaHotelDetailAction까지 옴.2");

		request.getRequestDispatcher("hanatour/jsp/main6_oversea/oversea_hotel_detail.jsp?innIdx="+innIdx+"&inputCheckin="+inputCheckin+"&inputCheckout="+inputCheckout+"&roomNum="+roomNum+"&inputPersonnel="+inputPersonnel).forward(request, response);
	}
}
