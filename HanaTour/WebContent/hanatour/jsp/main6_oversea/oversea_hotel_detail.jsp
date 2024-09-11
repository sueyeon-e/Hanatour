<%@page import="java.util.ArrayList"%>
<%@page import="dao.OverseaHotelDao"%>
<%@page import="dto.*"%>
<%@page import="dto.OverseaHotelInfoDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String innIdx = request.getParameter("innIdx");
	String inputCheckin = request.getParameter("inputCheckin");
	String inputCheckout = request.getParameter("inputCheckout");
	String inputRoom = request.getParameter("roomNum");
	String inputPersonnel = request.getParameter("inputPersonnel");
%>
<%
	System.out.println("oversea_hotel_detail.jsp까지 옴.");
	ArrayList<OverseaHotelDto> listHotel = (ArrayList<OverseaHotelDto>)request.getAttribute("listHotel");
	ArrayList<HotelTagDto> listTag = (ArrayList<HotelTagDto>)request.getAttribute("listTag");
	ArrayList<OverseaHotelInfoDto> bottomInfo = (ArrayList<OverseaHotelInfoDto>)request.getAttribute("bottomInfo");
	ArrayList<OverseaRoomTypeDto> listRoomTypeName = (ArrayList<OverseaRoomTypeDto>)request.getAttribute("listRoomTypeName");
	ArrayList<OverseaRoomDto> listType = (ArrayList<OverseaRoomDto>)request.getAttribute("listType");
	ArrayList<OverseaAdditionalInfoDto> AdditionalInfo = (ArrayList<OverseaAdditionalInfoDto>)request.getAttribute("AdditionalInfo");
	ArrayList<AmenityDto> listAmenity = (ArrayList<AmenityDto>)request.getAttribute("listAmenity");
	ArrayList<FacilityDto> listFacility = (ArrayList<FacilityDto>)request.getAttribute("listFacility");
	ArrayList<AmenitySubtDto> listAmenitySubt = (ArrayList<AmenitySubtDto>)request.getAttribute("listAmenitySubt");
	ArrayList<FacilitySubtDto> listFacilitySubt = (ArrayList<FacilitySubtDto>)request.getAttribute("listFacilitySubt");
	ArrayList<OverseaHotelReviewDto> listReview = (ArrayList<OverseaHotelReviewDto>)request.getAttribute("listReview");
	ArrayList<OverseaReviewImgDto> listReviewImg = (ArrayList<OverseaReviewImgDto>)request.getAttribute("listReviewImg");
	ArrayList<OverseaReviewOptionDto> listReviewOption = (ArrayList<OverseaReviewOptionDto>)request.getAttribute("listReviewOption");
	ArrayList<OverseaTotalRatingDto> listTotalRating = (ArrayList<OverseaTotalRatingDto>)request.getAttribute("listTotalRating");
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
    <!-- bsxlider css --> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_type.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main1_1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/oversea_hotel_detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
