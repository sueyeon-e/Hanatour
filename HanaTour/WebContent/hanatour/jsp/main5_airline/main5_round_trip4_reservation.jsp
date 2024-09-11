<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main5_round_trip4_reservation.css">
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
	


    <div class="airline_reservation_header1">
        <div class="airline_resercation_header_inner">
            <div class="airline_reservation_header_left">
                예약하기
            </div>
            <div class="airline_reservation_header_right">
                <div class="airline_reservation_header_right1">
                    <span></span>
                    <span>약관동의</span>
                </div>
                <div class="airline_reservation_header_right2"></div>
                <div class="airline_reservation_header_right3">
                    <span></span>
                    <span>예약정보입력</span>
                </div>
                <div class="airline_reservation_header_right4"></div>
                <div class="airline_reservation_header_right5">
                    <span></span>
                    <span>예약완료</span>
                </div>
            </div>
        </div>
    </div>


    <div class="airline_reservation_body">

        <div class="airline_reservation_body_inner">

            <div class="airline_reservation_body_left">



                <div class="airline_reservation_ticket_info">

					<!-- 반복문 시작 -->
					<c:forEach var="aDto" items="${selectedTicketList}" varStatus="status">
					
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="airline_reservation_ticket airline_reservation_ticket_departure">
							</c:when>
							<c:otherwise>
								<div class="airline_reservation_ticket airline_reservation_ticket_arrival ">
							</c:otherwise>
						</c:choose>
	                        <div class="airline_reservation_ticket_header">
	                            <div class="airline_reservation_ticket_header_left">
	                                <div>
	                                    <div></div>
	                                    <div>
	                                    	<c:choose>
	                                    		<c:when test="${status.index == 0}">
	                                    			가는 항공편
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			오는 항공편
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </div>
	                                </div>
	                                <div>
	                                    <div>
	                                    	<c:choose>
	                                    		<c:when test="${status.index == 0}">
	                                    			${roundTripDepartureCity} (${roundTripDepartureIata})
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			${roundTripArrivalCity} (${roundTripArrivalIata})
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </div>
	                                    <div></div>
	                                    <div>
	                                    	<c:choose>
	                                    		<c:when test="${status.index != 0}">
	                                    			${roundTripDepartureCity} (${roundTripDepartureIata})
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			${roundTripArrivalCity} (${roundTripArrivalIata})
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="airline_reservation_ticket_header_right">
	                                <div>예약가능</div>
	                                <div>요금확정</div>
	                            </div>
	                        </div>
	                        
	                        <div class="airline_reservation_ticket_body">
	
	                            <div class="airline_reservation_ticket_body1">
	                                <div>
	                                    <div>
	                                        <img src="https://image.hanatour.com/usr/static/img/airline/${aDto.airlineIata}.png" alt=""/>
	                                    </div>
	                                    <div>${aDto.airlineName}</div>
	                                </div>
	                                <div>${aDto.flightNumber}</div>
	                                <div>
	                                    <span>
	                                    	<c:if test="${aDto.codeShare eq 'T'}">실제운항 : ${aDto.codeShareAirlineName}</c:if>
	                                    </span>
	                                </div>
	                            </div>
	
	                            <div class="airline_reservation_ticket_body2">
	                                <div class="airline_reservation_ticket_body2_left">
	                                    <div>${aDto.departureTimeDate}</div>
	                                    <div>${aDto.departureTimeHour}</div>
	                                    <div>${aDto.departureTerminal }</div>
	                                </div>
	                                <div class="airline_reservation_ticket_body2_center">
	                                    <div>${aDto.flyingTime}</div>
	                                    <div></div>
	                                    <div>
	                                    	<c:if test="${aDto.stop eq 0}">직항</c:if>
	                                    	<c:if test="${aDto.stop ne 0}">경유 ${aDto.stop}회</c:if>
	                                    </div>
	                                </div>
	                                <div class="airline_reservation_ticket_body2_right">
	                                    <div>${aDto.arrivalTimeDate}</div>
	                                    <div>${aDto.arrivalTimeHour}</div>
	                                    <div>${aDto.arrivalTerminal}</div>
	                                </div>
	                            </div>
	
	                            <div class="airline_reservation_ticket_body3">
	                                <div>  
	                                	<c:if test="${roundTripAdult ne 0}">성인 ${roundTripAdult}</c:if>
	                                	<c:if test="${roundTripChild ne 0}">,소아 ${roundTripChild}</c:if>
	                                	<c:if test="${roundTripInfant ne 0}">,유아 ${roundTripInfant}</c:if>
	                                </div>
	                                <div>${roundTripSeatClass}</div>
	                            </div>
	
	                            <div class="airline_reservation_ticket_body4">
                                	<c:if test="${aDto.freeBaggage eq 'T'}">
		                                <div>수하물 포함</div>
		                                <div>
		                                    <span>1개</span>
		                                </div>
	                                </c:if>
	                            </div>
	
	                        </div>
	                        <!-- airline_reservation_ticket_body 종료 -->
	                    </div>
	                    <!-- airline_reservation_ticket 종료 -->
					
					
					</c:forEach>
					<!-- 반복문 종료 -->

                </div>





                <div class="airline_reservation_body_left_text1">
                    <ul>
                        <li>
                            유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라 적용됩니다.
                        </li>
                        <li>
                            여행사 발권대행 수수료는 항공료에 포함되며, 항공권 예약,상담,발권 업무의 서비스를 탑승자에게 제공하고 서비스의 대가로 받는 취급수수료입니다.
                        </li>
                        <li>
                            신용카드 결제 시 발권대행 수수료 금액은 항공권 결제 후 하나투어로 별도 승인됩니다.
                        </li>
                        <li>
                            발권대행 수수료는 <span>10,000</span>원이 적용됩니다.(1인 기준, 성인/소아 적용)
                        </li>
                        <li>
                            결제된 발권대행 수수료는 환불 되지 않습니다.
                        </li>
                    </ul>
                </div>


                <div class="airline_reservation_body_left_text2">
                    <div class="airline_reservation_body_left_text2_inner">
                        <div class="airline_reservation_body_left_text2_title">
                            유의사항
                        </div>
                        <div class="airline_reservation_body_left_text2_contents">
                            <ul>
                                <li>
                                    국가/지역별로 입국 제한 및 자가격리, PCR 음성 확인서가 필요할 수 있습니다. 또한 일부 부정기편은 대한민국 여권 소지자만 가능하며 외국 국적에 대한 탑승 제한 및 가능 예외 사항이 있으니 자세한 사항은 외교부, 항공사, 대사관등을 통해 확인 후 문제없도록 준비하시기 바랍니다.
                                </li>
                                <li>
                                    출국 전 경유 및 목적지 국적의 비자 필요 여부를 반드시 직접 확인하여 출국 시 문제가 되지 않도록 비자를 준비하셔야 합니다. 비자 미소지로 출국 또는 해당 국적의 입국이 거절될 경우 발생하는 문제 및 그에 따른 발생 비용이나 항공권 환불수수료는 당사에서 책임지지 않습니다.
                                </li>
                                <li>
                                    편도 여정으로 항공권을 구입하실 경우, 입국 국적의 비자를 반드시 소지하셔야 합니다. 비자를 소지하지 않는 경우에는 해당국적으로의 출국이 거부될 수 있습니다. (일부 국적은 복편의 항공권을 소지하지 않으면 탑승수속이 거절될 수 있으니 유의하시기 바랍니다.)
                                </li>
                                <li>
                                    무비자 입국이 가능한 나라도 편도 항공권으로 입국은 불가하니, 해당 국적 대사관을 통해 입국 조건을 미리 확인하시기 바랍니다.
                                    유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라 적용됩니다.
                                </li>
                                <li>
                                    항공권 취소수수료는 항공사마다 규정이 상이하므로, 해당운임의 요금규정을 반드시 확인하시기 바랍니다.
                                </li>
                                <li>
                                    환불 소요시간은 여행사에서 항공사로 환불 접수 후 평균적으로 2주 이내 심사/승인이 소요되며, 카드의 경우 카드사의 이용내역을 통해 확인할 수 있습니다.
                                    (단, 일부 항공사 심사/승인 절차에 따라 안내드린 기간보다 길어지는 경우에는 별도 안내드립니다.)
                                </li>
                                <li>
                                    환불이 가능한 항공권일 경우 요금규정에 기재되어 있는 항공권 취소수수료 외에 항공업무대행수수료는 별도로 부과됩니다.
                                </li>
                                <li>
                                    천재지변으로 인한 결항으로 탑승을 못 하셨을 경우 환불 절차는 예약 확인 후 > 예약/결제 및 문의내역 오른쪽 [항공 온라인 문의]로 별도 요청하셔야 합니다.
                                </li>
                                <li>
                                    탑승이 완료된 항공권은 소급환불 및 카드 변경이 불가합니다.
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>




                <div class="airline_reservation_agreements">
                    <form action="${pageContext.request.contextPath}/FlightController">
						<input type="hidden" name="command" value="airlineRoundtrip5Reservation2"/>
						
                        <div class="airline_reservation_agreements_header">
                            <div>약관동의</div>
                            <div>
                                <!-- airline_reservation_agreements_checkAll_active -->
                                <div class="
                                    airline_reservation_agreements_checkAll
                                    
                                ">
                                </div>
                                <div>
                                    모든 약관에 동의합니다.
                                </div>
                            </div>
                        </div>


                        <div class="airline_reservation_agreements_body">



                            <div class="
                                airline_reservation_agreements_body_list
                                airline_reservation_agreements_body_list1
                            ">

                                <div class="airline_reservation_agreements_body_outer">
                                    <div>
                                        <span>요금 / 환불 규정 및 안내</span>
                                        <span>(필수)</span>
                                    </div>
                                    <div class="airline_reservation_agreements_btn">
                                        <!-- airline_reservation_agreements_btn_active -->
                                        <div class="airline_reservation_agreements_btn_left">
                                            <label for="airline_reservation_agreements1">
                                                <input 
                                                    type="checkbox"  
                                                    name="agreement1" 
                                                    id="airline_reservation_agreements1"
                                                />
                                                <span class="airline_reservation_agreements_btn_left_img"></span>
                                                <span>동의합니다</span>
                                            </label>
                                        </div>
                                        <div class="airline_reservation_agreements_btn_right ">
                                            <span class="airline_reservation_agreements_btn_right_img"></span>
                                            <span>동의하지 않습니다</span>
                                        </div>
                                        <div></div>
                                    </div>
                                </div>
                                <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list1 종료 -->
                            
                            
                            <div class="
                                airline_reservation_agreements_body_list
                                airline_reservation_agreements_body_list2
                            ">

                                <div class="airline_reservation_agreements_body_outer">
                                    <div>
                                        <span>개인정보 수집 및 이용 동의 </span>
                                        <span>(필수)</span>
                                    </div>
                                    <div class="airline_reservation_agreements_btn">
                                        <div class="airline_reservation_agreements_btn_left">
                                            <label for="airline_reservation_agreements2">
                                                <input 
                                                    type="checkbox"  
                                                    name="agreement2" 
                                                    id="airline_reservation_agreements2"
                                                />
                                                <span class="airline_reservation_agreements_btn_left_img"></span>
                                                <span>동의합니다</span>
                                            </label>
                                        </div>
                                        <div class="airline_reservation_agreements_btn_right">
                                            <span class="airline_reservation_agreements_btn_right_img"></span>
                                            <span>동의하지 않습니다</span>
                                        </div>
                                        <div></div>
                                    </div>
                                </div>
                                <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list2 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list3
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>개인정보 제3자 제공 동의</span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements3">
                                            <input 
                                                type="checkbox"  
                                                name="agreement3" 
                                                id="airline_reservation_agreements3"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list3 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list4
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>고유식별정보 수집 및 처리 동의</span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements4">
                                            <input 
                                                type="checkbox"  
                                                name="agreement4" 
                                                id="airline_reservation_agreements4"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right ">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list4 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list5
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>결제 및 발권동의</span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements5">
                                            <input 
                                                type="checkbox"  
                                                name="agreement5" 
                                                id="airline_reservation_agreements5"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list5 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list6
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>발권수수료 </span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements6">
                                            <input 
                                                type="checkbox"  
                                                name="agreement6" 
                                                id="airline_reservation_agreements6"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list6 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list7
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>하나투어 항공 일반규정</span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements7">
                                            <input 
                                                type="checkbox"  
                                                name="agreement7" 
                                                id="airline_reservation_agreements7"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list7 종료 -->

                            
                            <div class="
                            airline_reservation_agreements_body_list
                            airline_reservation_agreements_body_list8
                        ">

                            <div class="airline_reservation_agreements_body_outer">
                                <div>
                                    <span>항공사 정보 동의</span>
                                    <span>(필수)</span>
                                </div>
                                <div class="airline_reservation_agreements_btn">
                                    <div class="airline_reservation_agreements_btn_left">
                                        <label for="airline_reservation_agreements8">
                                            <input 
                                                type="checkbox"  
                                                name="agreement8" 
                                                id="airline_reservation_agreements8"
                                            />
                                            <span class="airline_reservation_agreements_btn_left_img"></span>
                                            <span>동의합니다</span>
                                        </label>
                                    </div>
                                    <div class="airline_reservation_agreements_btn_right">
                                        <span class="airline_reservation_agreements_btn_right_img"></span>
                                        <span>동의하지 않습니다</span>
                                    </div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="airline_reservation_agreements_body_list_inner"></div>

                            </div>
                            <!-- .airline_reservation_agreements_body_list8 종료 -->



                        </div>
                        <!-- airline_reservation_agreements_body 종료 -->

                        <div class="airline_reservation_agreements_submit">
                            <!-- airline_reservation_agreements_submit_active -->
                            <div class="
                                airline_reservation_agreements_submit_inner
                                
                            ">
                                <label for="airline_reservation_agreements_submit_btn">
                                    <div>다음단계</div>
                                    <input type="submit" id="airline_reservation_agreements_submit_btn"/>
                                </label>
                            </div>
                        </div>
                        <!-- airline_reservation_agreements_submit 종료 -->
                        
                        
                        
                        <input type="hidden" name="roundtrip_departure_iata" value="${roundTripDepartureIata}"/>
						<input type="hidden" name="roundtrip_departure_city" value="${roundTripDepartureCity}"/>
						<input type="hidden" name="roundtrip_departure_date" value="${roundTripDepartureDate}"/>
						
						<input type="hidden" name="roundtrip_arrival_iata" value="${roundTripArrivalIata}"/>
						<input type="hidden" name="roundtrip_arrival_city" value="${roundTripArrivalCity}"/>
						<input type="hidden" name="roundtrip_arrival_date" value="${roundTripArrivalDate}"/>
					
						<input type="hidden" name="roundtrip_adult" value="${roundTripAdult}"/>
						<input type="hidden" name="roundtrip_child" value="${roundTripChild}"/>
						<input type="hidden" name="roundtrip_infant" value="${roundTripInfant}"/>
						
						<input type="hidden" name="roundtrip_seat_class" value="${roundTripSeatClass}"/>
						<input type="hidden" name="roundtrip_direct_flight" value="${roundTripDirectFlight}"/>
						
						<!--  출발지 -> 도착지, 도착지 -> 출발지 -->
						<input type="hidden" name="roundtrip_airline_ticket1" value="${selectedroundTripAirlineTikcetList[0]}"/>
						<input type="hidden" name="roundtrip_airline_ticket2" value="${selectedroundTripAirlineTikcetList[1]}"/>
						
						<input type="hidden" name="roundtrip_total_price" value="${totalPrice}"/>
				                        
                    </form>
                </div>



            </div>
            <!-- airline_reservation_body_left 종료 -->


            <div class="airline_reservation_body_right">
                <div class="airline_reservation_payment_info">
                    <div class="airline_reservation_payment_info_header">
                        상품 결제 정보
                    </div>
                    <div class="airline_reservation_payment_info_body">
                        <div>결제예정금액</div>
                        <div>
                            <span>
                            	<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/>
                            </span>
                            <span>원</span>
                        </div>
                        <div>유류할증료/제세공과금 포함</div>
                        <div>
                            <div>총 상품금액</div>
                            <div>
                                <span>
                                	<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/>
                                </span>
                                <span>원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>

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
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/facebook.png" alt="페이스북">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/instagram.png" alt="인스타그램">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/naverblog.png" alt="네이버 블로그">
                        </a>
                    </div>
                    <div >
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/kakaoplus.png" alt="카카오 플러스">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/youtube.png" alt="유튜브">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/kakaostory.png" alt="카카오 스토리">
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
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/footer2_left.png" alt="">
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
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/award-logo-01.png" alt="">
                        </div>
                        <div class="fl">
                            대한민국<br/>100대 브랜드
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/award-logo-02-2024.png" alt="">
                        </div>
                        <div class="fl">
                            한국능률협회선정<br/>20년연속(2005~2024)<br/>브랜드파워 1위
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="${pageContext.request.contextPath}/hanatour/img/footer/award-logo-03-2024.png" alt="">
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
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/ico-arrow-left.png" alt="">
                    </button>
                    <button>
                       <img src="${pageContext.request.contextPath}/hanatour/img/footer/ico-arrow-right.png" alt="">
                   </button>
                </div>
                <!-- footer4_center 종료 -->
                <div class="footer4_right fl">
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/korea_brand_awards.jpg" alt="">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/mark_01.png" alt="">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/mark1_eprivacy.png" alt="">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/mark_03_new.png" alt="">
                    </div>
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/footer/ico_isms.png" alt="">
                    </div>
                </div>
                <!-- footer4_right 종료 -->
                <div style="clear: both;"></div>
            </div>
        </div>
        <!-- footer4 종료 -->

    </footer>

       

</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main5_round_trip4_reservation.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
</html>