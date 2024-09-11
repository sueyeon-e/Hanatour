package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import dto.*;

public class TourPackageFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 받기
		int packageIdx = Integer.parseInt(request.getParameter("packageIdx"));
		System.out.println(packageIdx);
		String countryCity = request.getParameter("countryCity");
		
		// Dao 객체 생성
		PackageDao pdao = new PackageDao();
		CategoryDao cDao = new CategoryDao();
		
		// 페이징
		int pageNum = 1; 
		try {
			pageNum = Integer.parseInt(request.getParameter("page")); // 페이지 파라미터가 없는 경우 이 코드가 업는 것 처럼 적용해서 1로 적용된다
		} catch (Exception e) {}
		int startNum, endNum;
		int lastPageNum;
		lastPageNum = pdao.getLastPageNumber(packageIdx);
		startNum = (pageNum/5*5+1) - (pageNum%5==0 ? 5 : 0);
		endNum = startNum + 4; 
		if(endNum > lastPageNum) {
			endNum = lastPageNum;
		}      
		
		// Dao 메소드 
		ArrayList<CategoryFlagDto> categoryFlag = cDao.categoryFlag(countryCity);	// 나라 국기
		ArrayList<PackageTopOneLineInfoDto> ptoliDto = pdao.packageTopOneLineInfo(packageIdx);	// 상단부 한줄 정보 
		ArrayList<String> topImg = pdao.packageTopImg(packageIdx);	// 상단부 이미지
		ArrayList<String> topTag = pdao.packageTopTag(packageIdx);	// 상단부 태그
		ArrayList<PackageTwoFlightInfoDto> twoFlightDto = pdao.packageTwoFlightInfo(packageIdx); // 왕복 비행기 정보
		ArrayList<PackageOneFlightInfoDto> oneFlightDto = pdao.packageOneFlightInfo(packageIdx); // 가는날 비행기 정보
		ArrayList<PackageReservationInfoDto> packageReservation = pdao.packageReservationInfo(packageIdx);	// 패키지 예약 정보
		ArrayList<PackagePriceDto> priceDto = pdao.packagePrice(packageIdx);	// 패키지 가격 정보
		ArrayList<PackageInfoDto> packageInfo = pdao.packageInfo(packageIdx);	// 패키지 정보
		ArrayList<PackageContainInfoDto> packageContainInfoDto = pdao.packageContainInfo(packageIdx);	// 패키지 포함, 불포함, 선택경비
		ArrayList<PackageReservationNoticeDto> packageReservationNotice = pdao.packageReservationNotice(packageIdx);	// 패키지 예약 공지 정보
		ArrayList<PackageMeetingInfoDto> packageMeetingInfoDto = pdao.packageMeetingInfo(packageIdx); // 패키지 미팅 정보
		ArrayList<HotelAttractionAttractionDto> hotelAttractionAttraction = pdao.HotelAttractionAttraction(packageIdx);	// 호텔관광지 정보
		ArrayList<TabSmallHotelBoxDto> tabSmallHotelBox = pdao.tabSmallHotelBox(packageIdx);	// 호텔 작은 상자 정보
		ArrayList<TabHotelInfoDto> tabHotelInfoDto = pdao.tabHotelInfo(packageIdx);	// 호텔 전체 정보
		ArrayList<HotelAmenityDto> hotelAmenity = pdao.hotelAmenity();	// 호텔 부대시설
		ArrayList<HotelFacilityDto> hotelFacility = pdao.hotelFacility();	//호텔 객실 정보
		ArrayList<ScheduleOrderDto> scheduleOrder = pdao.scheduleOrder(packageIdx);	//여행일정 순서 
		ArrayList<Type1FlightDto> type1Flight = pdao.type1Flight(packageIdx);	// type1 항공
		ArrayList<Type2CityDto> type2City = pdao.type2City(packageIdx);	// type2 도시 
		ArrayList<Type3ThinTextDto> type3ThinText = pdao.type3ThinText(packageIdx);	// type3 얇은 text
		ArrayList<Type4BoldTextDto> type4BoldText = pdao.type4BoldText(packageIdx);	// type4 굵은   text
		ArrayList<Type5AttractionDto> type5Attraction = pdao.type5Attraction(packageIdx);	// type5 관광지
		ArrayList<Integer> type5AttractionMany = pdao.type5AttractionMany(packageIdx);	// type5 관광지 여러개
		ArrayList<Type5AttractionImgDto> type5AttractionImg = pdao.type5AttractionImg(packageIdx);	// type5 이미지
		ArrayList<Type6FoodDto> type6Food = pdao.type6Food(packageIdx);	// type6 음식
		ArrayList<Type6FoodImgDto> type6FoodImg = pdao.type6FoodImg(packageIdx);	// type6 음식 이미지
		ArrayList<Type8NoticeDto> type8Notice = pdao.type8Notice(packageIdx);	// type8 공지사항
		ArrayList<Type8NoticeImgDto> type8NoticeImg = pdao.type8NoticeImg(packageIdx);	// type8 공지사항 이미지
		ArrayList<Type9InnDto> type9Inn = pdao.type9Inn(packageIdx);	// type9 숙소
		ArrayList<Type10MealDto> type10Meal = pdao.type10Meal(packageIdx);	// type10 식사
		ArrayList<PackageReviewContentDto> packageReviewContent = pdao.packageReviewContent(packageIdx, pageNum);	// 패키지 리뷰 내용
		ArrayList<PackageReviewImgDto> packageReviewImg = pdao.packageReviewImg();	// 패키지 리뷰 이미지
		ArrayList<PackageReviewTagDto> packageReviewTag = pdao.packageReviewTag();	// 패키지 리뷰 태그
		ArrayList<String> reviewCategoryPackage = pdao.reviewCategoryPackage(packageIdx);	// 리뷰 카테고리 패키지 정보 
		int maxReviewIdx = pdao.maxReviewIdx();	// 리뷰 최대 idx
		String date = pdao.countDay(hotelAttractionAttraction.get(0).getAttractionDate()); // 날짜 계산
		ArrayList<SafetyInfoDto> safetyInfo = pdao.safetyInfo(packageIdx);	// 안전정보
		ArrayList<OptionalTourDto> optionalTourContent =pdao.optionalTourContent(packageIdx);	// 선택관광
		ArrayList<OptionalTourDto> optionalTourTitle =pdao.optionalTourTitle(packageIdx);	// 선택관광 제목
		ArrayList<ScheduleTitleDto> scheduleTitle = pdao.scheduleTitle(packageIdx);	// 스케쥴 제목
		PackageTopOneLineInfoDto topdto = ptoliDto.get(0);	// 패키지 상단 상품정보  (사진정보 제외)
		PackageTwoFlightInfoDto departureInfoDto = twoFlightDto.get(0);	// 항공 출발일 
		PackageTwoFlightInfoDto arrivalInfoDto = twoFlightDto.get(1);	// 항공 도착일 
		PackageOneFlightInfoDto oneFlightInfo = oneFlightDto.get(0);	// 패키지 한줄 항공정보 
		PackageReservationInfoDto reservationInfo = packageReservation.get(0);	// 도시정보와 예약 계산하는 한줄 데이터
		PackagePriceDto packagePrice = priceDto.get(0);	// 패키지의 가격 정보 데이터 한 줄 
		PackageContainInfoDto packageContainInfo = packageContainInfoDto.get(0);	// 패키지 포함내역 데이터 한 줄 
		PackageMeetingInfoDto packageMeetingInfo = packageMeetingInfoDto.get(0);	// 패키지 미팅 데이터 한 줄 
		
		
		// String ------> Date객체 + 날짜연산 -----> String
		// date부터 시작해서 scheduleTitle.size()까지  // ex. "2024.08.02(금)"부터 시작해서 +5일까지. ----> ArrayList<String> listDateString(size:5) 에 넣을게요.
		int sizeDate = scheduleTitle.size();
		ArrayList<String> listDateString = new ArrayList<String>();
		for(int i=0; i<=sizeDate-1; i++) {
			// "2024.08.02(금)" 를 Date 객체로.
			Calendar cal = Calendar.getInstance();
			int yearNum = Integer.parseInt(date.substring(0,4));
			int monthNum = Integer.parseInt(date.substring(5,7));
			int dateNum = Integer.parseInt(date.substring(8,10));
			cal.set(yearNum, monthNum-1, dateNum);

			// Date 객체, +i 일.
			cal.add(Calendar.DATE, +i);
			
			// Date 객체를 String 객체로 변환. --> add.
			yearNum = cal.get(Calendar.YEAR);
			monthNum = cal.get(Calendar.MONTH) + 1;
			dateNum = cal.get(Calendar.DAY_OF_MONTH)-1;
			String yoil = new String[] {"", "일", "월", "화", "수", "목", "금", "토"}[cal.get(Calendar.DAY_OF_WEEK)];	// 뒤에 []를 붙이면 인덱스 선언으로 사용할 수 있다
			String newDate = yearNum + "." + (monthNum<=9 ? "0" : "") + monthNum + "." + (dateNum<=9 ? "0" : "") + dateNum + "(" + yoil + ")";
			listDateString.add(newDate);
		}
		
		
		// date 없애기 생각해보기
		request.setAttribute("packageIdx", packageIdx);
		System.out.println(packageIdx + "2");
		request.setAttribute("countryCity" , countryCity);
		request.setAttribute("categoryFlag", categoryFlag );
		request.setAttribute("ptoliDto", ptoliDto);
		request.setAttribute("topImg", topImg);
		request.setAttribute("topTag", topTag);
		request.setAttribute("twoFlightDto", twoFlightDto);
		request.setAttribute("oneFlightDto", oneFlightDto);
		request.setAttribute("packageReservation", packageReservation);
		request.setAttribute("priceDto", priceDto);
		request.setAttribute("packageInfo", packageInfo);
		request.setAttribute("packageContainInfoDto", packageContainInfoDto);
		request.setAttribute("packageReservationNotice",  packageReservationNotice);
		request.setAttribute("packageMeetingInfoDto", packageMeetingInfoDto);
		request.setAttribute("hotelAttractionAttraction", hotelAttractionAttraction);
		request.setAttribute("tabSmallHotelBox", tabSmallHotelBox);
		request.setAttribute("tabHotelInfoDto", tabHotelInfoDto);
		request.setAttribute("hotelAmenity", hotelAmenity);
		request.setAttribute("hotelFacility", hotelFacility);
		request.setAttribute("scheduleOrder", scheduleOrder);
		request.setAttribute("type1Flight", type1Flight);
		request.setAttribute("type2City", type2City);
		request.setAttribute("type3ThinText", type3ThinText);
		request.setAttribute("type4BoldText", type4BoldText);
		request.setAttribute("type5Attraction", type5Attraction);
		request.setAttribute("type5AttractionMany", type5AttractionMany);
		request.setAttribute("type5AttractionImg", type5AttractionImg);
		request.setAttribute("type6Food", type6Food);
		request.setAttribute("type6FoodImg", type6FoodImg);
		request.setAttribute("type8Notice", type8Notice);
		request.setAttribute("type8NoticeImg", type8NoticeImg);
		request.setAttribute("type9Inn", type9Inn);
		request.setAttribute("type10Meal", type10Meal);
		request.setAttribute("packageReviewContent", packageReviewContent);
		request.setAttribute("packageReviewImg", packageReviewImg); 
		request.setAttribute("packageReviewTag", packageReviewTag); 
		request.setAttribute("reviewCategoryPackage", reviewCategoryPackage); 
		request.setAttribute("maxReviewIdx", maxReviewIdx); 
		request.setAttribute("date", date);
		request.setAttribute("safetyInfo", safetyInfo);
		request.setAttribute("optionalTourContent", optionalTourContent);
		request.setAttribute("optionalTourTitle", optionalTourTitle);
		request.setAttribute("scheduleTitle", scheduleTitle);
		request.setAttribute("topdto", topdto);
		request.setAttribute("departureInfoDto", departureInfoDto);
		request.setAttribute("arrivalInfoDto", arrivalInfoDto);
		request.setAttribute("oneFlightInfo", oneFlightInfo);
		request.setAttribute("reservationInfo", reservationInfo);
		request.setAttribute("packagePrice", packagePrice);
		request.setAttribute("packageContainInfo", packageContainInfo);
		request.setAttribute("packageMeetingInfo", packageMeetingInfo);
		request.setAttribute("listDateString", listDateString);  
		request.setAttribute("maxReviewIdx", maxReviewIdx);
		
		request.getRequestDispatcher("hanatour/jsp/tour/tour_package.jsp").forward(request, response);
		
		
	}
}
											