</head>
<body>
 
  <header>
        <!-- header1_active -->
		<!-- header1_hidden -->
        <div class="
            header1_logout
            ${sessionScope.loginId != null ? 'header1_hidden' : 'header1_active' }
        ">
            <div class="logout">
                <div class="">
                	<a href="${pageContext.request.contextPath }/FlightController?command=loginEntrance">로그인</a>
                </div>
                <div class="">
                	<a href="${pageContext.request.contextPath }/FlightController?command=joinEntrance">회원가입</a>
                </div>
                <div class="">
                    <a class="ready" href="${pageContext.request.contextPath }/ControllerOversea?command=customer_service">고객센터</a>
                </div>
            </div>
        </div>

        <div class="
            header1_login
            ${sessionScope.loginId != null ? 'header1_active' : 'header1_hidden' }
        ">
            <div class="login">
                <div class="">
                	<a href="${pageContext.request.contextPath}/FlightController?command=logout">로그아웃</a>
                </div>
                <div class="">
                    <a href="${pageContext.request.contextPath }/ControllerOversea?command=customer_service">고객센터</a>
                </div>
            </div>
        </div>


        <!-- header2 -->
        <div class="header2">
            <!-- header2 왼쪽 -->
            <div class="fl">
                <div class="logo fl">
                	<a href="${pageContext.request.contextPath}/FlightController?command=main1">
                		<img src="${pageContext.request.contextPath}/hanatour/img/header/ico-hanatour-logo2.png"/>
                	</a>
                </div>
                <div class="search_bar fl">
                    <form action="TourController">
                        <input 
                            type="text" 
                            name ="search_keyword" 
                            placeholder="검색어를 입력해 주세요"
                        >
                        <button class="search_btn">
                            <img src="<%=request.getContextPath() %>/hanatour/img/header/ico-search.png" alt="돋보기">
                        </button>
                        <input type="hidden" name="command" value="main_search">
                    </form>
                </div>
                <div class="trending_search fl">
                	<img src="${pageContext.request.contextPath}/hanatour/img/header/osaka.png"/>
                    <div class="trending_hover">
                        <div>
                        	<img src="${pageContext.request.contextPath}/hanatour/img/header/trending_search.png">"/>
                        </div>
                        <div>
                            <div>일본</div>
                            <div>몽골</div>
                            <div>다낭</div>
                        </div>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>

            <!-- header2 오른쪽 -->
            <div class="mypage fr">
                <div class="mypage_item1 fr">
                    <a class="ready" href="#">
                    	<img src="${pageContext.request.contextPath}/hanatour/img/header/ico-haeder-choice.png"/>
                    </a>
                </div>
                <div class="mypage_item2 fr">
                    <a href="${pageContext.request.contextPath}/TourController?command=reservationCheck">
                    	<img src="${pageContext.request.contextPath}/hanatour/img/header/ico-reservationhistory.png"/>
                    </a>
                </div>
                <div class="mypage_item3 fr">
                    <a href="${pageContext.request.contextPath}/TourController?command=reservationCheck">
                    	<img src="${pageContext.request.contextPath}/hanatour/img/header/ico-mymenu.png"/>
                    </a>

                    <!-- mypage_item3_hover_active -->
                    <div class="mypage_item3_hover1 ">

                        <div class="mypage_item3_hover1_header">
                            	마이메뉴는<br/><span>회원 전용</span> 메뉴입니다.
                        </div>
                        <div class="mypage_item3_hover1_body">
                            <a href="${pageContext.request.contextPath }/FlightController?command=loginEntrance">
                                <div class="mypage_item3_hover1_body_btn1">
                                    	로그인
                                </div>
                            </a>
                            <a href="${pageContext.request.contextPath }/FlightController?command=joinEntrance">
                                <div class="mypage_item3_hover1_body_btn2">
                                    	회원가입
                                </div>
                            </a>
                        </div>
                    </div>

                    <!-- mypage_item3_hover_active -->
                    <div class="mypage_item3_hover2">

                        <div class="mypage_item3_hover2_header">
                        	<span>
                        		${sessionScope.loginId != null ? sessionScope.loginName : '???'}
                        	</span> 님, 반갑습니다.
                        </div>
                        <div class="mypage_item3_hover2_body">
                            <div>
                                <a href="${pageContext.request.contextPath}/TourController?command=reservationCheck">예약내역</a>
                            </div>
                            <div>
                                <a class="ready" href="#">찜</a>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/ControllerOversea?command=private_inquiry">1:1문의하기</a>
                            </div>
                            <div>
                                <a href="${pageContext.request.contextPath}/FlightController?command=personalInfoEntrance">개인정보수정</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="clear:both;"></div>
            </div>
        
            <div style="clear: both;"></div>
        </div>
        
        <!-- header3 -->
        <div class="header3">
            <div class="menu">
                <div class="menu_left fl" id="menu_left">
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/hanatour/img/header/ico-hamburgermenu.png" alt="">
                    </a>

                    <div class="sub_menu_container smc_hide" id="sub_menu_container">
                        <div class="sub_menu">
                            <div class="sub_top">
                                <div class="sub_item fl">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/TourController?command=oversea_tour_form">
                                           	 해외여행
                                        </a>
                                    </div>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/TourController?command=oversea_tour_form">
                                            	해외여행 홈
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/FlightController?command=main5">
                                           	 항공
                                        </a>
                                    </div>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/FlightController?command=main5">
                                            	항공예약
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/ControllerOversea?command=oversea_main">
                                          	  호텔
                                        </a>
                                    </div>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/ControllerOversea?command=oversea_main">
                                            	해외호텔
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	국내숙박
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a class="ready" href="#">
                                            	국내여행
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	제주여행
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	내륙여행
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	울릉도/섬
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	내나라여행
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	국내골프
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a class="ready" href="#">
                                          	  연계서비스
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	하나투어상품권
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                           	 포켓와이파이
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <br>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                           	하나트래비즈
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	하나투어 기프트카드
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                           	여행자보험
                                        </a>
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            <!-- sub_top close -->
                            
                            <div class="sub_bottom">
                                <div class="sub_item fl">
                                    <div>
                                        <br>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a class="ready" href="">
                                           	 테마여행
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                           	 허니문
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	해외골프
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	크루즈
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	트래킹
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	제우스
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            MICE
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a href="${pageContext.request.contextPath}/ControllerTour?command=tour_main">
                                            	투어/입장권
                                        </a>
                                    </div>
                                    <div>
                                        <a href="${pageContext.request.contextPath}/ControllerTour?command=tour_main">
                                            	투어/입장권 홈
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a class="ready" href="#">
                                            	혜택/이벤트
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	이벤트
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	할인/혜택
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                           	여행기획전
                                        </a>
                                    </div>
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <a class="ready" href="#">
                                            	하나투어 셀렉션
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	하나LIVE
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	하나Original
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	밍글링투어
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	마일리지 클럽
                                        </a>
                                    </div>
                        
                                </div>
                                <div class="sub_item fl">
                                    <div>
                                        <br>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	하나팩 2.0
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	개런티 프로그램
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            SAFETY&JOY
                                        </a>
                                    </div>
                                    <div>
                                        <a class="ready" href="#">
                                            	우리끼리
                                        </a>
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                            <!-- sub_bottom close -->
                        </div>
                        <!-- sub_menu close -->
                        <div class="sub_menu_close" id="sub_menu_close">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/hanatour/img/header/ico-alllmenu_close.png" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- sub_menu_container close -->
                </div>
                <!-- menu_left close -->

                <div class="menu_center fl">
                    <ul>
                        <li>
                            <a class="ready" href="#">베스트</a>
                            <div></div>
                        </li>
                        <li class="menu_center_sub1">
                            <a href="${pageContext.request.contextPath}/TourController?command=oversea_tour_form">해외여행</a>
                            <div></div>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/FlightController?command=main5">항공</a>
                            <div></div>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ControllerOversea?command=oversea_main">호텔</a>
                            <div></div>
                        </li>
                        <li>
                            <a class="ready" href="#">항공+호텔</a>
                            <div></div>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ControllerTour?command=tour_main">투어/입장권</a>
                            <div></div>
                        </li>
                        <li>
                            <a class="ready" href="#">국내여행</a>
                            <div></div>
                        </li>
                        <li>
                            <a class="ready" href="#">테마여행</a>
                            <div></div>
                        </li>
                        <li>
                            <a class="ready" href="#">제우스</a>
                            <div></div>
                        </li>
                        <li>
                            <a class="ready" href="#">하나LIVE</a>
                            <div></div>
                        </li>
                    </ul>
                </div>
                <div class="menu_right fr">
                    <ul>
                        <li>
                            <a class="ready" href="#">이달의 혜택</a>
                        </li>
                        <li>
                            <a class="ready" href="#">맞춤여행</a>
                        </li>
                        <li>
                            <a class="ready" href="#">여행기획전</a>
                        </li>
                    </ul>
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
    </header>

