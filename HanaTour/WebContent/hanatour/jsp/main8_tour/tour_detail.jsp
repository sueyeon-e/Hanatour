<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TourTicketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String paramGoodsIdx = request.getParameter("goodsIdx");
	int goodsIdx = Integer.parseInt(paramGoodsIdx);
	
	ArrayList<TourTicketDto> listTourTicket = (ArrayList<TourTicketDto>)request.getAttribute("listTourTicket");
	ArrayList<TourInquiryDto> listTourInquiry = (ArrayList<TourInquiryDto>)request.getAttribute("listTourInquiry");
	ArrayList<TourIconDto> listTourIcon = (ArrayList<TourIconDto>)request.getAttribute("listTourIcon");
	ArrayList<TourTicketTypeDto> listTourType = (ArrayList<TourTicketTypeDto>)request.getAttribute("listTourType");
	ArrayList<TourTypeTitleDto> listTourTypeTitle = (ArrayList<TourTypeTitleDto>)request.getAttribute("listTourTypeTitle");
	ArrayList<TourDetailPriceDto> listDetailPrice = (ArrayList<TourDetailPriceDto>)request.getAttribute("listDetailPrice");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">    
	<title>Insert title here</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/lightpickOverseaDetail.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_type.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main1_1.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/tour_detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    
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


<!-- 전체 내용 -->
<div id="entire_container" class="center">
	<div class="top">
		<div class="top_content">
			<ul class="img_box fl">
				<li><img src="https://static.hanatour.com/product/2024/03/11/0106yrsuon/large.jpg"></li>
<!-- 				<li><img src="https://static.hanatour.com/product/2024/03/06/0751c28hvq/large.jpg"></li>
				<li><img src="https://static.hanatour.com/product/2019/06/27/0128hjmtyk/large.jpg"></li>
				<li><img src="https://static.hanatour.com/product/2019/06/27/0128w3f1p3/large.jpg"></li> -->
			</ul>
			
			<% for(TourTicketDto dto: listTourTicket) { %>
			<div class="top_right_box fr">
				<div style="height: 18.188px;"><%=dto.getCityName() %></div>			
				<h3 style="margin-top: 8px; height: 36.39px; font-size: 25px; font-weight: 400;">[파리] 프랑스 디즈니랜드 티켓 예약 입장권 1일</h3>
				<div class="top_info_box">
					<div>
						<ul>
							<li>즉시 사용 여부</li>
							<li><%=dto.getWhenUse().split("-")[0] %>년&nbsp;<%=dto.getWhenUse().split("-")[1] %>월&nbsp;<%=dto.getWhenUse().split("-")[2].split(" ").clone()[0] %>일부터 사용 가능</li>
						</ul>
						<ul>
							<li>티켓 사용 유형</li>
							<li><%=dto.getTicketType() %></li>
						</ul>
					</div>
					<div>
						<img src="https://image.hanatour.com/usr/static/img2/pc/fnd/icon_line_share_26.png">
					</div>
				</div>			
				<div class="first_line"></div>	
				<div class="icon_box">
				
				<% for(TourIconDto iconDto : listTourIcon) { 
					String iconTitle = iconDto.getGoodsIconTitle();
					if(iconTitle != null) {
						iconTitle = iconTitle.replace(" ", "<br/>");
					}
				%>
					<div class="box">
						<div>
							<div style="width: 25px; height: 25px;" class="center">
								<img src="<%=iconDto.getImgUrl() %>" style="width: 25px; height: 25px;" class="auto">
							</div>
						</div>
						<div class="center box_text"><%= iconTitle %></div>
					</div>
				<% } %>
					
				</div>		
				<div class="last_line"></div>			
				<div class="price">
					<span>68,900</span>
					<span>원</span>
				</div>			
			</div>
			<% } %>
		</div>
	</div>
	
	<form action="ControllerTour" method="get" id="tour_order_form">
		<input type="hidden" name="command" value="tour_goods_order">
	<!-- top 하단(img끝부터) 전체 -->	
	<div id="bottom">
		<div class="main fl">
					
