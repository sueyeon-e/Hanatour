<%@page import="java.util.Calendar"%>
<%@page import="dto.* "%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// Dao 객체 생성
	PackageDao pdao = new PackageDao();
	CategoryDao cDao = new CategoryDao();
	
	// Dto
	ArrayList<CategoryFlagDto> categoryFlag = (ArrayList<CategoryFlagDto>)request.getAttribute("categoryFlag");
	ArrayList<PackageTopOneLineInfoDto> ptoliDto = (ArrayList<PackageTopOneLineInfoDto>)request.getAttribute("ptoliDto");
	ArrayList<String> topImg = (ArrayList<String>)request.getAttribute("topImg");
	ArrayList<String> topTag = (ArrayList<String>)request.getAttribute("topTag");
	ArrayList<PackageTwoFlightInfoDto> twoFlightDto = (ArrayList<PackageTwoFlightInfoDto>)request.getAttribute("twoFlightDto");
	ArrayList<PackageOneFlightInfoDto> oneFlightDto = (ArrayList<PackageOneFlightInfoDto>)request.getAttribute("oneFlightDto");
	ArrayList<PackageReservationInfoDto> packageReservation = (ArrayList<PackageReservationInfoDto>)request.getAttribute("packageReservation");
	ArrayList<PackagePriceDto> priceDto = (ArrayList<PackagePriceDto>)request.getAttribute("priceDto");
	ArrayList<PackageInfoDto> packageInfo = (ArrayList<PackageInfoDto>)request.getAttribute("packageInfo");
	ArrayList<PackageContainInfoDto> packageContainInfoDto = (ArrayList<PackageContainInfoDto>)request.getAttribute("packageContainInfoDto");
	ArrayList<PackageReservationNoticeDto> packageReservationNotice = (ArrayList<PackageReservationNoticeDto>)request.getAttribute("packageReservationNotice");
	ArrayList<PackageMeetingInfoDto> packageMeetingInfoDto = (ArrayList<PackageMeetingInfoDto>)request.getAttribute("packageMeetingInfoDto");
	ArrayList<HotelAttractionAttractionDto> hotelAttractionAttraction = (ArrayList<HotelAttractionAttractionDto>)request.getAttribute("hotelAttractionAttraction");
	ArrayList<TabSmallHotelBoxDto> tabSmallHotelBox = (ArrayList<TabSmallHotelBoxDto>)request.getAttribute("tabSmallHotelBox");
	ArrayList<TabHotelInfoDto> tabHotelInfoDto = (ArrayList<TabHotelInfoDto>)request.getAttribute("tabHotelInfoDto");
	ArrayList<HotelAmenityDto> hotelAmenity = (ArrayList<HotelAmenityDto>)request.getAttribute("hotelAmenity");
	ArrayList<HotelFacilityDto> hotelFacility = (ArrayList<HotelFacilityDto>)request.getAttribute("hotelFacility");
	ArrayList<ScheduleOrderDto> scheduleOrder = (ArrayList<ScheduleOrderDto>)request.getAttribute("scheduleOrder");
	ArrayList<Type1FlightDto> type1Flight = (ArrayList<Type1FlightDto>)request.getAttribute("type1Flight");
	ArrayList<Type2CityDto> type2City = (ArrayList<Type2CityDto>)request.getAttribute("type2City");
	ArrayList<Type3ThinTextDto> type3ThinText = (ArrayList<Type3ThinTextDto>)request.getAttribute("type3ThinText");
	ArrayList<Type4BoldTextDto> type4BoldText = (ArrayList<Type4BoldTextDto>)request.getAttribute("type4BoldText");
	ArrayList<Type5AttractionDto> type5Attraction = (ArrayList<Type5AttractionDto>)request.getAttribute("type5Attraction");
	ArrayList<Integer> type5AttractionMany = (ArrayList<Integer>)request.getAttribute("type5AttractionMany");
	ArrayList<Type5AttractionImgDto> type5AttractionImg = (ArrayList<Type5AttractionImgDto>)request.getAttribute("type5AttractionImg");
	ArrayList<Type6FoodDto> type6Food = (ArrayList<Type6FoodDto>)request.getAttribute("type6Food");
	ArrayList<Type6FoodImgDto> type6FoodImg = (ArrayList<Type6FoodImgDto>)request.getAttribute("type6FoodImg");
	ArrayList<Type8NoticeDto> type8Notice = (ArrayList<Type8NoticeDto>)request.getAttribute("type8Notice");
	ArrayList<Type8NoticeImgDto> type8NoticeImg = (ArrayList<Type8NoticeImgDto>)request.getAttribute("type8NoticeImg");
	ArrayList<Type9InnDto> type9Inn = (ArrayList<Type9InnDto>)request.getAttribute("type9Inn");
	ArrayList<Type10MealDto> type10Meal = (ArrayList<Type10MealDto>)request.getAttribute("type10Meal");
	ArrayList<PackageReviewContentDto> packageReviewContent = (ArrayList<PackageReviewContentDto>)request.getAttribute("packageReviewContent");
	ArrayList<PackageReviewImgDto> packageReviewImg = (ArrayList<PackageReviewImgDto>)request.getAttribute("packageReviewImg"); 
	ArrayList<PackageReviewTagDto> packageReviewTag = (ArrayList<PackageReviewTagDto>)request.getAttribute("packageReviewTag"); 
	ArrayList<String> reviewCategoryPackage = (ArrayList<String>)request.getAttribute("reviewCategoryPackage"); 
	ArrayList<SafetyInfoDto> safetyInfo = (ArrayList<SafetyInfoDto>)request.getAttribute("safetyInfo");
	ArrayList<OptionalTourDto> optionalTourContent = (ArrayList<OptionalTourDto>)request.getAttribute("optionalTourContent");
	ArrayList<OptionalTourDto> optionalTourTitle = (ArrayList<OptionalTourDto>)request.getAttribute("optionalTourTitle");
	ArrayList<ScheduleTitleDto> scheduleTitle = (ArrayList<ScheduleTitleDto>)request.getAttribute("scheduleTitle");
	PackageTopOneLineInfoDto topdto = (PackageTopOneLineInfoDto)request.getAttribute("topdto");
	PackageTwoFlightInfoDto departureInfoDto = (PackageTwoFlightInfoDto)request.getAttribute("departureInfoDto");
	PackageTwoFlightInfoDto arrivalInfoDto = (PackageTwoFlightInfoDto)request.getAttribute("arrivalInfoDto");
	PackageOneFlightInfoDto oneFlightInfo = (PackageOneFlightInfoDto)request.getAttribute("oneFlightInfo");
	PackageReservationInfoDto reservationInfo = (PackageReservationInfoDto)request.getAttribute("reservationInfo");
	PackagePriceDto packagePrice = (PackagePriceDto)request.getAttribute("packagePrice");
	PackageContainInfoDto packageContainInfo = (PackageContainInfoDto)request.getAttribute("packageContainInfo");
	PackageMeetingInfoDto packageMeetingInfo = (PackageMeetingInfoDto)request.getAttribute("packageMeetingInfo");
	ArrayList<String> listDateString = (ArrayList<String>)request.getAttribute("listDateString");  
	String date = (String)request.getAttribute("date");
	int maxReviewIdx = (int)request.getAttribute("maxReviewIdx");
%> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/tour_package.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="header.jsp" %>    
    <div id="category_body" class="center">
    	<div id="div_country_check">
			<div class="fl"><img src="<%=categoryFlag.get(0).getFlagImg() %>" alt="국기"/></div>
			<div class="fl"><strong><%=categoryFlag.get(0).getCountryName() %> :</strong> 여행 전 입국 규정을 확인해 주세요</div>
			<div style="clear:both;"></div>
		</div>
		
		<div id="img_price">
			<div class="fl">
				<div id="main_img_slider">
					<div class="main_slider_left"></div>
					<div class="main_slider_right"></div>
					<ul id="main_img_list">
						<%
							for(String dto : topImg) {
						%>
							<li class="fl">
								<img src="<%=dto %>" alt="여행지 사진">
							</li>
						<%
							}
						%>
						<div style="clear:both;"></div>
					</ul>
					
				</div>
				
				<div>
					<div class="fl">
						<div>상품코드<span><strong><%=topdto.getPackageNumber() %></strong></span></div>
					</div>
					<div class="fr">
						<span class="print_img"></span>
						<span class="share_img"></span>
					</div>
					<div style="clear:both;"></div>
				</div>
			</div>
			<div class="fr">
				<div>
					<button type="button" class="fr">여행상품 핵심정보</button>
					<div style="clear:both;"></div>
				</div>
				<div>
					<div class="fl save">세이브</div>
					<div style="clear:both;"></div>
				</div>
				<div>
					<div><strong><%=topdto.getPackageName() %></strong></div>
					<div>
						<span class="i_img fl"></span>
						<div class="fl"><%=topdto.getPackageEx() %></div>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div>
					<div class="fl">
						<%
							for (String dto : topTag) {
						%>
							<span><%=dto%></span>
						<%
							}
						%>
					</div>
					<div class="fr">
						<div class="fl">
							<a href="#travel_review_detail" class="purple_star_img fl"></a>
							<a href="#travel_review_detail" class="purple_font fl"><%=topdto.getReviewStar() %></a>
							<div style="clear:both;"></div>
						</div>
						<div class="fl">
							<a href="#travel_review_detail" class="comment_img fl"></a>
							<a href="#travel_review_detail" class="fl"><%=topdto.getReviewComment() %></a>
							<div style="clear:both;"></div>
						</div>
						<div style="clear:both;'"></div>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div>
					<div class="fl">
						<div class="calender_img"></div>
						<div><%=topdto.getTravelPeriod() %></div>
					</div>
					<div class="fl">
						<%
							if(topdto.getFlight().equals("T")) {
						%>
								<div class="flight_img"></div>
								<div><%=topdto.getAirline() %></div>
						<%
							} else {
						%>
								<div class="flight_no_img"></div>
								<div>항공없음</div>
						<%
							}
						%>
					</div>
					<div class="fl">
						<%
							if(topdto.getShopping().equals("T")) {
						%>
								<div class="shopping_img"></div>
								<div><%=topdto.getShoppingTimes() %></div>
						<%
							} else {
						%>
								<div class="shopping_no_img"></div>
								<div>쇼핑없음</div>
						<%
							}
						%>
					</div>
					<div class="fl">
						<div class="with_img"></div>
						<div>
							<%
								if(topdto.getGroupTravel().equals("T")) {
							%>
									단체여행
							<%
								} else {
							%>
									우리끼리여행
							<%
								}
							%>
						</div>
					</div>
					<div class="fl">
						<%
							if(topdto.getFreeTour().equals("T")) {
						%>
								<div class="free_schedule_img"></div>
								<div>자유일정포함</div>
						<%
							} else {
						%>
							<div class="free_schedule_img"></div>
							<div>자유일정불포함</div>
						<%
							}
						%>
					</div>
					<div class="fl">
						<%
							if(topdto.getGuide().equals("T")) {
						%>
								<div class="guide_fee_img"></div>
								<div>가이드경비<br/><%=topdto.getGuideFee() %></div>
						<%
							} else {
						%>
								<div class="guide_fee_no_img"></div>
								<div>가이드경비 없음</div>
						<%
							}
						%>
					</div>
					<div class="fl">
						<%
							if(topdto.getOptionalTour().equals("T")) {
						%>
								<div class="optional_tour_img"></div>
								<div>선택관광포함</div>
						<%
							} else {
						%>
								<div class="optional_tour_no_img"></div>
								<div>선택관광없음</div>
						<%
							}
						%>	
						
					</div>
					<div style="clear:both;"></div>
				</div>
				<div>
					<span class="confirmed">출발확정</span>
					<span class="confirmed_not">항공예정</span>
					<span class="confirmed_not">일정예정</span>
					<span class="confirmed_not"> 호텔예정</span>
					<span class="confirmed_not">가격예정</span>
				</div>
				<div >
					<div>
						<div class="fr">성인 1인</div>
					</div>
					<div>
						<!-- 여기 :  숫자 단위 쉼표 하는 방법 -->
						<div class="fr"><span><%=topdto.getAdult() %> </span>원</div>
					</div>
				</div>
			</div>
			<div style="clear:both"></div>
		</div>
		
		<div class="banner1">
			<img class="fl" src="https://image.hanatour.com/usr/static/img/pc/com/safe_fair_payment_banner.png" alt="안심결제">
			<img class="fl" src="https://image.hanatour.com/usr/static/img/pc/com/ccm_banner_02.png" alt="소비자경영">
			<div style="clear:both;"></div>
		</div>
		
		<div id="main_content">
			<div id="main_left" class="fl">
				<div id="import_schedule">
					<div>
						<div class="fl">주요일정</div>
						<div class="fr">
							<button type="button" class="fl">항공여정보기</button>
							<button type="button" class="fl">다른 출발일 선택</button>
							<div style="clear:both;"></div>
						</div>
						<div style=clear:both;></div>
					</div>
					<div>
						<dl>
							<dt>일정</dt>
							
							<dd> 
								<%=oneFlightInfo.getPeriod() %>박 <%=(oneFlightInfo.getPeriod()) +1 %>일  <img src=" <%=oneFlightInfo.getLogo() %> " alt="항공사 로고"/> <%=oneFlightInfo.getName() %>
								<br/>출발 : <%=departureInfoDto.getDepartureDate() %> <span class="right_arrow"></span><%=departureInfoDto.getArrivalDate() %> <span class="blue_font"><%=departureInfoDto.getFlightNumber() %></span>총 <%=departureInfoDto.getPeriod() %> 소요
								<br/>도착 : <%=arrivalInfoDto.getDepartureDate() %><span class="right_arrow"></span><%=arrivalInfoDto.getArrivalDate() %> <span class="blue_font"><%=arrivalInfoDto.getFlightNumber() %></span>총 <%=arrivalInfoDto.getPeriod() %> 소요
							</dd>
						</dl>
						<dl> 
							<dt>여행도시</dt>
							<dd> 
								<%=reservationInfo.getTravelCity() %>
							</dd>
						</dl>
						<dl>
							<dt>예약현황</dt>
							<dd> 
								예약 <%=reservationInfo.getReservationCount() %>명
								<br/>좌석 : <%=reservationInfo.getTotalSeat() %>석(최소출발 : 성인<%=reservationInfo.getMinimumNumber() %>명)
							</dd>
						</dl>
					</div>
				</div>
				<div id="package_price" class="grey_border">
					<div>상품가격</div>
					<table>
						<tr class="grey_background">
							<th class="th_td" >구분</th>
							<th class="th_td">
								성인
								<br/><span class="grey_font"  style="font-size: 12px;">만 12세 이상</span>
							</th>
							<th class="th_td">
								아동
								<br/><span class="grey_font" style="font-size: 12px;">만 12세 미만</span>
							</th>
							<th class="th_td">
								유아
								<br/><span class="grey_font" style="font-size: 12px;">만 2세 미만</span>
							</th>
						</tr>
						<tr>
							<th class="th_td">기본상품</th>
							<td class="th_td"><span class="td_price_size"><strong class="comma"><%=packagePrice.getAdult() %></strong></span>원</td>
							<td class="th_td"><span class="td_price_size"><strong class="comma"><%=packagePrice.getChild() %></strong></span>원</td>
							<td class="th_td"><span class="td_price_size"><strong class="comma"><%=packagePrice.getInfant() %></strong></span>원</td>
						</tr>
					</table>
					<div class="grey_font">- 유류할증료 및 제세공과금은 유가와 환율에 따라 변동될 수 있습니다.</div>
					<div class="grey_font">- 1인 객실 사용시 추가요금 발생됩니다. <br/>- 1인 객실 사용료 : 150,000원</div>
					<img src="https://image.hanatour.com/usr/static/img/pc/com/banner_safe_campaign_bar.png" alt="안심결제 캠페인" />
				</div>
				
				<div id="theme" class="grey_border">
					<div>
						<div class="fl">테마소개</div>
						<div class="fr">#관광+자유</div>
						<div class="theme_banner_img">
							<div class="white_font"><strong>관광+자유</strong></div>
							<div class="white_font">‘랜드마크 관광+반일 이상의 자유일정 포함’ 여행!</div>
							<br/>
							<div class="white_font">핵심 관광지와 더불어 자유일정을 여유롭게 즐기는 시간</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
				
				<div id="point" class="grey_border">
					<div class="fl">
						<a href="#main_point_detail_part" class="point_explain">
							<button class="fl main_point_icon"></button>
							<div class="fl">핵심포인트</div>
							<div style="clear:both;"></div>
						</a>
						<a href="#main_attraction_detail_part" class="point_explain">
							<button class="fl attraction_icon"></button>
							<div class="fl">관광</div>
							<div style="clear:both;"></div>
						</a>
						<a href="#main_inn_detail_part" class="point_explain">
							<button class="fl inn_icon"></button>
							<div class="fl">호텔</div>
							<div style="clear:both;"></div>
						</a>
						<a href="#main_insurance_detail_part" class="point_explain">
							<button class="fl insurance_icon "></button>
							<div class="fl">보험</div>
							<div style="clear:both;"></div>
						</a>
						<a href="#main_ect_detail_part" class="point_explain">
							<button class="fl ect_icon"></button>
							<div class="fl">기타</div>
							<div style="clear:both;"></div>
						</a>
					</div>
					<div class="fl">
						<%
							for(PackageInfoDto dto : packageInfo) { 
								if(dto.getContain().equals("핵심포인트")) {
						%>
						<div id="main_point_detail_part" class="point_detail_explain">
							<div><strong><%=dto.getBoldText() %></strong></div>
							<br/>
							<div>
								<% if(dto.getThinText() != null) { %>
									<%=dto.getThinText() %>
								<% } %>	
							</div>
						</div>
						<%
								}
							}
						%>
						<%
							for(PackageInfoDto dto : packageInfo) {
								if(dto.getContain().equals("관광")) {
						%>
						<div id="main_attraction_detail_part" class="point_detail_explain">
							<div class="grey_dot_border"><strong><%=dto.getBoldText() %></strong></div>
							<br/>
							<div>
								<% if(dto.getThinText() != null) { %>
									<%=dto.getThinText() %>
								<% } %>	
							</div>
						</div>
						<%
								}
							}
						%>
						<%
							for(PackageInfoDto dto : packageInfo) {
								if(dto.getContain().equals("호텔")) {
						%>
						<div id="main_inn_detail_part" class="point_detail_explain">
							<div class="grey_dot_border"><strong><%=dto.getBoldText() %></strong></div>
							<br/>
							<div>
								<% if(dto.getThinText() != null) { %>
									<%=dto.getThinText() %>
								<% } %>	
							</div>
						</div>
						<%
								}
							}
						%>
						<%
							for(PackageInfoDto dto : packageInfo) {
								if(dto.getContain().equals("보험")) {
						%>
						<div id="main_insurance_detail_part" class="point_detail_explain">
							<div class="grey_dot_border"><strong><%=dto.getBoldText() %></strong></div>
							<br/>
							<div>
								<% if(dto.getThinText() != null) { %>
									<%=dto.getThinText() %>
								<% } %>	
							</div>
						</div>
						<%
								}
							}	
						%>
						<%
							for(PackageInfoDto dto : packageInfo) {
								if(dto.getContain().equals("기타")) {
						%>
						<div id="main_ect_detail_part" class="point_detail_explain">
							<div class="grey_dot_border"><strong><%=dto.getBoldText() %></strong></div>
							<br/>
							<div>
								<% if(dto.getThinText() != null) { %>
									<%=dto.getThinText() %>
								<% } %>	
							</div>
						</div>
						<%
								}
							}
						%>
					</div>
					<div style="clear:both;"></div>
				</div>
				<div id="banner2">
					<img src="https://image.hanatour.com/usr/manual/update/pc/schedule/1c/010.jpg" alt="banner2">
				</div>
				<div>
					<div>포함/불포함/선택경비 정보</div>
					<div  class="contain_fee_info">
						<div class="fl">
							<div><span class="contain_circle_icon"></span>포함내역</div>
						</div>
						<div class="fl">
							<div >
								<div class="contain_line_height grey_font"><%=packageContainInfo.getContain()%></div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					
					<div  class="contain_fee_info">
						<div class="fl">
							<div><span class="non_contain_icon"></span>불포함내역</div>
						</div>
						<div class="fl">
							<div>
								<div class="contain_line_height grey_font"><%=packageContainInfo.getNonContain() %></div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
					
					<div  class="contain_fee_info">
						<div class="fl">
							<div><span class="choice_fee_icon"></span>선택경비</div>
						</div>
						<div class="fl">
							<div>
								<div class="contain_line_height grey_font"><%=packageContainInfo.getChoicePrice() %></div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
				
				<div id="termsOfUse" class="grey_border">
					<div>
						<div class="fl">상품약관</div>
						<button class="fr" type="button">약관상세보기</button>
						<div style="clear:both;"></div>
					</div>
					<div>
						본 상품의 예약과 취소는 <span class="purple_font"><strong>국외여행 표준약관</strong></span>이 적용됨을 알려드립니다.
						<br/>
						<br/><span><strong>계약금 규정</strong></span>
						<br/><span class="purple_font"><strong>예약일 기준 3일 이내에 1인당 50,000원을 납입하셔야합니다.</strong></span>
						<br/><br/><span><strong>취소료 규정</strong></span>
						<br/>여행 취소시 <span><strong>국외여행표준약관</strong></span> 제 16조 소비자분쟁해결규정에 따라 아래의 비율로 취소료가 부과됩니다. (단, 당사의 귀책사유로 여행출발 취소 경우에도 동일한 규정이 적용됩니다.
					</div>
					<button type="button">더보기<span class="grey_down_img"></span></button>
				</div>
				<div id="reservation_notice" class="grey_border">
					<div class="purple_font">예약시 유의사항</div>
					<% 
						for (PackageReservationNoticeDto dto : packageReservationNotice) { 
					%>
						<div class="reservation_notice_bottom">
							<strong><%=dto.getBoldText() %></strong>
							<%=dto.getThinText() %>
						</div>
					<%
						}
					%>
				</div>
				
				<div id="guide_meeting">
					<div>가이드/인솔자 및 미팅정보</div>
					<div class="guide_leader">
						<div class="fl"><strong>가이드</strong></div>
						<div class="fl">
						<%
							if(packageMeetingInfo.getGuide().equals("T")) {
						%>
								가이드와 미팅이 이루어집니다.
						<%
							} else {
						%>
								가이드가 동행하지 않습니다.
						<%
							}
						%>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="guide_leader">
						<div class="fl"><strong>인솔자</strong></div>
						<div class="fl">
						<%
							if(packageMeetingInfo.getLeader().equals("T")) {
						%>
								인솔자와 미팅이 이루어집니다.
						<%
							} else {
						%>
								인솔자가 동행하지 않습니다.
						<%
							}
						%>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div id="guide_meeting_box" class="purple_border">
						<div>
							<div class="fl"><span class="place_dot"></span>미팅정보</div>
							<button class="fr" type="button">미팅장소 보기</button>
							<div style="clear:both;"></div>
						</div>
						<div>
							<div>일시 : <strong><%=packageMeetingInfo.getInfoDate() %></strong></div>
							<div>장소 : <strong><%=packageMeetingInfo.getLocation() %></strong></div>
						</div>
						<div>
							<div class="purple_font"><%=packageMeetingInfo.getPurpleInfo() %></div>
							<br/>
							<div class="grey_font"><%=packageMeetingInfo.getThinInfo() %></div>
						</div>
					</div>
				</div>
				
				<div id="long_content">
					<div></div>
					<div id="long_content_header">
						<div id="travel_trip" class="fl">일정여행</div>
						<div id="hotel_attraction" class="fl">호텔&관광지</div>
						<div id="optional_tour" class="fl">선택관광</div>
						<div id="three_note" class="fl">참고사항</div>
						<div id="aboard_safety" class="fl">해외안전정보</div>
						<div id="travel_review" class="fl">여행후기</div>
						<div style="clear:both;  width : 0; height : 0;"></div>
					</div>
				
					<div id="travel_trip_detail"> <!-- 여행일정 -->
						<div>
							<div class="fl">1일차</div>
							<div class="fl">2일차</div>
							<div class="fl">3일차</div>
							<div class="fl">4일차</div>
							<button class="fr">일정 전체 펼침</button>
							<div style="clear:both;"></div>
						</div>
						<div>
							<div class="purple_font"><span class="purple_i_img"></span>여행일정 변경에 관한 사전 동의안내</div>
							<br/>
							<div class="grey_font">여행일정은 계약체결 시 예상하지 못한 부득이한 사정 등이 발생하는 경우 여행자의 사전동의를 거쳐 변경될 수 있음을 양지하시기 바랍니다.</div>
						</div>
						<% 
							for(ScheduleTitleDto title : scheduleTitle) { 
								
						%>
							<div class="day_schedule">	<!-- 1일차 -->
								
								<div>
									<div class="fl white_font" >
										<div><%=title.getDay()%>일차</div>
										<%
											for(int i=0; i<=listDateString.size()-1; i++) { 
												if(title.getDay()==(i+1)) {	
										%>
													<div><%=listDateString.get(i) %></div> <!-- 문제!! 일자 증가 못함 -->
										<%  	
												}
											}
										%>
									</div>
									<div class="fl">
									 	<div><strong><%=title.getTitle() %></strong></div>
									 	<div><%=title.getSubtitle() %></div>
									 	<div class="fr grey_down_img"></div>
									 	<div style="clear:both;"></div>
									</div>
									<div style="clear:both;"></div>
								</div>
								<% for( ScheduleOrderDto order : scheduleOrder) {%>
									<div> <!-- 접히는 부분 -->
										<% // 유형1
											for(Type1FlightDto dto : type1Flight) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==1 && order.getPlanType1Idx()==dto.getPlanType1Idx()) { 
										%>
										 	<div class="schedule_flight"> <!--유형1(항공)-->
										 		<div>
											 		<div>
											 			<img src="<%=dto.getLogo() %>" alt="항공사 로고"/>
											 			<strong><%=dto.getName() %></strong>
											 		</div>
											 		<div class="grey_font"><%=dto.getPeriod() %> <span class="blue_font"><%=dto.getFlightNumber() %></span></div>
											 		<div>
											 			<div class="fl purple_circle_div"></div>
											 			<div class="fr purple_circle_div"></div>
											 			<div style="clear:both;"></div>
											 		</div>
										 		</div>
										 		<div>
										 			<div>
										 				<div class="fl"><strong><%=dto.getDepartureTime() %></strong></div>
										 				<div class="fr"><strong><%=dto.getArrivalTime() %></strong></div>
										 				<div style="clear:both;"></div>
										 			</div>
										 			<div>
										 				<div class="fl grey_font"><%=dto.getDepartureDate() %>)</div>
										 				<div class="fr grey_font"><%=dto.getArrivalDate() %></div>
										 				<div style="clear:both;"></div>
										 			</div>
										 			<div>
										 				<div class="fl grey_font"><%=dto.getDeparture() %> 출발</div>
										 				<div class="fr grey_font"><%=dto.getArrival() %> 도착</div>
										 				<div style="clear:both;"></div>
										 			</div>
										 		</div>
										 	</div>
									 	<%  
									 			}
											}
									 	%>
									 	<div class="grey_left"> <!-- 옆에 회색 줄 생기는 부분 -->
									 	<% //유형2
											for(Type2CityDto dto :type2City) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==2 && order.getPlanType2Idx()==dto.getPlanType2Idx() && title.getDay()==dto.getDay()) { 
										%>
										 	<div class="region"> <!--유형2(도시)-->
										 			<div><strong><%=dto.getCityName() %></strong></div>
										 			<% if(dto.getThinText()!=null) { %>
										 				<div class="grey_font"><%=dto.getThinText() %></div>
										 			<%  } %>
										 			<div class="region_white_dot"><span class="purple_dot_img"></span></div>
										 	</div>
									 	<%  
									 			}
											}
									 	%>
									 	
									 	<% //유형3
											for(Type3ThinTextDto dto: type3ThinText) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==3 && order.getPlanType3Idx()==dto.getPlanType3Idx() && title.getDay() == dto.getDay()) { 
										%>
									 		<div class="thin_text" > <!-- 얇은 글씨 -->
									 			<div><%=dto.getThin_text() %></div>
									 			<div class="thin_text_dot"></div>
									 		</div>
									 	<%  
									 			}
											}
									 	%>	
									 	
									 	<% //유형4
											for(Type4BoldTextDto dto : type4BoldText) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==4 && order.getPlanType4Idx()==dto.getPlanType4Idx() && title.getDay() == dto.getDay()) { 
										%>
									 		<div class="bold_text"> <!-- 굵은 글씨 -->
									 			<div><strong><%=dto.getBoldText() %></strong></div>
									 			<% if(dto.getThinText() != null ) { %>
									 				<div><%=dto.getThinText() %></div>
									 			<% } %>
									 			<div class="bold_text_dot"></div>
									 		</div>
									 	<%  
									 			}
											}
									 	%>	
									 	<%  //유형5 질문 문제가 많음. 다양한 상자도 안나오고. null이 아닌 경우만 출력했는데 들어먹지를 않음! 여러개인 창에서 사진도 4개나 나옴!
									 	
											for(Type5AttractionDto dto: type5Attraction) {     
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==5 && order.getPlanType5Idx()==dto.getPlanType5Idx() && title.getDay() == dto.getDay()) { 
																											
										%>
										 <!-- 관광지 여러개 상자 -->
								 			<% if(dto.getTitle() != null) {			// YGYGYGYG 
								 			%>
								 			<div class="many_attraction_box"> <!-- 여러줄이 안나와요 어쩌지 어쩌지 -->
								 				<div><strong><%=dto.getTitle() %></strong></div>
								 				<% 
								 					for(Integer many: type5AttractionMany) { 
														if (many == dto.getPlanType5Idx()) {											 				
								 				%> 
								 				<div>
									 				<div class="many_in_attraction dotted_border">
									 					<div>
										 					<div class="fl"><strong><%=dto.getAttractionKor() %></strong></div>
										 					<div class="fr purple_font">상세보기</div>
										 					<div style="clear:both;"></div>
										 				</div>
									 					<div class="grey_font"><%=dto.getEx() %></div>
									 					<% if(dto.getAttractionEng() != null) { %>
									 						<div class="grey_font"><%=dto.getAttractionEng() %></div>
									 					<% } %>
									 					<div>
									 						<% 
											 					for(Type5AttractionImgDto img : type5AttractionImg) {
											 						if(img.getAttractionIdx()==dto.getAttractionIdx()) {	
											 				%>
									 							<img class="fl" src="<%=img.getImgUrl() %>" alt="사진1 "/>
									 						<%
									 							}
											 						}
											 				%>
									 						<div style="clear:both;"></div>
									 					</div>
									 					<div><%=dto.getDetailedEx() %></div>
										 			</div>
									 			</div>
									 			<% 
									 					} 
									 				}
									 			%>
							 				</div>
								 			<% } else { %> <!-- 관광지 1개 -->
								 				<div class="one_attraction_box"> 
									 			<div><strong><%=dto.getAttractionKor() %></strong></div>
									 			<% if(dto.getAttractionEng() != null ) { %>
							 						<div class="grey_font"><%=dto.getAttractionEng() %></div>
							 					<% } %>
									 			<div class="grey_font"><%=dto.getEx() %></div>
									 			<div>
									 				<% 
									 					for(Type5AttractionImgDto img : type5AttractionImg) {
									 						if(img.getPlanType5Idx()==dto.getPlanType5Idx()) {	
									 				%>
							 							<img class="fl" src="<%=img.getImgUrl() %>" alt="사진1 "/>
							 						<%
							 							}
									 						}
									 				%>
									 			</div>
									 			<div><%=dto.getDetailedEx() %></div>
									 		</div>
											<% } %>
										<%  
									 			}
											}
									 	%>	
									 	
									 	<%  // 유형6 (음식)
											for(Type6FoodDto dto :type6Food) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==6 && order.getPlanType6Idx()==dto.getPlanType6Idx() && title.getDay() == dto.getDay()) { 
										%>
											<div class="food_box"> <!-- 음식 상자 -->
												<div>
													<div class="fl"><strong><%=dto.getKorName() %></strong></div>
													<div class="fr purple_font">상세보기</div>
													<div style="clear:both;"></div>
												</div>
												<% if(dto.getEngName() != null) { %>
													<div class="grey_font"><%=dto.getEngName() %></div>
												<% } else {%>
													<div></div>
												<% } %>
												<div class="grey_font"><%=dto.getEx() %></div>
												<div>
													<% 
														for(Type6FoodImgDto img : type6FoodImg) { 
															if(img.getPlanType6Idx() == dto.getPlanType6Idx()) {
													%>
														<img src="<%=img.getImgUrl() %>" alt="사진1"/>
													<%
															}
														}
													%>
												</div>
												<div><%=dto.getDetailedEx() %></div>
												<div><div class="food_box_dot"></div></div>
											</div>	
								 		<%  
								 			}
										}
									 	%>	
									 	
									 	<%  // 유형8 (유의사항 정보)
											for(Type8NoticeDto dto :type8Notice) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==8 && order.getPlanType8Idx()==dto.getPlanType8Idx() && title.getDay() == dto.getDay()) { 
										%>
												<div class="flight_info_box"> <!-- 유의사항 정보 -->
										 			<div>
									 					<div class="fl"><strong><%=dto.getTitle() %></strong></div>
									 					<div class="fr purple_font">상세보기</div>
									 					<div style="clear:both;"></div>
									 				</div>
									 				<%if(dto.getBoldText() != null) { %>
														<div><strong><%=dto.getBoldText() %></strong></div>
													<% } %>	
									 				<div>
									 					<%
									 						for(Type8NoticeImgDto img : type8NoticeImg) { 
									 							if(dto.getPlanType8Idx()==img.getPlanType8Idx()) {
									 					%>
									 					<img class="fl" src="<%=img.getImgUrl() %>" alt="항공사진1"/>
									 					<%
									 							}
									 						}
									 					%>
									 					<div style="clear:both;"></div>
									 				</div>
									 				<div class="grey_font"><%=dto.getThinText() %></div>
									 				<div><div class="flight_info_box_dot"></div></div>
										 		</div>
										<%  
								 			}
										}
									 	%>	
									 	
									 	<%  // 유형9 (하단 호텔정보) // 문제 원하는 형식으로 나오지 않음
											
											if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==9 ) { 
										%>
											<div class = "inn_icon_info"> <!-- 호텔 아이콘 상자 -->
												<div class="fl">
													<div><span class="hotel_icon"></span><strong>호텔</strong></div>
												</div>
												<div class="fl">
													<div><strong>총 <span class="purple_font">1개</span>의 <span class="purple_font">예정호텔</span>이 있습니다.</strong>출발 3일 전까지 확정되어 일정표에서 확인하실 수 있습니다.</div>
													<div class="grey_font">1일전 카카오 알림톡으로도 알려드립니다.</div>
													<% 
														for(Type9InnDto dto :type9Inn) {
															if(order.getPlanType9Idx()==dto.getPlanType9Idx() && title.getDay() == dto.getDay()) {
													%>
													<div class="inn_candidate">
														<div class="fl">예정</div>
														<div class="fl">
															<div><strong><%=dto.getInnKor() %></strong> <span class="yellow_star"></span></div>
															<% if(dto.getInnEng() != null) { %>
																<div><%=dto.getInnEng() %> <span>상세보기</span></div>
															<% } %>
														</div>
														<div style="clear:both;"></div>
													</div>
													<%
															}
														}
													%>
													
													<div style="clear:both;"></div>
												</div>
												<div style="clear:both;"></div>
											</div>
										<%  
								 		
										}
									 	%>	
									 	
									 	<%  // 유형10 (전체 식사 정보)
											for(Type10MealDto dto :type10Meal) {
												if(order.getTravelPlanIdx()==title.getTravelPlanIdx() && order.getPlanType()==10 && order.getPlanType10Idx()==dto.getPlanType10Idx() && title.getDay() == dto.getDay()) { 
										%>
											<div class="meal"> <!-- 식사 아이콘 줄 -->
												<div class="fl"><span class="fork_icon"></span><strong>식사</strong></div>
												<div class="fl">
													<div><%=dto.getTotalMeal() %></div>
												</div>
												<div style="clear:both;"></div>
											</div>
										<%  
								 			}
										}
									 	%>
									 	
									 	
									 	
							
									 	</div> <!-- 왼쪽 회색줄 끝나는 부분 -->
									</div> <!-- 접히는 부분 종료 -->
								<% } %>
							</div> <!-- 1일차 종료 -->
						<% } %>
						
					</div> <!-- 여행일정 종료 -->
					
					
					<div id="hotel_attraction_detail"> <!-- 호텔&관광지 시작 -->
						<div>
							<div id="hotel_detail" class="fl">호텔정보</div>
							<div id="attraction_detail"class="fl">관광지정보</div>
							<div style="clear:both;"></div>
						</div>
						<div id="hotel_detail_info">
							<div>
								<div class="purple_font"><span class="purple_i_img"></span>예약 시 유의사항</div>
								<div class="grey_font">- 현재 국제적으로 통용되는 호텔 등급의 표기 기준은 없으며 일부 국가에서는 자국의 기준에 따라 등급표기를 하는 경우가 있습니다. </div>
								<div class="grey_font">- 당사 일정표 및 호텔정보에 표기되는 호텔의 등급표기는 현지 호텔측으로부터 받은 등급 기준을 반영하여 정한 것으로 국제적으로 통용되는 등급은 아니며, 고객님의 선택의 편의를 도모하기 위함임을 양해바랍니다. </div>
								<div class="grey_font">- 본 정보는 호텔에 대한 전반적인 안내를 위한 것이며, 실제로 사용하시는 시설과는 이미지가 다를 수 있습니다. </div>
							</div>
							<div>
								<%
									for(TabSmallHotelBoxDto dto : tabSmallHotelBox) {
								%>
									<div class="hotel_check_box fl"> <!-- 호텔 이름 -->
										<div>
											<div class="fl">예정</div>
											<div class="fl"><%=dto.getLocation() %></div>
											<div style="clear:both;"></div>
										</div>
										<div><%=dto.getInnKor() %></div>
									</div>
								<%
									}
								%>
								<div style="clear:both;"></div>
							</div>
							<%
								for (TabHotelInfoDto dto : tabHotelInfoDto) {
							%>
								<div class="hotel_total_info">
									<div class="hotel_check_box_detail"> <!-- 호텔정보 -->
										<div>
											<div class="fl"><img src="<%=dto.getImgUrl() %>" alt="호텔사진" /></div>
											<div class="fl">
												<div><strong><%=dto.getInnKor() %></strong></div>
												<% if(dto.getInnEng()!=null) { %>
													<div class="grey_font"><%=dto.getInnEng() %></div>
												<% } %>
											</div>
											<div style="clear:both;"></div>
										</div>
										<div class="hotel_table">
											<div>기본정보</div>
											<table>
												<tr>
													<th >도시</th>
													<% if(dto.getLocation()!= null) { %>
														<td><%=dto.getLocation() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
													<th>주소</th>
													<% if(dto.getAddress()!=null) { %>	
														<td><%=dto.getAddress() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
												</tr>
												<tr>
													<th>연락처</th>
													<% if(dto.getPhone()!=null) { %>
														<td><%=dto.getPhone() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
													<th>홈페이지</th>
													<% if(dto.getHomepageUrl()!=null) { %>
														<td><%=dto.getHomepageUrl() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
												</tr>
												<tr>
													<th>층수 / 객실수</th>
													<% if(dto.getFloors()!= null && dto.getRoomNum()!=null) { %>
														<td><%=dto.getFloors() %> 층 / <%=dto.getRoomNum() %> 객실</td>
													<% } else { %>
														<td>-층 / -객실</td>
													<% } %>
													<th>체크인/체크아웃</th>
													<% if(dto.getCheckInCheckOut()!=null) { %>
														<td><%=dto.getCheckInCheckOut() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
												</tr>
												<tr>
													<th>위치</th>
													<% if(dto.getFamousSpot()!=null) { %>
														<td colspan="3"><%=dto.getFamousSpot() %></td>
													<% } else { %>
														<td>-</td>
													<% } %>
												</tr>
											</table>
											<div>부대시설</div>
											<table class="hotel_table">
												<tr>
													<th>부대시설</th>
													<td>
														<% 
															for(HotelAmenityDto amenity : hotelAmenity) { 
																if(amenity.getInnKor().equals(dto.getInnKor())) {
														%>
																	- <%=amenity.getTitleName() %><br/>
														<%
																}
															}
														%>
													</td>
													<th>객실시설</th>
													<td>
														<%
															for(HotelFacilityDto facility : hotelFacility) { 
																if(facility.getInnKor().equals(dto.getInnKor())) {
														%>
																	-<%=facility.getTitleName() %> <br/>
														<%
															} else if(facility.getTitleName() == null) {
														%>	
														<% 			
																}
															}
														%>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							<%
								}
							%>
						</div>
						
						<div id="attraction_detail_info">
							<%
								for(int i=1; i<=(oneFlightInfo.getPeriod()+1); i++) {
							%>
							<div><strong><%=i %>일차</strong> <span class="grey_font"></span></div> <!-- 일자 못넣은 자리 -->
							
							<!-- ★질문 일차에 맞는 관광지 정보넣어주는 것과 일차기 증가하는데 문자열로 받아서 연산자 사용의 불가능. 하지만 요일까지 나와야 하는데 어쩔까요? -->
								<%
								for (HotelAttractionAttractionDto dto : hotelAttractionAttraction) {
									if(dto.getDay() == i) {
								%>
								<div class="attraction_days">
									<img class="fl" src="<%=dto.getImgUrl() %>" alt="풍경사진"/>
									<div class="fl">
										<div><strong><%=dto.getAttractionKor() %></strong></div>
										<div><%=dto.getDetailedEx() %> </div>
									</div>
									<div style="clear:both;"></div>
								</div>
							<%
										}
									}
								}
							%>
						</div>
						
					</div> <!-- 호텔&관광지 종료 -->
					
					<div id="optional_tour_detail"> <!-- 선택관광 -->
						<div>
							<div class="purple_font"><span class="purple_i_img"></span>예약 시 유의사항</div>
							<div class="purple_font">- 또 하나의 즐거움 선택관광! 합리적인 가격으로 새로워졌습니다.</div>
							<div class="purple_font">- 선택관광은 상품 가격에 불포함입니다.</div>
							<div class="grey_font">- 선택관광에 참여하지 않아도 추가적 비용 또는 일정상 불이익은 없습니다.</div>
							<div class="grey_font">- 스페셜 포함은 상품 가격에 포함된 관광입니다.</div>
							<div class="grey_font">- 출발 전 선택관광 신청, 결제 시 환율에 따라 결제 금액이 변동될 수 있습니다.</div>
							<div class="grey_font">- 현지 사정으로 진행이 어려울 수 있으니 예약하신 여행사 및 상담원과 확인 후 결제 부탁드립니다.</div>
							<div class="grey_font">- 일자별 선택 가능하며 여행 출발 7일 전까지 사전 신청 가능합니다.</div>
							<div class="grey_font">- 출발일 기준 7일 미만 시점의 사전 신청은 현지에서 진행이 미확정입니다.</div>
						</div>
						
						<!-- 여기 -->
						<% for(OptionalTourDto title : optionalTourTitle) { %>
						<div class="optional_tour_city">
							<div>
								<div class=" fl place_dot"></div>
								<div class="fl"><%=title.getCountryName() %></div>
								<div class=" fl optional_tour_city_dot"></div>
								<div class="fl"><%=title.getCityName() %></div>
								<div style="clear:both;"></div>
							</div>
							<% for(OptionalTourDto content : optionalTourContent) { 
									if(content.getCityName().equals(title.getCityName())) { 
							%>
							<div class="optional_tour_explain">
								<div>
									<div class="fl"><%=content.getTourName() %></div>
									<div class="fr grey_down_img"></div>
									<div style="clear:both;"></div>
								</div>
								<div>
									<div class="fl">
										<img src="<%=content.getImgUrl() %>" alt="풍경사진"/>
									</div>
									<div class="fl">
										<div><%=content.getEx() %></div>
										<div>
											<div class="fl grey_font">이용요금 <span class="purple_font"><%=content.getFee() %></span></div>
											<div class="fl grey_font">소요시간 <span class="purple_font"><%=content.getPeriod() %></span></div>
											<div style="clear:both;"></div>
										</div>
										<div>
											<div class="grey_font">대체일정 <span class="purple_font"><%=content.getAlternativeSchedule() %></span></div>
										</div>
										<div>
											<div class="grey_font">미선택시 가이드동행  <span class="purple_font"><%=content.getNonSelectedGuide() %></span></div>
										</div>
									</div>
									<div style="clear:both;"></div>
								</div>
							</div>
							<% 		} 
								}%>
						</div>
						<% } %>
					</div> <!-- 선택관광 종료 -->
					
					<div id="three_note_detail">
						<div>
							<div id="notice" class="fl">유의사항</div>
							<div id="payment_benefit" class="fl">결제/혜택/보험</div>
							<div id="emergency_contact" class="fl">비상연락방법</div>
							<div style="clear:both; width:0; height:0;"></div>
						</div>
						
						<div id="notice_detail">
							<div>
								<div><strong>여권/비자</strong></div>
								<div class="grey_font">- 여권에 낙서 또는 메모를 하거나 기념도장을 찍은 경우, 페이지를 임의로 뜯어내는 경우, 신원정보면에 얼룩이 묻은 경우, 여권 표지가 손상된 경우, 여권 잔여 유효기간 부족, 여권 사증란 부족한 경우 출입국 및 항공권 발권 등에 제한이 있을 수 있으므로 출발 전에 반드시 여권을 확인하여 주시기 바랍니다.</div>
								<div class="grey_font">- 서명이 없는 여권은 위조여권으로 의심받는 경우가 있으므로, 여권 소지인의 서명란에 반드시 서명하시기 바랍니다.</div>
								<div class="grey_font">- 서명란에 이름 외에 다른 글자나 기호(하트모양, 별모양 등 특수기호 포함)를 적지 않도록 유의하시기 바랍니다. 영유아의 경우 보호자가 아이의 이름으로 대신 서명(정자 기입)하시면 됩니다.</div>
							</div>
							<div>
								<div><strong>외국/이중국적 주의사항</strong></div>
								<div>외국/이중국적자의 해외여행은 도착지국가(경유국가 포함)의 출입국정책이 상이하므로, 반드시 여행자본인이 해당국의 대사관에 확인하셔야 합니다.</div>
							</div>
							<div>
								<div><strong>항공사 관련 서비스</strong></div>
								<div>항공사 마일리지적립 가능/불가능 여부는 해당 항공의 룰에 따라 달라지므로 예약하신 상품의 항공사로 확인하여 주시기 바랍니다.</div>
							</div>
							<div>
								<div><strong>공항이용</strong></div>
								<div class="purple_font">- 항공기 좌석 배정은 항공사의 고유권한으로 공항에서 선착순 배정됨에 따라 일행과 좌석이 분리될 수도 있으며, 대리수속은 불가합니다.</div>
								<div class="grey_font">- 항공기 이용시 용기당 100ml 초과 액체류 (화장품, 치약류, 젤 등) 물품 기내 반입 제한됩니다. (단, 탁송수하물은 제한 없음)</div>
								<div class="grey_font">- 수하물 탁송 시 각 항공사 규정에 따라 보상불가한 경우가 있으므로, 귀중품은 반드시 휴대하셔야 합니다.</div>
							</div>
							<div>
								<div><strong>동/축산물 검역안내</strong></div>
								<div class="grey_font">- 대부분의 축산물(소세지, 육포 등) 및 생과실·열매채소 등은 휴대반입할 수 없으며, 휴대반입이 가능한 축산물과 식물류도 신고 및 검역을 받아야하며, 불법 반입시 최고 1,000만원의 과태료가 부과됩니다.</div>
								<div class="grey_font">- 해외 축산농장, 가축시장을 방문한 여행객과 가축전염병 발생 국가를 방문한 축산관계자는 농림축산검역본부에 신고하여 소독을 받아야 합니다.</div>
								<div class="grey_font">- 축산업종사자는 가축전염병 발생국가로 출/입국시 신고를 해야 합니다.</div>
							</div>
							<div>
								<div><strong>안전사고</strong></div>
								<div>여행일정 중 발생할 수 있는 모든 안전사고에 유의하시기 바라며, 가이드의 안내사항 및 안전수칙 준수하기 바라며,여행자 본인의 과실로 인한 안전사고는 본인이 책임을 지게 됩니다.</div>
							</div>
						</div>
						
						<div id="payment_benefit_detail">
							<div><strong>결제 안내</strong></div>
							<div>
								<div><strong>- 결제 방법 </strong></div>
								<div class="grey_font">하나투어 법인계좌(가상계좌 포함)로의 송금, 신용카드의 경우 하나투어본사의 ARS(1577-0015) 또는 하나투어 홈페이지에서 온라인결제</div>
								<div><strong>- 결제 확인</strong></div>
								<div>하나투어 홈페이지 내 "예약확인/결제" 하나투어 공식결제 방법을 이용하셔야 법적권리 및 소비자 권익을 보호 받으실 수 있으며, 현금영수증 발급은 여행용역 제공 후 발급해드리고 있습니다. www.hanatour.com 홈페이지 접수</div>
							</div>
							<div><strong>추가혜택</strong></div>
							<div>
								<div><strong>- 하나투어 카드</strong></div>
								<div>
									<img class="fl" src="https://image.hanatour.com/usr/manual/event/2024/EV1000000443/img/card_03.png" alt="카드1"/>
									<div class="fl">
										<div><strong>하나투어 삼성카드</strong></div>
										<div class="grey_font">하나투어 12/24개월 라이트할부</div>
										<div class="grey_font">라이트할부 이용 시 7,000~14,000원 결제대금 차감</div>
										<div class="grey_font">생활요금 정기결제 5%/10% 할인</div>
										<div class="grey_font">일상 필수 영역 5%/10% 할인</div>
										<div class="grey_font">공항 라운지 서비스(The Lounge)</div>
										<div class="grey_font">해외 1.5% 할인</div>
										<div class="grey_font">국제브랜드 서비스(해외겸용카드 전용)</div>
									</div>
									<div style="clear:both;"></div>
								</div>
								<div>
									<img class="fl" src="https://image.hanatour.com/usr/static/img/pc/pmt/img_card.png" alt="카드사진1"/>
									<div class="fl">
										<div><strong>하나투어 KB국민카드</strong></div>
										<div class="grey_font">하나투어 마일리지 : 신용 구매금액의 기본 1%에서 최대 3% 적립 (단, 무이자 할부 이용 시 미적립)</div>
										<div class="grey_font">하나투어 특별우대 : 하나투어 여행상품 구매 시, 포인트 연계 할부 서비스 제공 (최대 50만 원까지!)</div>
										<div class="grey_font">무이자 할부 혜택 : 하나투어 / 국내 면세점 이용 시, 2~3개월 무이자 할부 (5만 원 이상 사용 조건)</div>
									</div>
									<div style="clear:both;"></div>
								</div>
							</div>
							<div><strong>보험</strong></div>
							<div>
								<div><strong>- 여행자 보험</strong></div>
								<img src="https://image.hanatour.com/usr/static/img/pc/pkg/insure_info_1_410_120510.gif" alt="여행자보험 사진" />
								<div class="grey_font"><strong>보험기간: 여행기간</strong></div>
								<div class="grey_font">- 보장기간: 여행종료일~180일(여행종료 후 30일 이내 치료를 시작한 상해,질병 한정) / 보험청구 기간: 사고일 ~ 3년</div>
								<div class="grey_font">- 15세 미만자, 심신상실자, 심신박약자의 사망을 보험사고로 하는 보험 계약은 무효이며, 15세 미만과 79세 이상, 임산부는 보상불가한 부분이 있으므로 개별 보험 가입을 권장합니다.</div>
								<div class="grey_font">- 여행자보험은 실손실 보상 보험으로 보상한도 안에서 심사 지급 되며 타보험사와 중복 가입시 비례보상됩니다.</div>
								<div class="grey_font">- 국내치료비 접수시 본인부담금 공제 후 지급됩니다.(입원시 급여 20% / 비급여 30%, 통원시 급여 1~2만원과 20%중 큰금액 / 비급여 3만원과 30%중 큰 금액)</div>
								<div class="grey_font">- 통원 1회당 보장금액은 외래 및 처방조제 합산액을 한도내 보상합니다. (비급여시 년간 100회 한도)</div>
								<div class="grey_font">- 국내 비급여치료 시 상급병실 치료차액은 1일 평균 10만원 한도 내에서 지급됩니다. (비급여 병실료의 50%)</div>
								<div class="grey_font">- 교통사고 등 국민건강보험공단의 적용을 받지 못하는 경우 치료비의 40% 이내에서 보상됩니다.</div>
								<div class="grey_font">- 상해 사고로 인한 장애 판정은 사고일로부터 6개월 이후 대학병원급의 의료기관에서 후유장애를 진단 받으시길 바랍니다.</div>
								<div class="grey_font">- 진료와 무관한 제비용(제증명료,의료보조기구 구입비)이나 국내 통원 치료시 치과치료(보철/임플란트 등), 한방치료, 미용치료에서 발생한 비급여 의료비는 보상되지 않습니다.</div>
								<div class="grey_font">- 본인 부주의에 의한 휴대품 분실/파손,현금/유가증권,시력교정용 안경 등의 도난 사고 및 기존병력으로 인해 여행 기간 중 발생되는 사고에 대해서는 보상되지 않습니다.</div>
								<div class="grey_font">- 휴대품 파손 보험 신청시 수리확인서와 파손상태의 증빙사진을 제출해야 합니다. </div>
								<div class="grey_font">- 항공사의 과실로 인한 수하물 파손/분실은 즉시 공항에서 항공사에 신고하여 항공사 선(先)배상 후 여행자보험 필요시 청구하시기 바랍니다.</div>
								<div class="grey_font">- 개별여행 중 도난사고 발생시 경찰신고 후 폴리스 레포트가 있어야 보험접수가 가능합니다.</div>
								<div class="grey_font">- 위 사항은 약관 내용을 요약 발췌한 것으로 세부 내용은 반드시 약관을 참조하시기 바랍니다.</div>
							</div>
							<div>
								<div><strong>영업보증보험</strong></div>
								<div class="grey_font">하나투어는 영업보증보험 22억 1천만원에 가입되어 있습니다.</div>
								<div class="grey_font">※ 문의 - DB손해보험 고객센터 : 1899-4040 (www.idbins.com) </div>
							</div>
						</div>
						
						<div id="emergency_contact_detail">
							<div>
								<div>※첫 만남시 긴급 상황 발생한 경우 하나투어 인천 공항사무소☎ 032-743-7500 , 김해(부산) 공항사무소 ☎051-791-2821로 연락 주시기 바랍니다.</div> 
								<div>※상품관련 긴급 상황 발생시 예약하신 여행사 또는 하나투어 고객센터 ☎1577-1233 [평일:09:00~18:00]로 문의 바랍니다.</div> 
							</div>
							<div>
								<div><strong>현지 긴급연락처</strong></div>
							</div>
							<div>
								<div><strong>여행불편 상담</strong></div>
								<div class="grey">고객센터 1577-1233</div>
								<div class="grey">한국여행업협회 여행불편처리센터 1588-8692</div>
								<div class="grey">372소비자상담센터 (국번없이)1372</div>
							</div>
						</div>
						
					</div>
					
					<div id="aboard_safety_detail">
						<div class="grey_font">여행 금지국 현황</div>
						<div>
							<div><strong>여행금지국</strong></div>
							<div class="grey_font">
								소말리아 (2007.8.7.~2024.7.31.)
								<br/>
								이라크 (2007.8.7.~2024.7.31.)
								<br/>
								아프가니스탄 (2007.8.7.~2024.7.31.)
								<br/>
								예멘 (2011.6.28.~2024.7.31.)
								<br/>
								수단 (전 지역(2023.4.29.~2024.7.31.))
								<br/>
								아이티 (전 지역(2024.5.1.~2024.7.31.))
								<br/>
								우크라이나 (전 지역(2022.2.13.~2024.7.31.))
								<br/>
								리비아 (2014.8.4.~2024.7.31.)
								<br/>
								시리아 (2011.8.20.~2024.7.31.)
								<br/>
								아제르바이잔 일부지역: 아르메니아 접경 5km 구간(2023.4.15.~2024.7.31.)
								<br/>
								미얀마 일부지역: 샨州 북부, 샨州 동부, 까야州, 라카인주(2024.5.1.~2024.7.31.)
								<br/>
								필리핀 일부지역: 민다나오의 잠보앙가, 술루‧바실란‧타위타위 군도(2015.12.1.~2024.7.31.)
								<br/>
								러시아 일부지역: 러시아 로스토프·벨고로드·보로네시·쿠르스크·브랸스크 지역 내 우크라이나 국경에서 30km(2022.3.8.~2024.7.31.)
								<br/>
								벨라루스 일부지역: 벨라루스 브레스트·고멜 지역 내 우크라이나 국경에서 30km(2022.3.8.~2024.7.31.)
								<br/>
								아르메니아 일부지역: 아제르바이잔 접경 30km 구간(2023.4.15.~2024.7.31.)
								<br/>
								이스라엘 일부지역: 가자지구(2023.8.1.~2024.7.31.)
								<br/>
								팔레스타인 일부지역: 가자지구(2023.8.1.~2024.7.31.)
								<br/>
								라오스 일부지역: 골든트라이앵글 경제특구(2024.2.1.~2024.7.31.)
							</div>
						</div>
						<div>
							<div><strong>여행 금지국 방문 시</strong></div>
							<div>여권법 제 26조</div>
							<div class="grey_font">방문 및 체류가 금지된 국가나 지역으로 고시된 사정을 알면서도 같은 조 제1항 단서에 따른 허가(제14조 제3항에 따라 준용되는 경우를 포함한다)를 받지 아니하고 해당국각나 지역에서 여권 등을 사용하거나 해당국가나 지역을 방문하거나 체류한 사람은 1년 이하의 징역 또는 1000만원 이하의 벌금에 처한다.</div>
						</div>
						<div>
							<div><strong>여행경보단계</strong></div>
							<div class="grey_font">외교부에서 운영하는 여행경보단계는 여행유의 / 여행자제 / 철수권고 / 여행금지 4단계로 구분되며 외교부 '해외안전여행' 사이트(www.0404.go.kr)에서 상세정보를 확인할 수 있습니다. </div>
						</div>
						<div>
							<%
								for(SafetyInfoDto dto : safetyInfo) {
							%>
							<div><strong><%=dto.getCountryName() %></strong></div>
							<table id="safety_table">
								<tr>
									<th><span class="indigo_background-color white_font">남색경보</span>여행유의 일부</th>
									<% if (dto.getTravelNotice()!=null) { %>
										<td><%=dto.getTravelNotice() %></td>
									<% } else {%>
										<td> - </td>
									<% } %>
								</tr>
								<tr>
									<th><span class="yellow_background-color white_font">황색경보</span>여행자제</th>
									<% if (dto.getTravelCaution()!=null) { %>
										<td><%=dto.getTravelCaution() %></td>
									<% } else {%>
										<td> - </td>
									<% } %>	
								</tr>
								<tr>
									<th><span class="red_background-color white_font">적색경보</span>철수권고(일부)</th>
									<% if (dto.getRecommendWithdrawal()!=null) { %>
										<td><%=dto.getRecommendWithdrawal() %></td>
									<% } else {%>
										<td> - </td>
									<% } %>	
								</tr>
							</table>
							<% } %>
							<div class="grey_font">※ 해외여행 등록제 ’동행’에 가입하시면 목적지의 안전정보, 여행객의 안전정보, 해외여행 중 사고에 대해 가족에게 사고사실 전달이 가능합니다. </div>
						</div>
						<div>
							<div><strong>국가별 사건/사고</strong></div>
							<br/>
							<div class="grey_font">외교부(www.0404.go.kr)에 공지된 여행상품에 포함된 국가의 사건, 사고 입니다. </div>
							<div class="accident_scroll">
								<div class="fl">
									<% for(SafetyInfoDto dto : safetyInfo) { %>
									<div><%=dto.getCountryName() %></div>
									<% } %>
								</div>
								<div class="fl">
									<div>
										<% for(SafetyInfoDto dto : safetyInfo) { %>
											<%=dto.getAccident() %>
										<% } %>
									</div>
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>
						
						
						<div>
							<div><strong>현지연락처</strong></div>
							<br/>
							<div class="grey_font">외교부(www.0404.go.kr)에 공지된 여행상품에 포함된 국가의 현지연락처 입니다. </div>
							<div class="accident_scroll">
								<div class="fl">
									<% for(SafetyInfoDto dto : safetyInfo) { %>
									<div><%=dto.getCountryName() %></div>
									<% } %>
								</div>
								<div class="fl">
									<div>
										<div>
											<% for(SafetyInfoDto dto : safetyInfo) { %>
											<%=dto.getContact() %>
										<% } %>
										</div>
									</div>
									<!-- 
									<div>
										<div><strong>총영사관 연락처</strong></div>
										<div>
											[주오사카 총영사관]
											<br/>ㅇ 주소 : 541-0056 日本国 大阪市中央区久太郎町2丁目5番13号 五味ビル
											<br/>ㅇ 대표번호(근무시간 중) : (81) 6-4256-2345
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 90-3050-0746
											<br/>ㅇ E-mail : osaka@mofa.go.kr
											<br/>
											<br/>[주 후쿠오카 총영사관]
											<br/>ㅇ 주소 : 810-0065 福岡市 中央區 地行浜 1-1-3
											<br/>ㅇ 대표번호(근무시간 중) : (81) 92-771-0461
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 80-8588-2806
											<br/>ㅇ e-mail : fukuoka@mofa.go.kr
											<br/>
											<br/>[주요코하마 총영사관]
											<br/>ㅇ 주소 : 231-0862 日本國 神奈川縣 橫浜市 中區 山手町 118番地
											<br/>ㅇ 대표번호(근무시간 중) : (81) 45-621-4531
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 80-6731-3285
											<br/>ㅇ E-Mail : yokohama@mofa.go.kr
											<br/>
											<br/>[주나고야 총영사관]
											<br/>ㅇ 주소 : 450-0003 日本国愛知県名古屋市中村区名駅南1-19-12
											<br/>ㅇ 대표번호(근무시간 중) : (81) 52-586-9221
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 80-4221-9500
											<br/>ㅇ E-Mail : nagoya@mofa.go.kr
											<br/>
											<br/>[주삿포로 총영사관]
											<br/>ㅇ 주소 : 060-0002 日本北海道札幌市中央北2西12丁目 1-4
											<br/>ㅇ 대표번호(근무시간 중) : (81) 11-218-0288
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 80-1971-0288
											<br/>ㅇ E-Mail : sapporo@mofa.go.kr
											<br/>
											<br/>[주센다이 총영사관]
											<br/>ㅇ 주소 : 980-0011 日本国宮城県仙台市青葉区上杉１丁目3-4
											<br/>ㅇ 대표번호(근무시간 중) : (81) 22-221-2751
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 90-9538-0741
											<br/>ㅇ E-mail : sendai@mofa.go.kr
											<br/>
											<br/>[주니가타 총영사관]
											<br/>ㅇ 주소 : 950-0078 新潟市中央區万代島5-1 万代島ビル8階
											<br/>ㅇ 대표번호(근무시간 중) : (81) 25-255-5555
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 90-8873-8853
											<br/>ㅇ E-Mail : niigata@mofa.go.kr
											<br/>
											<br/>[주히로시마 총영사관]
											<br/>ㅇ 주소 : 廣島市南區翠5丁目9-17
											<br/>ㅇ 대표번호(근무시간 중) : (81) 82-505-2100
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 90-8712-8028
											<br/>ㅇ E-Mail : hiroshima@mofa.go.kr
											<br/>
											<br/>[주고베 총영사관]
											<br/>ㅇ 주소 : 650 - 0004 神戶市 中央區 中山手通 2 - 21 - 5
											<br/>ㅇ 대표번호(근무시간 중) : (81) 78 -221-4853
											<br/>ㅇ 긴급연락처(사건사고 등 긴급상황 발생 시, 24시간) : (81) 90-5099-0414
											<br/>ㅇ E-Mail : kobe@mofa.go.kr
										</div>
									</div>
									<div>
										<div><strong>주재국 신고</strong></div>
										<div>
											ㅇ 경찰 : 110
											<br/>ㅇ 화재 : 119
											<br/>ㅇ 해상 사건사고 : 118
											<br/>ㅇ 전화번호 안내 : 104
										</div>
									</div>
									<div>
										<div><strong>의료기관 연락처</strong></div>
										<div>
											ㅇ 도쿄도보건의료정보센터 : 03-5285-8181
											<br/>(한국어, 영서, 중국어, 타이어, 스페인어로 근처의 진료가능한 의료기관 안내)
											<br/>시간 : 토, 일, 공휴일을 포함한 9:00~20:00까지 안내
										</div>
									</div>
									-->
								</div>
								<div style="clear:both;"></div>
							</div>
						</div>

					</div>
					
					<div id="travel_review_detail">
					    <div>
					        <div><strong>구매고객 후기</strong></div>
					        <div>
					            <div>
					                <div class="fl rating-score"><strong>4.3</strong><span class="grey_font">/5</span></div>
					                <div class="fl review_empty_star"><span class="review_big_purple_star "></span></div>
					                <div class="fl rating-count">214명의 여행후기</div>
					                <div style="clear:both;"></div>
					            </div>
					            <div>
					            	<div class="fl review_tag">
					            		<div><span class="purple_font">"50대"</span> 고객이 많이 구매한 상품입니다</div>
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="photo_tag"></span>
							            			일정이 알차요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>48</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="price_tag"></span>
							            			가격이 합리적이에요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>42</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="food_delicious_tag"></span>
							            			현지 음식이 맛있어요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>39 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="down_town_hotel_tag"></span>
							            			호텔이 시내에 있어요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>27</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="schedule_free"></span>
							            			일정이 여유로워요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>20</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="relax_hotel"></span>
							            			호텔에서 쉬기 좋아요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>13</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="various_food"></span>
							            			현지 음식이 다양해요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>12 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="various_joy"></span>
							            			즐길 거리가 다양해요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>8 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="guide_fun"></span>
							            			가이드가 재밌어요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>4 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="restaurant_view_good"></span>
							            			식당 뷰가 좋아요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>1 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            	</div>
					            	<div class="fl review_tag">
					            		<div><span class="purple_font">"가족여행"</span>으로 좋아요</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="clean_room"></span>
							            			객실이 깨끗해요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>45</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="pro_guide"></span>
							            			가이드가 전문적이에요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>41</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="careful_guide"></span>
							            			가이드가 배려 깊고 세심해요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>35</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="cheerful_guide"></span>
							            			가이드가 열정적이에요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>20</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="worth-price"></span>
							            			가격만큼 가치 있어요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>18</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="clean_restaurant"></span>
							            			식당이 청결해요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>13</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="near_hotel"></span>
							            			호텔이 관광지와 가까워요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>11</strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="hotel_service_good"></span>
							            			호텔 부대시설이 좋아요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>2 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            		
					            		<div>
					            			<div class="fl">
						            			<span class=" rating_gradation"></span>
						            			<div>
							            			<span class="hotel_view"></span>
							            			객실 뷰가 좋아요
						            			</div>
					            			</div>
					            			<div class="fr"><span class="purple_font"><strong>1 </strong></span>명</div>
					            			<div style="clear:both;"></div>
					            		</div>
					            	</div>
					            	<div style="clear:both;"></div>
					            	
					            </div>
					            <div id="see_more">더보기 <span class="grey_down_img"></span></div>
					            
					        </div>
					    </div>
					    <div>
						    <div><strong>여행후기</strong></div>
						    <div>
						        <div class="fl">총 <span class="purple_font">214</span>건</div>
						        <div class="fr">
						            <div class="fl purple_font">추천순</div>
						            <div class="fl">최신순</div>
						            <div class="fl">도움순</div>
						            <div class="fl">평점순</div>
						            <div style="clear:both;"></div>
						        </div>
						        <div style="clear:both;"></div>
						    </div>
						    <div>
						    	<form>
							    	<select class="fl" name="상품명">
							    		<option disabled hidden selected>상품명</option>
							    		<option value="전체">전체</option>
							    		<% for (String dto :reviewCategoryPackage) { %>
							    			<option><%=dto %></option>
							    		<% } %>
							    	</select>
							    </form>
							    <form>
							    	<select class="fl" name="동반자 유형">
							    		<option disabled hidden selected>동반자 유형</option>
							    		<option>전체</option>
							    		<option>커플여행</option>
							    		<option>가족여행</option>
							    		<option>아동동반 여행</option>
							    		<option>친구모임</option>
							    		<option>나홀로 여행</option>
							    		<option>기타</option>
							    	</select>
							    </form>
						    	<div class="fr">
							    	<div class="fl"><button id="write_review">후기 작성</button></div>
							    	<div class="fl"><input type="reset" value="선택해제"/><span class="grey_round_circle"></span></div>
							    	<div style="clear:both;"></div>
					    		</div>
					    		
					    		<div id="div_fullscreen_grey">
					    			<div id="write_review_box">
					    				<div>
											<div class="fl"><strong>후기 작성하기</strong></div>
											<div class="fr">
												<button id="review_x" type="button" class="fr"></button>
												<div style="clear:both;"></div>
											</div>
											<div style="clear:both;"></div>
										</div>
										
										<form id="user_review" method="post" action="<%=request.getContextPath()%>/InsertReviewContentServlet" enctype="multipart/form-data">
											<div class="fr">
												<input type="hidden" name="package_idx" value="${packageIdx}">
												<input type="hidden" name="review_idx" value="${maxReviewIdx}>">
												<input type="hidden" name="countryCity" value="${countryCity}">
												<div class="fl"> 좋아요 : </div>
												<select  name = "like"  class= "fl">
													<option value="친구모임으로 좋아요">친구모임으로 좋아요</option>
													<option value="부부연인으로 좋아요">부부연인으로 좋아요</option>
													<option value="가족여행으로 좋아요">가족여행으로 좋아요</option>
													<option value="나홀로 좋아요">나홀로 좋아요</option>
													<option value="아동모임으로 좋아요">아동모임으로 좋아요</option>
													<option value="허니문으로 좋아요">허니문으로 좋아요</option>
												</select>
												<div class="fl"> 나이대 : </div>
												<select name="age" class="fl">
													<option value="10대">10대</option>
													<option value="20대">20대</option>
													<option value="30대">30대</option>
													<option value="40대">40대</option>
													<option value="50대">50대</option>
													<option value="60대">60대</option>
													<option value="70대">70대</option>
													<option value="80대">80대</option>
													<option value="90대">90대</option>
												</select>
												<div class="fl"> 별점 : </div>
												<select name="star" class="fl">
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
												<div style="clear:both;"></div>
											</div>
											<div class="fl">
												<label><input type="checkbox" name="tag" value="4"/>일정이 알차요</label>
												<label><input type="checkbox" name="tag" value="10"/>가격이 합리적이에요</label>
												<label><input type="checkbox" name="tag" value="7"/>현지 음식이 맛있어요</label>
												<label><input type="checkbox" name="tag" value="12"/>호텔이 시내에 있어요</label>
												<label><input type="checkbox" name="tag" value="2"/>일정이 여유로워요</label>
												<br/>
												<label><input type="checkbox" name="tag" value="13"/>호텔에서 쉬기 좋아요</label>
												<label><input type="checkbox" name="tag" value="6"/>현지 음식이 다양해요</label>
												<label><input type="checkbox" name="tag" value="18"/>즐길 거리가 다양해요</label>
												<label><input type="checkbox" name="tag" value="15"/>가이드가 재밌어요</label>
												<label><input type="checkbox" name="tag" value="19"/>식당 뷰가 좋아요</label>
												<br/>
												<label><input type="checkbox" name="tag" value="3"/>객실이 깨끗해요</label>
												<label><input type="checkbox" name="tag" value="1"/>가이드가 전문적이에요</label>
												<label><input type="checkbox" name="tag" value="8"/>가이드가 배려 깊고 세심해요</label>
												<label><input type="checkbox" name="tag" value="11"/>가이드가 열정적이에요</label>
												<label><input type="checkbox" name="tag" value="5"/>가격만큼 가치 있어요</label>
												<br/>
												<label><input type="checkbox" name="tag" value="14"/>식당이 청결해요</label>
												<label><input type="checkbox" name="tag" value="9"/>호텔이 관광지와 가까워요</label>
												<label><input type="checkbox" name="tag" value="16"/>호텔 부대시설이 좋아요</label>
												<label><input type="checkbox" name="tag" value="17"/>객실 뷰가 좋아요</label>
											</div>
											<div>
												<textarea name="content" rows="15" cols="159" maxlength="500" placeholder="후기를 작성해주세요"></textarea>
											</div>
											<div>
												<input type="file" name="img[]" multiple />
												<img id="preview" />
											</div>
											<button class="fr" type="submit">제출하기</button>
											<div style="clear:both;"></div>
											
										</form>
										
					    			</div>
					    		</div>
					    		
					    		<div style="clear:both;"></div>
						    </div>
						    
						    <% for (PackageReviewContentDto dto : packageReviewContent) { %>
						    <div class="review_box">
						    	<div>
						    		<div class="fl purple_font"><span class="one_purple_star"></span><%=dto.getReviewStar() %></div>
						    		<div class="fl person_img"></div>
						    		<div class="fl"><%=dto.getUserId() %></div>
						    		<div class="fl review_grey_dot"></div>
						    		<div class="fl"><%=dto.getPressLike() %></div>
						    		<div class="fl review_grey_dot"></div>
						    		<div class="fl"><%=dto.getAge() %></div>
						    		<div class="fl review_grey_dot"></div>
						    		<div class="fl"><%=dto.getWriteDate() %></div>
						    		<div style="clear:both;"></div>
						    	</div>
						    	<div>
						    		<div class="fl grey_font"><strong>상품명</strong></div>
						    		<div class="fl"><%=dto.getPackageName() %></div>
						    		<div style="clear:both;"></div>
						    	</div>
						    	<div><%=dto.getText() %></div>
						    	<div>
						    		<% 	
						    			for(PackageReviewTagDto tag : packageReviewTag) {
						    				if(dto.getReviewIdx() == tag.getReviewIdx()) {
						    		%>
							    			<% if(tag.getText().equals("호텔이 시내에 있어요")) { %>
								    			<div class="fl bottom_tag"><span class="down_town_hotel_tag"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가이드가 전문적이에요")) { %>
								    			<div class="fl bottom_tag"><span class="pro_guide"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("일정이 여유로워요")) { %>
								    			<div class="fl bottom_tag"><span class="schedule_free"></span><%=tag.getText() %></div>
								    		<% } else  if(tag.getText().equals("객실이 깨끗해요")) { %>
								    			<div class="fl bottom_tag"><span class="clean_room"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("일정이 알차요")) { %>
								    			<div class="fl bottom_tag"><span class="photo_tag"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가격만큼 가치 있어요")) { %>
								    			<div class="fl bottom_tag"><span class="worth-price"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("현지 음식이 다양해요")) { %>
								    			<div class="fl bottom_tag"><span class="various_food"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("현지 음식이 맛있어요")) { %>
								    			<div class="fl bottom_tag"><span class="food_delicious_tag"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가이드가 배려 깊고 세심해요")) { %>
								    			<div class="fl bottom_tag"><span class="careful_guide"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("호텔이 관광지와 가까워요")) { %>
								    			<div class="fl bottom_tag"><span class="near_hotel"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가격이 합리적이에요")) { %>
								    			<div class="fl bottom_tag"><span class="price_tag "></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가이드가 열정적이에요")) { %>
								    			<div class="fl bottom_tag"><span class="cheerful_guide"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("호텔에서 쉬기가 좋아요")) { %>
								    			<div class="fl bottom_tag"><span class="relax_hotel"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("식당이 청결해요")) { %>
								    			<div class="fl bottom_tag"><span class="clean_restaurant"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("가이드가 재미있어요")) { %>
								    			<div class="fl bottom_tag"><span class="guide_fun"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("호텔 부대시설이 좋아요")) { %>
								    			<div class="fl bottom_tag"><span class="hotel_service_good"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("객실 뷰가 좋아요")) { %>
								    			<div class="fl bottom_tag"><span class="hotel_view"></span><%=tag.getText() %></div>
								    		<% } else if(tag.getText().equals("즐길거리가 다양해요")) { %>
								    			<div class="fl bottom_tag"><span class="various_joy"></span><%=tag.getText() %></div>
								    		<% } %>
						    		<% 		
						    				}
						    			}
						    		%>
						    			<div style="clear:both;"></div>
						    	</div>
						    	<div>
						    		<% 
						    			for(PackageReviewImgDto img : packageReviewImg) { 
						    				if(img.getReviewIdx() == dto.getReviewIdx()) {
						    		%>
						    			<% if(img.getImgUrl()!=null && img.getImgUrl().startsWith("http")) { %>
						    				<img class="fl" src="<%=img.getImgUrl() %>" alt="" />
						    			<% } else { %>
						    				<img class="fl" src="${pageContext.request.contextPath}/upload/img/<%=img.getImgUrl() %>" alt="" />
						    			<% } %>
						    		<%
						    				}
						    			}		
						    		%>
						    		<div style="clear:both;"></div>
						    	</div>
						    	<div><button type="button">도움이 돼요</button></div>
						    </div>
						    <% } %>
						    
					    </div>
					</div>
				</div>
				
				
			<div style="clear:both;"></div>
		</div>
		
		
		<div id="main_right" class="fr">
			<form action="TourController" id="amount_select">
				<div>
					<div>인원선택</div>
				</div>
				<div>
					<div class="select_person">
						<div class="fl">
							<div class="grey_font">성인</div>
							<div><span id="adult_money" class="comma"><%=packagePrice.getAdult() %></span>원</div>
						</div>
						<div class="fr">
							<button type="button" id="adult_minus">-</button>
							<input type="text" value="1" id="adult_price">
							<button type="button" id="adult_plus">+</button>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="select_person">
						<div class="fl">
							<div class="grey_font">아동</div>
							<div><span id="child_money" class="comma"><%=packagePrice.getChild() %></span>원</div>
						</div> 
						<div class="fr">
							<button type="button" id="child_minus">-</button>
							<input type="text" value="0" id="child_price">
							<button type="button" id="child_plus">+</button>
						</div>
						<div style="clear:both;"></div>
					</div>
					<div class="select_person">
						<div class="fl">
							<div class="grey_font">유아</div>
							<div><span id="kid_money" class="comma"><%=packagePrice.getInfant() %></span>원</div>
						</div>
						<div class="fr">
							<button type="button" id="kid_minus">-</button>
							<input type="text" value="0" id="kid_price">
							<button type="button" id="kid_plus">+</button>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div id="total_money">
					<div class="fl">총 금액</div>
					<div class="fr">
						<div>
							<span id="total" class="comma"><%=packagePrice.getAdult() %></span>
							<span>원</span>
							<input id="totalPrice" type="hidden" name="total_price" value="<%=packagePrice.getAdult() %>">
						</div>
						<div class="grey_font">유류할증료&제세공과금 포함</div>
						<div class="grey_font">적립 불가 상품입니다.</div>
					</div>
					<div style="clear:both;"></div>
					<div>상품각격 안내 <span class="grey_down_img"></span></div>
				</div>
				<div id="reservation_page">
					<button type="submit" class="fl">예약하기</button>
					<button type="button"><span class="heart_img"></span></button>
					<div style="clear:both;"></div>
				</div>
				<input type="hidden" name="command" value="oversea_reservation">
				<input type="hidden" name="packageIdx" value="${packageIdx}">
			</form>
		</div>
    	<div style="clear:both;"></div>
    </div>
    <!-- 내용 종료 -->
    
    
    <!-- footer 시작 -->
    <footer>

        <div class="footer1">
            <div>
                <div class="footer1_left fl">
                    <div>공지</div>
                    <div class="footer1_announcement">
                        <a href="#" class="footer1_active">
                            &lt;하나LIVE&gt; 24년 5월 30일 방송 이벤트 당첨자 안내(사전알림/퀴즈/구매인증)
                        </a>
                        <a href="#">
                            [여행만보] 24년 6월 미션 변동 사항 안내
                        </a>
                        <a href="#">
                            [공지] 24년 6월, 신용카드 ARS/온라인 무이자 할부 혜택 관련 안내 (항공권 제외)
                        </a>
                    </div>
                </div>
                <div class="footer1_center fl">
                    <a href="#">
                        더보기
                    </a>
                </div>
                <div class="footer1_right fr">
                    <div>
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/facebook.png" alt="페이스북">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/instagram.png" alt="인스타그램">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/naverblog.png" alt="네이버 블로그">
                        </a>
                    </div>
                    <div >
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/kakaoplus.png" alt="카카오 플러스">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/youtube.png" alt="유튜브">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/kakaostory.png" alt="카카오 스토리">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer1 종료 -->
        


        <div class="footer2">
            <div>
                <div class="fl">
                    <div class="footer2_left_top">
                        <div class="fl">
                            <a href="#">회사소개</a>
                        </div>
                        <div class="fl">
                            <a href="#">이용약관</a>
                        </div>
                        <div class="fl">
                            <a href="#">개인정보처리방침</a>
                        </div>
                        <div class="fl">
                            <a href="">여행약관</a>
                        </div>
                        <div class="fl">
                            <a href="#">해외여행자보험</a>
                        </div>
                        <div class="fl">
                            <a href="#">마케팅제휴</a>
                        </div>
                        <div class="fl">
                            <a href="#">공식인증예약센터 검색</a>
                        </div>
                    </div>
                    <div class="footer2_left_bottom">
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/footer2_left.png" alt="">
                    </div>
                   <div style="clear: both;"></div>
                </div>
                <div class="footer2_right fr">
                    <div>하나은행 구매안전 서비스</div>
                    <div>
                        고객님은 안전거래를 위해 현금으로 결제시<br/>
                        (주)하나투어에서 가입한 하나은행으로<br/>
                        구매안전서비스를 이용하실 수 있습니다.
                    </div>
                    <div>
                        <a href="#">
                            서비스 가입사실 확인
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer2 종료 -->



        <div class="footer3">
            <div>
                <div>
                    ※ 부득이한 사정에 의해 여행일정이 변경되는 경우 사전 동의를 받습니다.
                </div>
                <div>
                    ※ 하나투어는 개별 항공권, 단품 및 일부 여행상품에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을 지지 않습니다.
                </div>
                <div>
                    COPYRIGHTⓒ HANATOUR SERVICE INC. ALL RIGHTS RESERVED
                </div>
                
            </div>
        </div>
        <!-- footer3 종료 -->

        
        <div class="footer4">
            <div>
                <div class="footer4_left fl">
                    <div class="fl">
                        <div class="fl">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/award-logo-01.png" alt="">
                        </div>
                        <div class="fl">
                            대한민국<br/>100대 브랜드
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/award-logo-02-2024.png" alt="">
                        </div>
                        <div class="fl">
                            한국능률협회선정<br/>20년연속(2005~2024)<br/>브랜드파워 1위
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="<%=request.getContextPath() %>/hanatour/img/footer/award-logo-03-2024.png" alt="">
                        </div>
                        <div class="fl">
                            브랜드스탁선정<br/>20년연속(2005~2024)<br/>브랜드스타 1위
                        </div>
                        <div style="clear: both;"></div>
                    </div> 
                    <div style="clear: both;"></div>
                </div>
                <!-- footer4_left 종료  -->

                <div class="footer4_center fl">
                   <button>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/ico-arrow-left.png" alt="">
                    </button>
                    <button>
                       <img src="<%=request.getContextPath() %>/hanatour/img/footer/ico-arrow-right.png" alt="">
                   </button>
                </div>
                <!-- footer4_center 종료 -->
                <div class="footer4_right fl">
                    <div>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/korea_brand_awards.jpg" alt="">
                    </div>
                    <div>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/mark_01.png" alt="">
                    </div>
                    <div>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/mark1_eprivacy.png" alt="">
                    </div>
                    <div>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/mark_03_new.png" alt="">
                    </div>
                    <div>
                        <img src="<%=request.getContextPath() %>/hanatour/img/footer/ico_isms.png" alt="">
                    </div>
                </div>
                <!-- footer4_right 종료 -->
                <div style="clear: both;"></div>
            </div>
        </div>
        <!-- footer4 종료 -->

    </footer>
    <!-- footer 종료 -->
    
    


</body>
<script src="<%=request.getContextPath() %>/hanatour/script/tour_package.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>