<!-- content -->
<div class="container center">
	<div class="container_inner">
		<div class="contents">
			<div class="contents_top">
				<label>
				<button type="button" class="btn_safety_info">
					<span class="flag"><img src="https://image.hanatour.com/usr/static/img2/nation/JP.gif"></span>
					<div>
						<span class="country_name">일본: </span>
        				<span class="country_name_span">여행 전 입국 규정을 확인해 주세요</span>
					</div>
				</button>
				</label>
				
				<div class="search_wrap">
					<div class="search_wrap_line">
						<div class="search_name_box fl">
							<button class="oversea_hotel_search_icon"></button>
							<input type="text" class="hotel_search_input">
						</div>
						
						<!-- 오른쪽 검색 -->
						<div class="right_search fr">
							<button type="button" class="search_date">
								<div class="hotel_search_date">
									<div class="hotel_search_date_icon"></div>
									2024.08.05 - 2024.08.08
								</div>
								<span class="hotel_search_days">3박</span>
							</button>
							<button type="button" class="search_room_num">
								<div class="search_hotel_room_num">
									객실1
								</div> 
								<div class="search_hotel_person_num">성인 2명</div>
							</button>
							<button type="button" class="btn_hotel_search">숙소 검색</button>
						</div>
					</div>
				</div>
				
				<!-- 검색창 바로 밑 content -->
				<div class="content_inner">
					<!-- 호텔정보 박스 -->
					<div class="hotel_info_box">
						<div class="info_box_left fl">
							<div class="photo_wrap">
								<span class="photo_one fl">
									<img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/01/06/10000/337007a2-567d-43fd-b2e0-dcd5e98ce74e.jpg">
								</span>
								<span class="photo_two fl">
									<img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/05/01/340000/dcfba8c0-e113-491c-9bb9-dfbe24e36fd6.jpg">
								</span>
								<span class="photo_three fl">
									<img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/01/06/10000/45e26d96-ed14-49b0-b19d-87a9b608f674.jpg">
								</span>
								<span class="photo_four fl">
									<img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/01/06/10000/acb27278-cdbd-484b-acd0-2544353e926f.jpg">
								</span>
								<span class="photo_five fl">
									<img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/01/06/10000/eb10549b-bf1d-4625-9cba-83df8850f23f.jpg">
								</span>
							</div>
							<div class="bottom_icon_box fr">
								<button type="button" class="btn_print"></button>
								<button type="button" class="btn_share"></button>
								<button type="button" class="btn_zzim"></button>
							</div>
						</div>
						<%
						for(OverseaHotelDto dto : listHotel) {
						%>
						
						<div class="info_box_right fr">
							<div class="info_hotel_star"><%=dto.getStar()%>성급</div>
							<div class="info_hotel_wrap">
								<div class="info_hotel_title"><%=dto.getInnKor()%></div>
								<div class="info_hotel_title_eng"><%=dto.getInnEng()%></div>
							</div> 	
							<div class="hotel_point">
								<div class="hotel_point"> 
												
						        <%
 									if(dto.getPurpleBox() == null) {
 								%>	
								    <div class="point_box" style="display: none !important">
								<%
								} else {
								%>
									<div class="point_box">
						            <%=dto.getPurpleBox()%>
						        <%
						        }
						        %>
								    </div>
								</div>
							
									<%-- <div class="point_box">
										<% if(dto.getPurpleBox() == null) { %>
										<script>
											$(function() {
												$(".point_box").hide();	
											});
										</script>
										<% else { %>
											<%=dto.PurpleBox() %>
										<% } %>
									</div> --%>
							</div>
							<div class="benefit_box">
							
									<%
									for (HotelTagDto tagDto : listTag) {
									%>
									<%
									if(tagDto.getPurpleTag().equals("T")) {
									%>
										<div class="benefit_text fl"><%=tagDto.getTag()%></div>
									<%
									} else {
									%>
										<div class="benefit_text fl" style="color: #666; background: #f7f7f7;;"><%=tagDto.getTag()%></div>
									<%
									}
									%>
								<%
								}
								%>
							</div>
							<div class="review_area">
								<div>
									<div>
										<span class="hotel_rating"><%=dto.getReviewAvg()%></span>
										<span class="rating_level">우수</span>
										<span class="show_hotel_review">숙소후기 <%=dto.getReviewNum()%>건 보기</span>
									</div>
								</div>
							</div>
							<div class="price_area">
								<div class="price_inner_option fl">
									<div class="price_inner_text">1박 요금 최저가</div> 
									<div class="price_inner_text_bottom">객실 세금/봉사료 포함</div>
								</div>
								<div class="price_area_price fr"><%=String.format("%,d", dto.getPrice())%><span class="price_unit">원~</span></div>
							</div>
						</div>
						<%
						}
						%>
					</div>
					
					<!-- banner -->
					<div class="banner_first">
						<a href="">
							<img src="https://image.hanatour.com/usr/manual/md/2022/05/PL00113117/banner_hotel.jpg">
						</a>
					</div>
					<div class="banner_first">
						<a href="">
							<img src="https://image.hanatour.com/usr/manual/md/2024/01/PL00114511/banner_hotel.jpg">
						</a>
					</div>
					
					<!-- 숙소정보 -->
					<div class="about_hotel">
						<div class="about_hotel_text">
							<div class="about_hotel_title">
								숙소정보
							</div>
							<%
							for (OverseaHotelInfoDto bottomDto : bottomInfo ) {
							%>
							
							
							<!-- 테이블에 (address_eng컬럼)다시 가져오기  -->
							<p class="item_text">
								<span class="icn_location"></span>
								<%
								if(bottomDto.getAddressEng() == null) {
								%>
									주소 정보가 없습니다.
								<%
								} else {
								%>
									<%=bottomDto.getAddressEng()%>
								<%
								}
								%>
								<a href="#none" class="show_map">지도보기</a>
							</p>
							
							
							
							
							
							
							
							<p class="item_text">
								<span class="icn_time"></span>
								<%
								if(bottomDto.getCheckinCheckout() == null) {
								%>
									체크인/체크아웃 정보가 없습니다.
								<%
								} else {
								%>
									<%=bottomDto.getCheckinCheckout()%>
								<%
								}
								%>
							</p>
							<p class="item_text">
								<span class="icn_floor"></span>
								<%
								if(bottomDto.getFloors() == 0) {
								%>
									층수 정보가 없습니다. 
								<%
								} else {
								%>
									<%=bottomDto.getFloors()%>층
								<%
									}
									%>
								/ <span>
								<%
								if(bottomDto.getRoomNum() == 0) {
								%>
									객실수 정보가 없습니다.
								<%
								} else {
								%>
									<%=bottomDto.getRoomNum()%>객실
								<%
									}
									%>
								
								</span>
							</p>
							<p class="item_text">
								<span class="icn_telephone"></span>
								<%
								if(bottomDto.getPhone() == null) {
								%>
									전화 정보가 없습니다. 
								<%
								} else {
								%>
									전화<%=bottomDto.getPhone()%>
								<%
								}
								%>
							</p>
							<p class="item_text">
								<span class="icn_fax"></span>
								<%
								if(bottomDto.getFax() == null) {
								%>
									팩스 정보가 없습니다.
								<%
								} else {
								%>
									팩스<%=bottomDto.getFax()%>
								<%
								}
								%>
							</p>
							<%
							}
							%>
						</div>
					</div> 
					
					<div class="result_wrap">
						<div class="btn_wrap">
							<button type="button" class="btn_result_date">
								2024.08.27 - 2024.08.30
								<span class="result_date">3박</span>
							</button>
							<button type="button" class="btn_result_room_num">
								<span class="result_room_num_left">객실1</span>
								<span class="result_room_num_right">성인2명</span>
							</button>
						</div>
					</div>
					
					<!-- 객실선택 -->
					<div id="tab_menu">
						<div class="tab_filter">
							<div class="room_grouping">
							
							룸그룹핑</div>
							<div class="form_wrap">
								<div class="form_holder">
									<label>
										<input type="checkbox" name="free_cancel" value="y_free_cancel">무료취소
									</label>
								</div>
								<div class="form_holder">
									<label>
										<input type="checkbox" name="include_breakfast">조식포함
									</label>
								</div>
								<div class="form_holder">
									<label>
										<input type="checkbox" name="member_price">회원특가
									</label>
								</div>
								<div class="form_holder">
									<label>
										<input type="checkbox" name="special_benefit">스페셜 베네핏
									</label>
								</div>
							</div>
							<div class="deselect">
								<label>
									<button type="button" class="btn_deselect">선택해제</button>
								</label>
							</div>
						</div>
						
						<div class="room_price_info">
							<div class="alert_message">
								객실요금은 <span style="color: #5e2bb8;">세금/봉사료</span>가 포함된 금액입니다.
								<button type="button" class="btn_close_alert"></button>
							</div>
							<div class="room_align_box">
								<span></span>
							</div>
						</div>
						
						<div class="entire_room_title">전체 객실</div>
						
						<!-- 모든 타입을 감싸는 div -->
						<div class="entire_room_type">
						
						
						
						<!-- 여기 -->
					
							<!-- 타이틀을 포함한 한 가지 타입을 감싸는 div -->
							<div class="room_type">
								<a href="#none" class="room_type_title">트윈더블룸
									<span>174,110원</span>
								</a>
								<div class="room_type_content">
									<ul>
										<% int price = 207820; %>
										<form action="ControllerOversea"> 
										<li>
											<div class="item_area fl">
												<a href="#none">
													<div class="item_name">24th-29th Floor Double Room - Non-Smoking</div>
												</a>
												<div class="alarm_box"> 
													<button type="button" class="btn_alarm">알림</button>
												</div>
											</div>
											<div class="item_center fl">
												<p class="item_cancel_date">
													<span class="item_cancel_date_text">무료취소(~08월 22일까지)</span>
												</p>
												<p class="item_breakfast">
													<span class="item_breakfast_text">조식불포함</span>
												</p>
											</div>
											<div class="item_price_box fl">
												<div class="price_standard">1박 기준</div>
												<p class="item_price">
													<%= String.format("%,d", price) %><span class="won">원</span>
												</p>
												<div></div>
											</div>
											
											<!-- 예약하기 버튼 -->
											<div class="btn_reserv_wrap fr">
												<input type="submit" class="btn_reserv" value="예약하기">
												<input type="hidden" name="roomIdx" value="3">
												<input type="hidden" name="price" value=<%= price %>>
												<input type="hidden" name="inputCheckout" value="3">
												<input type="hidden" name="command" value="oversea_hotel_reservation">
											</div>
										</li>
									 </form> 
									
										
										<%-- <form action="oversea_hotel_reservation.jsp?roomIdx=<%=roomDto.getRoomIdx()%>"> --%>
										<li>
											<div class="item_area fl">
												<a href="#none">
													<div class="item_name">30th-35th Floor Double Room - Special Offer, Non-Smoking</div>
												</a>
												<div class="alarm_box">
													<button type="button" class="btn_alarm">알림</button>
												</div>
											</div>
											<div class="item_center fl">
												<p class="item_cancel_date">
													<span class="item_cancel_date_text">무료취소(~08월 22일까지)</span>
												</p>
												<p class="item_breakfast">
													<span class="item_breakfast_text">조식불포함</span>
												</p>
											</div>
											<div class="item_price_box fl">
												<div class="price_standard">1박 기준</div>
												<p class="item_price">
													213,270<span class="won">원</span>
												</p>
												<div></div>
											</div>
											<!-- 예약하기 버튼 -->
											<div class="btn_reserv_wrap fr">
												<input type="submit" class="btn_reserv" value="예약하기">
												<input type="hidden" name="roomIdx" value="100">
											</div>
										</li>
										<!-- </form> -->
									
										
										<%-- <form action="oversea_hotel_reservation.jsp?roomIdx=<%=roomDto.getRoomIdx()%>"> --%>
										<li>
											<div class="item_area fl">
												<a href="#none">
													<div class="item_name">30th-High Floor Double Room - Non-Smoking</div>
												</a>
												<div class="alarm_box">
													<button type="button" class="btn_alarm">알림</button>
												</div>
											</div>
											<div class="item_center fl">
												<p class="item_cancel_date">
													<span class="item_cancel_date_text">환불불가</span>
												</p>
												<p class="item_breakfast">
													<span class="item_breakfast_text">조식포함</span>
												</p>
											</div>
											<div class="item_price_box fl">
												<div class="price_standard">1박 기준</div>
												<p class="item_price">
													215,954<span class="won">원</span>
												</p>
												<div></div>
											</div>
											<!-- 예약하기 버튼 -->
											<div class="btn_reserv_wrap fr">
												<input type="submit" class="btn_reserv" value="예약하기">
												<input type="hidden" name="roomIdx" value="100">
											</div>
										</li>
										<!-- </form> -->
									
										
										<%-- <form action="oversea_hotel_reservation.jsp?roomIdx=<%=roomDto.getRoomIdx()%>"> --%>
										<li>
											<div class="item_area fl">
												<a href="#none">
													<div class="item_name">DOUBLE NON SMOKING</div>
												</a>
												<div class="alarm_box">
													<button type="button" class="btn_alarm">알림</button>
												</div>
											</div>
											<div class="item_center fl">
												<p class="item_cancel_date">
													<span class="item_cancel_date_text">무료취소(~08월 22일까지)</span>
												</p>
												<p class="item_breakfast">
													<span class="item_breakfast_text">조식불포함</span>
												</p>
											</div>
											<div class="item_price_box fl">
												<div class="price_standard">1박 기준</div>
												<p class="item_price">
													217,379<span class="won">원</span>
												</p>
												<div></div>
											</div>
											<!-- 예약하기 버튼 -->
											<div class="btn_reserv_wrap fr">
												<input type="submit" class="btn_reserv" value="예약하기">
												<input type="hidden" name="roomIdx" value="100">
											</div>
										</li>
										<!-- </form> -->
									
									</ul>
								</div>
							</div>
					

							
							<!-- 타이틀을 포함한 한 가지 타입을 감싸는 div -->
							<div class="room_type">
								<a href="#none" class="room_type_title">그 외 유형의 객실
									<span>181,862원</span>
								</a>
							</div>
							<div class="room_type">
								<a href="#none" class="room_type_title">디럭스룸
									<span>187,108원</span>
								</a>
							</div>
							<div class="room_type">
								<a href="#none" class="room_type_title">트리플룸
									<span>343,366원</span>
								</a>
							</div>
							<div class="room_type">
								<a href="#none" class="room_type_title">쿼드룸
									<span>348,435원</span>
								</a>
							</div>
							
							
						</div>
						
						
						<!-- 룸 리스트 스와이퍼 -->
						<div class="room_list"></div>
						
					</div>
					<div class="banner_bottom">
						<img src="https://image.hanatour.com/usr/static/img/pc/temp/banner_htl02.png">
					</div>
					<div class="hotel_detail_tab">
					<%
					for(OverseaAdditionalInfoDto dto: AdditionalInfo) {
					%>
						<%
						if(dto.getRoomInfo() != null) {
						%>
							<dl>
								<dt>객실</dt>
								<dd> <%=dto.getRoomInfo()%></dd>
							</dl>
						<%
						}
						%>
						 <%
						 if(dto.getFacilities() != null) {
						 %>
							<dl>
								<dt>편의시설 </dt>
								<dd><%=dto.getFacilities()%></dd>
							</dl>
						<%
						}
						%>
						<%
						if(dto.getDining() != null) {
						%>
							<dl>
								<dt>다이닝</dt>
								<dd><%=dto.getDining()%></dd>
							</dl>
						<%
						}
						%>
						
						<%
												if(dto.getNearEntertain() != null) {
												%>
							<dl>
								<dt>주변 즐길거리</dt>
								<dd><%=dto.getNearEntertain()%></dd>
							</dl>
						<%
						}
						%>
						
						<%
												if(dto.getConstructionNotice() != null) {
												%>
							<dl>
								<dt>공사 공지</dt>
								<dd><%=dto.getConstructionNotice()%></dd>
							</dl>
						<%
						}
						%>
					<%
					}
					%>
						<dl>
							<dt>숙소 부대시설</dt>
							<dd>
							<%
							for(AmenityDto amDto :listAmenity ) {
							%>
								<div class="amenity">
									<div class="amenity_inner fl">
										<div class="amenity_icon fl">
											<img src="<%=amDto.getAmenityImg()%>">
										</div>
										<div class="fl"><%=amDto.getAmenityTitleName()%></div>
									</div>
									
									<ul>
									<!-- 여기 -->
										<%
										for(AmenitySubtDto amSubDto : listAmenitySubt) {
										%>
										 	<%
										 	if(amDto.getAmenityTitleIdx()==amSubDto.getAmenityTitleIdx()) {
										 	%>
												<li><%=amSubDto.getAmenitySubtName()%></li>
											<%
											}
											%>
										<%
										}
										%>
									</ul>
								</div>
							<%
							}
							%>
							</dd>
						</dl>
						<dl>
							<dt>객실 편의시설</dt>
							<dd>
							<%
							for(FacilityDto fDto : listFacility ) {
							%>
								<div class="facility">
									<div class="facility_inner fl">
										<div class="facility_icon fl">
											<img src="<%=fDto.getFacilityImg()%>">
										</div>
										<div class="fl"><%=fDto.getFacilityTitleName()%></div>
									</div>
									<ul>
									<!-- 여기 -->
										<%
										for(FacilitySubtDto fSubDto : listFacilitySubt) {
										%>
										<!-- 참고 -->
										 	<%
										 	if(fDto.getFacilityTitleIdx()==fSubDto.getFacilityTitleIdx()) {
										 	%>
												<li><%=fSubDto.getFacilitySubtName()%></li>
											<%
											}
											%>
										<%
										}
										%>
									</ul>
								</div>
							<%
							}
							%>
							</dd>
						</dl>
						
					</div>
					
				</div>
				
				<!-- 숙소후기 -->
				<div class="hotel_review">
					<div class="hotel_review_inner">
						<div class="hotel_review_title">숙소후기</div>
						<div class="rating_main_box">
							<div class="rating_avg_box">
								<div class="rating_avg_inner">
								<% for(OverseaTotalRatingDto dto : listTotalRating) { %>
									<strong class="grade">
										<em class="grade_num"><%=dto.getTotalAvg() %></em>
										<span class="grade_total">5</span>
									</strong>
									<strong class="grade_count">(<%=dto.getReviewCount() %>개)</strong>
								<% } %>
								</div>
							</div>
							<div class="rating_graph_box">
								<div class="rating_graph_inner">
									<canvas id="myChart" style="display: block; height: 220px;"></canvas>
								</div>
							</div>
						</div>
						
						<div class="rating_option_wrap">
							<span>
								총 <span  class="review_total_count">10</span>건
							</span>
							<ul>
								<li>최신순</li>
								<li>도움순</li>
								<li>평점순</li>
							</ul>
						</div>
						<div class="review_filter">
							<div class="review_type">
								<select name="review_option">
									<option value="동반자 유형">동반자 유형</option>
									<option value="전체">전체</option>
									<option value="친구여행">친구여행</option>
									<option value="비즈니스 및 출장">비즈니스 및 출장</option>
									<option value="커플여행">커플여행</option>
									<option value="개인여행">개인여행</option>
									<option value="유아/아동 동반여행">유아/아동 동반여행</option>
									<option value="청소년 동반여행">청소년 동반여행</option>
								</select>
								
							</div>
							<div style="display: flex;">
								<div class="write_review">
									<button type="button" class="btn_write_review">후기작성</button>
								</div>
								<div class="fullscreen_review_grey">
								
								<!-- 후기 작성창 form태그 -->
									<div class="write_review_box">
										<div>
											<span>후기 작성하기</span>
											<button type="button" class="btn_close_review"></button>
										</div>
										<form action="<%=request.getContextPath()%>/OverseaReviewRegistServlet" method="post">
										<div class="write_review_bottom center">
											<div>
												여행 유형: 
												<select name="review_option" style="margin-left: 10px; margin-right: 10px; width: 230px;">
													<option value="동반자 유형">동반자 유형</option>
													<option value="전체">전체</option>
													<option value="친구여행">친구여행</option>
													<option value="비즈니스 및 출장">비즈니스 및 출장</option>
													<option value="커플여행">커플여행</option>
													<option value="개인여행">개인여행</option>
													<option value="유아/아동 동반여행">유아/아동 동반여행</option>
													<option value="청소년 동반여행">청소년 동반여행</option>
												</select>
												청결 상태: 
												<select name="review_rating_clean" class="review_rating">
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>			
												직원 및 서비스: 
												<select name="review_rating_service" class="review_rating">
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>			
												편의시설/서비스: 
												<select name="review_rating_facility" class="review_rating">
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>			
												숙박시설 상태 및 시설: 
												<select name="review_rating_place" class="review_rating">
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select>			
									 		</div>
											<div class="review_checkbox">
												CHECKBOX : 
												<input type="checkbox" name="review_checkbox" value="1"> 위치가 찾기 쉬워요
												<input type="checkbox" name="review_checkbox" value="2"> 조용히 쉬기 좋아요
												<input type="checkbox" name="review_checkbox" value="3"> 시설이 청결해요
												<input type="checkbox" name="review_checkbox" value="4"> 냉난방이 잘돼요
												<input type="checkbox" name="review_checkbox" value="5"> 대중교통이 편해요
												<input type="checkbox" name="review_checkbox" value="6"> 객실 상태가 좋아요
												<input type="checkbox" name="review_checkbox" value="7"> 조식이 맛있어요
												<input type="checkbox" name="review_checkbox" value="8"> 친절해요
												<input type="checkbox" name="review_checkbox" value="9"> 가격이 합리적이에요
												<input type="checkbox" name="review_checkbox" value="10"> 라운지가 좋아요
												<input type="checkbox" name="review_checkbox" value="11"> 관광지와 가까워요
												<input type="checkbox" name="review_checkbox" value="12"> 즐길 거리가 많아요
												<input type="checkbox" name="review_checkbox" value="13"> 뷰가 멋있어요
												<input type="checkbox" name="review_checkbox" value="14"> 공항에서 가까워요
												<input type="checkbox" name="review_checkbox" value="15"> 한국어 가능직원이 있어요
											</div> 
											<div>
												<textarea name="textarea_review_content" placeholder="후기 작성" rows="5" class="center" style=" padding: 15px;"></textarea>
											</div>
											<div class="btn_regist_wrap">
												<input type="submit" value="등록" class="btn_regist_review">
											</div>
										</div>
										</form>
									</div>
								</div>
								<button type="button" class="btn_review_deselect">
									<span class="btn_review_text">선택해제</span>
								</button>
							</div>
						</div>
						<ul class="review_list">
						
							<!-- 리뷰 한개  여기부터 -->
							<%
							for(OverseaHotelReviewDto dto : listReview) {
							%>
							<li>
								<div class="rating_info">
									<strong class="review_point"><%=dto.getReviewRating()%></strong>
									<div style="display: flex;">
										<span class="review_person_icon">
											<img src="https://image.hanatour.com/usr/static/img2/pc/com/bg_alpha.png">
										</span>
										<span class="review_writer"><%=dto.getUserId()%></span>
										<span class="review_option_type"><%=dto.getReviewType()%></span>
										<span class="review_regist_date"><%=dto.getRegistDate().split(" ")[0]%></span>
									</div>
								</div>
								<div class="review_product">
									<ul>
										<li>
											<strong>상품명</strong>
											<span><%=dto.getInnKor()%></span>
										</li>
									</ul>
								</div>
								<div class="review_content">
									<%=dto.getContent()%>
								</div>
								<div class="review_topic_wrap">
									<% for(OverseaReviewOptionDto optionDto : listReviewOption) { %>
										<% if(dto.getReviewIdx()==optionDto.getReviewIdx()) { %>
											<span>
												<img src="<%=optionDto.getOptionImg()%>">
												<%=optionDto.getTitle() %>
											</span>
										<% } %>
									<% } %>
								</div>
								
								<% if (listReviewImg != null && !listReviewImg.isEmpty()) { %>
								<div class="review_img_box">
									<ul class="review_img_list">
										<%
										for(OverseaReviewImgDto imgDto : listReviewImg) {
										%>
											<% if(dto.getReviewIdx()==imgDto.getReviewIdx())  {%>
												<li>
													<img src="<%=imgDto.getImgUrl()%>">
												</li>
											<% } %>
										<% } %>
									</ul>
								</div>
								<% } else { %> <%}%>
								<div class="btn_helpful_box">
									<button type="button" class="btn_helpful">도움이 돼요</button>
								</div>
							</li>
							<% } %>
							
						</ul>
						<div class="paginate_wrap">
							<div class="pagination">
								1 &nbsp; 2
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 숙소 추천 -->
				<div>근처에 있는 다른 숙소</div>
				<div class="hotel_near_wrap">
					<div class="hotel_near_swiper"></div>
				</div>
				<div style="width: 1200px; height: 14px;"></div>
			</div>
		</div>
	</div>
</div>
</div>
    
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main_type.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main1_home.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>
 <script>
	<% for(OverseaTotalRatingDto dto : listTotalRating) {%>
	console.log(<%=dto.getClean()%>)
	const xValues = ["청결상태", "직원 및 서비스", "편의시설/서비스", "숙박 시설 상태 및 시설"];
	const yValues = [<%=dto.getClean()%>, <%=dto.getEmployee()%>, <%=dto.getConvenientFacility()%>, <%=dto.getInnFacility()%>];
	const barColors = ["#d4d6d8;", "#333;","#d4d6d8;","#d4d6d8;"];
	<% } %>
	new Chart("myChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: barColors,
	      data: yValues,
	      barThickness: 20
	    }]
	  },
	  options: {
	    legend: {display: false},
	    title: {
	      display: true,
	    },
	    thickness: 0.6,
	    scales: {
            y: {
                beginAtZero: false, // Y축의 시작점을 0으로 설정하지 않음
                min: 0, // Y축의 최소값 설정
                max: 5, // Y축의 최대값 설정
                ticks: {
                    stepSize: 0.5 // Y축의 눈금 간격을 설정
                }
            }
        }
	  }
	});
</script>
    <script>
		$(function() {
			$(".fullscreen_review_grey").hide();
			$(".btn_write_review").click(function() {
				$(".fullscreen_review_grey").show();
			});
			$(".btn_close_review").click(function() {
				$(".fullscreen_review_grey").hide();
			});
			
		});
    </script>
</html>