<!-- side_bar -->
		<div class="side fr">
			<div class="side_bar">
				<div class="total_price">
					<div>총 금액</div>
					<div>
						<span class="payment_price">0</span>
						<input type="hidden" name="totalPrice" value="0">
						<span>원</span>
					</div>
				</div>
				<div class="under_price">
					2024년 6월 29일부터 사용 가능
				</div>
				<button type="submit" class="order_btn">주문하기</button>
				<input type="hidden" name="goodsIdx" value="3">
				<div class="coupon_zzim">
					<button type="button" class="coupon_btn">
						<span>쿠폰받기</span>
						<span class="download_icon"></span>
					</button>
					<button type="button" class="zzim_btn">
						<div class="heart_icon"></div>
					</button>
				</div>
			</div>
		</div>
		
			<div class="main_inner fl">
				<div class="info_box">
					<div class="info_box_inner">
						<div class="info_box_inner_left fl">
							<img src="https://image.hanatour.com/usr/static/img2/pc/fnd/icon_line_info_20_purple.png" style="width: 20px; height: 20px; margin-right: 6px;">
							<span>꼭 읽어보세요!</span>
						</div>
						<div class="info_box_inner_right fl">
							<div class="must_read">
							
							</div>
							<button type="button" class="info_btn" value="더보기">
								<span>더보기</span>
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_line_arrow_right_16_gray.png">
							</button>
						</div>
						<div class="greyscreen">
							<div class="modal_more_info">
								<div class="info_page_title">
									<div>꼭 읽어보세요</div>
									<button id="btn_close_page"></button>
								</div>
								<div class="info_page_bottom">
									<div class="info_bottom_inner"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="type center">
					<a href="#a_goods_type" class="type_inner fl">상품타입</a>
					<a href="#a_goods_info" class="type_inner fl">상품정보</a>
					<a href="" class="type_inner fl">취소/환불 규정</a>
					<a href="" class="type_inner fl">상품후기</a>
					<a href="" class="type_inner fl">상품문의</a>
					<a id="a_goods_type"></a>
				</div>
				
				<div class="price_box">
					<div class="price_box_inner">
						<div>
							<h3>상품타입</h3>
							<div class="calendar_price">
								<div class="calendar_include">
									<div id="tour_date" class="fl">
 -->                           <div id="tour_date_hide">
                                <div>
                                   <input type="text" id="input_start_date" name="startDate" style="display: none;"/>
                                </div>
                                <div>  
                                   <div>                   
                                    
                                      <button id="button_stop" class="fr" style="display: none;">선택완료</button>
                                      <div style="clear:both;"></div>
                                   </div>
                                </div>
                             </div>   
                             <div style="clear:both;"></div>
                         </div>
								</div>
								
								
								<!-- type별 price박스 한개 -->
							<% for(TourTicketTypeDto dto : listTourType) { %>
							<div class="price_container">
								<div class="type_price_box">
									<div class="type_price">
										<div class="type_price_top">
											<div class="type_price_title"><%=dto.getGoodsTypeTitle() %></div>
											<div class="type_price_price">
												<span class="price_num">27300<%-- <%=String.format("%,d", dto.getPrice())%> --%></span>
												<span class="price_unit">원</span>
											</div>
										</div>
										<button type="button" class="type_more">
											<span>타입 정보 더보기</span>
											<span>
												<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_line_arrow_right_16_gray.png">
											</span>
										</button>
										<div class="type_more_bottom">
											<div style="width: 97px; height:16.8px;">
												<span class="order"></span>
												<span style="font-size: 12px;">주문 확인 후 확정</span>
											</div>
											<div style="width: 97px; height: 16.8px;">
												<span class="order_when"></span>
												<span style="font-size: 12px;">10일 전 주문가능</span>
											</div>
											<button type="button" class="choice_btn">선택</button>
										</div>
									</div>
																	<!-- toggle되는 박스 -->
								<div class="group_product_option">
									<div>
										<div class="group_choose_option">
											<h4>수량선택</h4>
											<ul>
											<!-- 여기당 -->
											<%for(TourDetailPriceDto priceDto : listDetailPrice) { %>
											<% if(dto.getGoodsTypeIdx()==priceDto.getGoodsTypeIdx()) { %>
												<li class="choose_num">
													<div class="detail_type_price">
														<div class="type_title"><%=priceDto.getTypeTitle() %></div>
														<div>
															<span class="detail_price"><%=priceDto.getTypePrice() %></span>원
														</div>
														<div class="min_max"style="margin-top: 6px;">최소1개/최대6개</div>
													</div>
													<div class="option_num">
														<button type="button" class="option_minus">-</button>
														<div class="btn_between">0</div>
														<button type="button" class="option_plus">+</button>
													</div>
												</li>
												<% } %>
											<% } %>
												<!-- <li class="choose_num">
													<div class="detail_type_price">
														<div>모든연령 비용동일</div>
														<div>
															<span class="detail_price">224700</span>원
														</div>
														<div class="min_max" style="margin-top: 6px;">최소1개/최대6개</div>
													</div>
													<div class="option_num">
														<button type="button" class="option_minus">-</button>
														<div class="btn_between">0</div>
														<button type="button" class="option_plus">+</button>
													</div>
												</li> -->
												
												
											</ul>
										</div>
									<div class="option_price_box">
										<div class="sum_price_wrap">
											총 금액 <span class="sum_price">0</span>
											<span class="won">원</span>
										</div>
										<div class="price_info">상품권, 기프트카드 결제 불가 상품 <br/>
										상품타입 1건씩 결제 가능</div>
										<div class="cancel_info">선택한 사용일 7일 전까지 무료 취소 가능</div>
										<div class="option_btn_wrap">
											<button type="button" class="close_option">닫기</button>
											<button type="button" class="btn_option_submit">적용하기</button>
										</div>
									</div>
									</div>
								</div>
								</div>
								<% } %>
							</div>
							</div>
							
							<div id="a_goods_info"></div>
							</div>
						</div>
					</div>
				</div>
			</form>
				
				<div class="info_detail">
					<div class="info_title" style="height: 34px; line-height: 1.6;">상품정보</div>
					<div class="info_detail_container">
						<div class="voucher_img"></div>
						<div class="coupon_img"></div>
						<img src="https://image.hanatour.com/usr/cms/resize/770_0/2021/09/16/10000/f4eb22b7-55ab-4282-bdc8-eb56fa1c8c61.jpg" style="width: 770px;">
						<div class="empty_space"></div>
						<p>	
							<strong class="purple">[파리 디즈니랜드 1일 입장권 (1파크 / 2파크 선택가능)소개]</strong>
							<br/>낭만의 도시 파리에서 만나는 디즈니랜드!<br/>
							파리 디즈니랜드에서 행복하고 즐거운 하루를 보내보세요.<br/>
							특히 밤에는 환상적인 불꽃 축제가 열리고, 디즈니성에 불이 들어와 마치 마법의 동화속에 있는듯한 착각이 듭니다.<br/>
							나만의 취향으로 좋아하는 파크를 선택하여 방문하거나 두 파크 모두 관람해보세요.<br/>
							다양한 어트랙션과 놀거리가 준비되어 있으며, 여러가지 테마로 구성된 디즈니 동화 속 세상을 체험해보세요.<br/><br/><br/>
							디즈니랜드 파크에서는 디즈니성과 퍼레이드, 공주님 등 다양한 볼거리가 많습니다.<br/>
							월트디즈니 스튜디오에서는 어트랙션이 많이 있습니다.<br/><br/><br/>
							-1파크 : 파리 디즈니랜드 또는 월트 디즈니 스튜디오 중 한 곳을 선택하여 입장<br/>
							-2파크 : 파리 디즈니랜드, 월트 디즈니 스튜디오 두 곳 모두 입장 가능<br/>
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[포함사항]</strong>
							<br/>- 파리 디즈니랜드 1일 입장권 (1파크 또는 2파크로 구매하신 입장권)
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[불포함사항]</strong>
							<br/>- 각 옵션 포함 제외 일체
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[연령규정]</strong>
							<br/>- 성인 : 만 12세이상<br/>
							- 아동 : 만 3세 ~ 11세<br/>
							※ 만 0-2세는 무료로 입장할 수 있습니다. 사진 확인이 가능한 유효한 신분증을 제시해주세요.<br/>
							※ 아동/유아의 구분은 예약일 기준이 아닌, 티켓 사용일 기준으로 구분됩니다.
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[티켓 옵션 및 유효기간]</strong>
							<br/>- 지정한 날짜에만 사용<br/>
							※예약시 지정한 사용일에만 이용가능하며, 사용일 변경이 불가하므로 예약시 유의해주시길 바랍니다.<br/>
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[티켓 사용 방법]</strong>
							<br/>- 발권된 E티켓 다운로드 / 출력 후, 현지에서 제시후 사용하시면 됩니다.<br/>
							※ 화면이 잘 읽히지 않을 경우 사용이 불가할수 있으니 대비하여 모바일, 출력물 둘 다 준비해주세요.<br/>
							- 현장에서 출력한 E티켓을 제시하세요.<br/>
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[티켓 시즌 정보]</strong>
							<br/>날짜별 시즌은 상품타입에서 사용일 클릭후 예약하시면됩니다.<br/>
							비활성화 되어있는 날짜는 오픈전 또는 매진으로 판매가 불가한 날짜입니다.
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="purple">[파리 디즈니랜드 정보]</strong>
							<br/>- 운영시간 : 디즈니랜드 파크 : 오전 9시 30분 ~ 오후 10시 / 월트 디즈니 스튜디오 파크 : 오전 9시30분 ~ 오후 9시</br>
							(운영시간은 현지사정에 따라 유동적으로 변경될 수 있으니, 반드시 방문 전 공식 운영시간을 확인하시고 방문하시길 바랍니다.)<br/>
							- 공식 홈페이지 : 
							<a href="https://www.disneylandparis.com/en-usd/">▶바로가기◀</a>
						</p>
						
						<!-- 상품정보의 이미지 ul -->
						<ul class="info_img_ul">
							<li>
								<img src="https://static.hanatour.com/product-basic/2019/06/19/0917gfis90/large.jpg">
							</li>
							<li>
								<img src="https://static.hanatour.com/product-basic/2019/06/27/01287lhhxw/large.jpg">
							</li>
							<li>
								<img src="https://static.hanatour.com/product-basic/2019/06/27/0128pyrwck/large.jpg">	
							</li>
						</ul>
					</div>
					<hr class="hr_line">
					<div class="manual">
						<div class="manual_title">사용방법</div>
						<p class="manual_box">
							<strong>| 주문요청 → 주문완료 → 발권완료 → E티켓 업로드(PDF파일) |</strong>
							<br/><br/>
							1. 해당 상품은 E티켓 상품으로 결제와 함께 주문이 요청되어, 주문완료를 거쳐 발권이 진행됩니다.<br/>
							2. 결제 후 당일 ~ 3일 내 E티켓이 업로드 됩니다. (영업일 기준 / 평일 09:00 ~ 17:00 / 주말, 공휴일 제외)<br/>
							3. <span class="blue">하나투어 앱이나 Hanatour.com 홈페이지 [마이페이지] > [예약내역] > [투어/입장권]</span>에서<br/>
							   E티켓 확인이 직접 가능합니다.<br/>
							<span class="red_bold">※ 하나투어 모바일 페이지나 앱에서 바우처 확인 불가 시, PC로 확인해주시길 바랍니다.</span>
						</p>
						<div class="empty_space"></div>
						<div class="empty_space"></div>
						<p>
							<strong class="black_bold">[사용 방법]</strong>
							<span class="yellow"><br/>- 발권된 E티켓 다운로드 / 출력 후, 현지에서 제시후 사용하시면 됩니다.<br/></span>
							<span class="blue">※ 화면이 잘 읽히지 않을 경우 사용이 불가할수 있으니 대비하여 모바일, 출력물 둘 다 준비해주세요.</span> <br/>
							- 현장에서 출력한 E티켓을 제시하세요. <br/>
						</p>
					</div>
					<hr class="hr_line">
					
					<!-- 위치 -->
					<div class="location">
						<div class="location_title">위치</div>
						<div class="map"></div>
					</div>
					<hr class="hr_line">
					
					<!-- 유의사항 -->
					<div class="notice">
						<div class="notice_title">유의사항</div>
						<div class="notice_box">
							<p>
								- 해당티켓은 예약시 지정한 날짜에만 사용가능합니다.<br/>
								  발권 완료후 사용일 변경이 불가능하오니  이점 유의해주시길 바랍니다.<br/>
								- 디즈니랜드의 운영시간은 일자별로 상이하므로 방문전 반드시 영업여부/운영시간을 직접 확인해주시길 바랍니다.<br/>
								- 예약시 여권상의 정확한 영문명으로 예약해주셔야합니다.<br/>
								  (발권 후 개인정보 수정 불가하며, 오기재로 인한 이용이 불가할 수 있습니다.)<br/>
								- 해당 티켓은 대표자 1인의 성함으로 일괄 예약/발권처리 되며, 아동의 나이를 확인하기 위해 각 고객의 성함, 생년월일을 기입하는 절차가 있습니다.<br/>
								  현지 공급사에서 여러명을 예약하더라도, 대표자 1인의 성함으로 티켓 발권처리하므로 이용에는 전혀 문제가 없으니 이점 참고부탁드립니다.<br/>
								- 대기열이 있을 수 있습니다.
								- 여권 지참하셔야하나 검표원에 따라 검사하지 않는 경우도 있습니다.<br/>
								  다만. 아동/유아가 있을경우 검사할수 있으니 유효한 신분증을 제시해주세요.<br/>
							 	 <p class="red">
									※ 본 티켓은 훼손, 복제, 양도 또는 재판매 할 수 없습니다.<br/>
									    본 티켓은 성명이 기재된 본인 또는 성명이 기재된 분이 동반하는 분에 한해 사용할 수 있습니다. <br/>
									※해당상품은 현지 상황으로 인해 예약 후 수배가 불가 할 수 있습니다. 해당경우 전액 환불처리 도와드립니다. 	<br/>						
								</p>
								<button type="button" class="notice_ad"></button>
							</p>
						</div>
					</div>
					<hr class="hr_line">
					
					<!-- 취소/환불 규정 -->
					<div class="cancel_refund">
						<div class="cancel_refund_title">취소/환불 규정</div>
						<p>
							※ 본 상품은 상품특성상 부득이하게 별도의 취소 환불 약관이 적용됩니다.<br/>
							※ 본 취소 환불 규정은 영업일 기준으로 적용됩니다. (공휴일 및 주말 제외 , 영업시간 09:00 ~ 18:00)<br/>
							- 주문 완료 단계 : 100% 환불 가능<br/>
							- 주문 확정, 발권 진행중, 발권 완료 단계 : 예약 변경 및 전액 환불 불가<br/>
							※ 예약시 잘못 기입된 정보 ( 이름, 휴대폰번호, 이메일 주소 등)에 따른 불이익에 대해서는 책임을 지지 않습니다.<br/>
							<span class="red">※해당상품은 현지 상황으로 인해 예약 후 수배가 불가 할 수 있습니다. 해당경우 전액 환불처리 도와드립니다.</span>
						</p>
					</div>
					
					<!-- 다른 사람이 함께 본 상품 -->
					<div class="content_box">
						<div class="content_inner">
							<div class="content_container">
								<div class="content_container_title">다른 사람이 함께 본 상품</div>
								<div class="content_container_bottom">
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://static.hanatour.com/product/2018/12/27/04181m1riy/medium.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>투어/입장권</span>
												<div class="content_type_circle"></div>
												<span>트립</span>
											</div>
											<div class="content_title">[로마] 오전 바티칸 반일투어(2024년도 진행/회화관포함)</div>
											<div class="content_price">
												<span>65,000</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://static.hanatour.com/product/2024/06/13/0641h1iccd/medium.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>투어/입장권</span>
												<div class="content_type_circle"></div>
												<span>입장권/패스</span>
											</div>
											<div class="content_title">어드벤쳐 펀 4 (24/06/03부터~) 일본 오사카 유니버셜스튜디오재팬 익스프레스4 입장시간랜덤권 #명탐정코난 #닌텐도월드 #나의히어로아카데미아</div>
											<div class="content_price">
												<span>113,300</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://static.hanatour.com/product/2024/06/13/0641h1iccd/medium.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>투어/입장권</span>
												<div class="content_type_circle"></div>
												<span>입장권/패스</span>
											</div>
											<div class="content_title">어드벤처&죠스 4 (24/07/01부터~) 일본 오사카 유니버셜스튜디오재팬 익스프레스4 입장시간랜덤권 #닌텐도월드 #명탐정코난 #해리포터</div>
											<div class="content_price">
												<span>113,300</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
								</div>
							</div>
							
							<!-- 함께 많이 본 상품 -->
							<div class="content_container" style="margin-top: 60px;">
								<div class="content_container_title">함께 많이 본 상품</div>
								<div class="content_container_bottom">
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/04/23/100000/914adf5e-9691-47bf-bda5-fa7b61cb78d0.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>레지던스 3성급</span>
												<div class="content_type_circle"></div>
												<span>파리</span>
											</div>
											<div class="content_title">아파트호텔 아다지오 액세스 파리 클라마르</div>
											<div class="content_price">
												<span>149,536</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/04/23/90000/c2084e2c-ae89-4feb-a4cd-df02b2379e76.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>호텔 3성급</span>
												<div class="content_type_circle"></div>
												<span>파리</span>
											</div>
											<div class="content_title">컴포트 호텔 파리 포르트 디브리</div>
											<div class="content_price">
												<span>121,438</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
									<!-- content박스 하나씩 -->
									<div class="content">
										<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/08/24/20000/bcfea77f-4c7f-4890-ba50-d7a049576b09.jpg" class="content_img">
										<div class="content_info">
											<div class="content_type">
												<span>현지투어</span>
												<div class="content_type_circle"></div>
												<span>6박 7일</span>
											</div>
											<div class="content_title">런던/런던근교+파리/파리근교 7일 #런던뮤지컬관람 #파리2대옵션포함 #베르사유 #근교도시BEST★4 #전일정4성급호텔 #맛5#항공권 별도</div>
											<div class="content_price">
												<span>3,100,000</span>
												<span>원</span>
											</div>
										</div>
										<button type="button" id="detail" class="detail_btn">자세히 보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			
			<!-- 상품후기 -->
			<div id="review">
				<div class="review_container">
					<div class="review_container_title">
						<span>상품후기</span>
						<button type="button" class="review_write_btn">후기 작성하기</button>
					</div>
					<div class="review_container_bottom">
						<div class="rating_box border">
							<div class="rating_num">
								<strong>5</strong>
								<span>/5</span>
							</div>
							<div class="rating_star">
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_solid_star_32_purple.png">
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_solid_star_32_purple.png">
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_solid_star_32_purple.png">
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_solid_star_32_purple.png">
								<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_solid_star_32_purple.png">
							</div>
						</div>
						<div class="ai_review_summary"></div>
						
						<!-- 전체 후기 -->
						<div class="entire_review_title">
							<div>전체후기</div>
							<div style="display: flex; column-gap: 10px;">
								<button type="button" class="review_align_btn">최신순</button>
								<button type="button" class="review_align_btn">도움순</button>
								<button type="button" class="review_align_btn">평점순</button>
							</div>
						</div>
						<div class="review_entire_box">
							<!-- 리뷰 한개 박스 -->
							<div class="review_box">
								<div class="review_box_top">
									<span class="star_icon"></span>
									<span class="review_box_rating">5</span>
									<img src="https://image.hanatour.com/usr/static/img2/mobile/fnd/icon_profile_40.png" class="user_icon">
									<span class="user_name">이선옥</span>
									<div class="review_dot_icon"></div>
									<span class="review_date">2024.06.21</span>
								</div>
								<div class="review_type">
									<span>타입명</span>
									<span>★선착순 할인★ 파리 디즈니랜드 1일 입장권 (1파크 / 2파크 선택가능)</span>
								</div>
								<div class="review_content">
										하나투어가 지금 선착순 할인 하고 있어서 최저가네요 !<br/>
										타사 최저가 보고 눌러서 구매하려고 보면 아동가로 나와있는곳이 많아서 여기저기 비교하느라 힘들었습니다.<br/>
										...
								</div>
								<div class="review_bottom">
									<button type="button" class="review_good_btn">
										<div class="thumb_icon"></div>
										<span>도움이 돼요</span>
										<span class="review_good_num">0</span>
									</button>
									<button type="button" class="review_more">
										<div>더보기</div>
										<div class="down_icon"></div>
									</button>
								</div>
							</div>
							<!-- 리뷰 페이지 -->
							<div class="review_page">
								<button type="button" class="page_btn">1</button>
							</div>
						</div>
						
						
						<!-- 상품문의 -->
						<div class="inquiry">
							<div class="inquiry_inner">
								<div class="inquiry_title">
									<span>상품문의</span>
									<button type="button" class="inquiry_btn">문의하기</button>
								</div>
								<form action="ControllerTour" method="get">
									<input type="hidden" name="command" value="tour_goods_inquiry">
									<div class="inquiry_page_background">
										<div class="inquiry_page">
											<div>
												<div class="inquiry_page_title">
													<div>문의하기</div>
													<button type="button" id="btn_close_inquiry"></button>
												</div>
											
												<div class="inquiry_bottom">
													<div class="inquiry_bottom_inner">
														<table class="inquiry_table">
															<tr>
																<th>상품명</th>
																<td>[삿포로] 비에이 후라노 1일 버스투어 #1명부터 출발 #대형버스</td>
															</tr>
															<tr>
																<th>문의 유형</th>
																<td class="td_select_inquiry_type">
																	<select name="select_inquiry_type">
																		<option>문의 유형을 선택해 주세요</ioption>
																		<option value="기타">기타</option>
																		<option value="취소/환불">취소/환불</option>
																		<option value="티켓">티켓</option>
																		<option value="날짜/시간">날짜/시간</option>
																		<option value="시간">예약</option>
																	</select>	
																</td>
															</tr>
															<tr>
																<th>제목</th>
																<td class="td_inquiry_title">
																	<input type="text" name="write_inquiry_title" placeholder="제목을 입력해주세요.">
																</td>
															</tr>
															<tr>
																<th>내용</th>
																<td class="td_inquiry_content">
																	<div>
																		<textarea name="write_inquiry_content" placeholder="내용을 입력해주세요." rows="10"></textarea> 
																	</div>
																</td>
															</tr>
															
														</table>
														<div class="secret_checkbox_wrap">
															<label>
																<input type="checkbox" name="secret" value="secret_y"/> 비밀글
															</label>
														</div>
													</div>
												</div>
											</div>
											<div class="inquiry_bottom_wrap">
												<div class="bottom_btn_wrap">
													<button type="button" class="bottom_btn_cancel">취소하기</button>
													<input type="submit" class="bottom_btn_regist" value="등록하기">
												</div>
											</div>
									</div>	
									</div>
								</form>
								<div class="inquiry_info_box">
									<ul>
										<li>
											<span class="alert_icon"></span>
											<span>상품과 관계없는 글, 양도, 광고성, 욕설, 비방 도배 등의 글은 예고 없이 삭제됩니다.</span>
										</li>
										<li style="margin-top:8px;">
											<span class="alert_icon"></span>
											<span>공개 게시판 이므로 개인정보(주민번호, 연락처, 주소, 계좌번호, 카드번호 등)가 타인에게 노출될 경우 개인정보 도용의 위험이 있으니 주의해 주시기 바랍니다.</span>
										</li>
									</ul>
								</div>
								
								<% for(TourInquiryDto dto : listTourInquiry) { %>
								<div class="inquiry_box">
									<div class="inquiry_box_inner">
										<!-- inquiry_top: 답변완료|김OO|2024.06.20 -->
										<div class="inquiry_box_top">
											<% if(dto.getAnswer()==null){ %>
												<span class="inquiry_answer_status" style="color: #666666;">
												답변대기
												</span>
											<% } else { %>
												<span class="inquiry_answer_status">
												답변완료
												</span>
											<% } %>
											<div class="pole"></div>
											<span class="inquiry_name"><%=dto.getName() %></span>
											<div class="pole"></div>
											<span class="inquiry_date"><%=dto.getRegistDate().split(" ")[0] %></span>
										</div>
										<button type="button" class="inquiry_content_summary">
											<span>[<%=dto.getInquiryType() %>]<%=dto.getGoodsInquiryTitle()%></span>
											<div class="inquiry_icon_box">
												<div class="inquiry_down_icon"></div>
											</div>
										</button>

										<div class="inquiry_wrap">
											<div class="answer_secret">
												작성자만 확인 가능합니다.
											</div>
										</div>
									</div>
								</div>
								<% } %>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/lightpick.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f8ad0e4bbc.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main_type.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main1_home.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>
	
	<script>
	    var picker = new Lightpick({ field: document.getElementById('datepicker') });
	</script>
	<script>
		   let myPicker = null;
		   $(function() {
		      if (!myPicker) {
		        myPicker = new Lightpick({
		            field: document.getElementById('input_start_date'),
		            singleDate: true,
		            numberOfMonths: 2,
		            format: 'YYYYMMDD',
		            inline: true
		        });
		    }
		   });
	</script>
	<script>
	$(function() {
	    // 초기 설정
	    $(".greyscreen").hide();
	    $(".inquiry_wrap").hide();
	    $(".group_product_option").hide();
	    $(".inquiry_page_background").hide();

	    // 정보 버튼 클릭 시, greyscreen을 보여줍니다.
	    $(".info_btn").click(function(){
	        $(".greyscreen").show();
	    });

	    // 닫기 버튼 클릭 시, greyscreen을 숨깁니다.
	    $("#btn_close_page").click(function(){
	        $(".greyscreen").hide();
	    });

	    // 알림 버튼 클릭 시, 준비중 알림을 표시합니다.
	    $(".notice_ad").click(function(){
	        alert("준비중입니다!");
	    });

	    // 문의 버튼 클릭 시, inquiry_page_background를 보여줍니다.
	    $(".inquiry_btn").click(function(){
	        $(".inquiry_page_background").show();
	    });

	    // 문의 닫기 버튼 클릭 시, inquiry_page_background를 숨깁니다.
	    $("#btn_close_inquiry").click(function(){
	        $(".inquiry_page_background").hide();
	    });

	    // 문의 내용 요약 클릭 시, inquiry_wrap을 슬라이드 다운합니다.
	    $(".inquiry_content_summary").click(function(){
	        $(this).parent().find(".inquiry_wrap").slideDown();
	    });

	    // 수량을 업데이트하고 총 가격을 계산하는 함수
	    function updateQuantity(button, change) {
	        let quantityElement = button.siblings(".btn_between");
	        let currentQuantity = Number(quantityElement.text());
	        let newQuantity = Math.max(currentQuantity + change, 0); // 수량이 0보다 작아지지 않도록
	        quantityElement.text(newQuantity);
	        updateTotalPrice(button.closest(".group_product_option")); // 가격 업데이트
	    }

	    // 총 가격을 계산하고 업데이트하는 함수
	    function updateTotalPrice(container) {
	        let total = 0;

	        container.find(".choose_num").each(function() {
	            let quantity = Number($(this).find(".btn_between").text());
	            let priceText = $(this).find(".detail_price").text();
	            let price = Number(priceText.replace(/[^0-9]/g, '')); // 숫자만 추출

	            total += quantity * price;
	        });

	        container.find(".sum_price").text(total.toLocaleString()); // 쉼표로 구분된 숫자 표시
	    }

	    // 수량 증가 버튼 클릭 이벤트 핸들러
	    $(".option_plus").click(function() {
	        updateQuantity($(this), 1);
	    });

	    // 수량 감소 버튼 클릭 이벤트 핸들러
	    $(".option_minus").click(function() {
	        updateQuantity($(this), -1);
	    });

	    // 선택 버튼 클릭 시, 해당 .group_product_option을 슬라이드 다운 또는 업
	    $(".choice_btn").click(function(){
	        let btn_option = $(this).text();
	        let groupProductOption = $(this).parent().parent().siblings(".group_product_option");
	        
	        if(btn_option == "선택") {
	            $(this).text("취소");
	            groupProductOption.slideDown();
	        } else {
	            $(this).text("선택");
	            groupProductOption.slideUp();
	        }
	    });

	    // 닫기 버튼 클릭 시, 해당 .group_product_option을 슬라이드 업
	    $(".close_option").click(function() {
	        let groupProductOption = $(this).closest(".group_product_option");
	        groupProductOption.slideUp();
	        groupProductOption.prev(".choice_btn").text("선택");
	    });
	    $(".btn_option_submit").click(function(){
	    	let lastPrice = $(".last_price").text();
	    	lastPrice = 0;
	    	lastPrice = $(this).parent().siblings(".sum_price_wrap").find(".sum_price").text();
	    	$(".payment_price").text(lastPrice);
	    	$("input[name='totalPrice']").val(lastPrice);
	    	
	    });
	    $("#tour_order_form").submit(function(event){
	        // payment_price에서 텍스트 값 가져오기
	        let lastPrice = $(".payment_price").text();

	        // 콤마 제거 및 공백 제거 후 숨겨진 input에 설정
	        let numericLastPrice = lastPrice.replace(/,/g, '').trim();
	        $("input[name='totalPrice']").val(numericLastPrice);
	    });
	    
	});


	</script>
	
</html>