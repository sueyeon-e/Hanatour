<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main5_round_trip5_reservation2.css">
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


    <div class="airline_reservation_header2">
        <div class="airline_resercation_header_inner">
            <div class="airline_reservation_header_left">
                결제하기
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
                    <span>결제완료</span>
                </div>
            </div>
        </div>
    </div>



    <div class="airline_payment_body">


        <div class="airline_payment_left">
                
            <form action="${pageContext.request.contextPath}/FlightController">
        		<input type="hidden" name="command" value="airlineRoundtrip6Reservation3"/>
        		
                <div class="airline_payment_reservation">
                    <div class="airline_payment_reservation_header">
                        예약자 정보
                    </div>
                    <div class="airline_payment_reservation_body">
                        <div class="airline_payment_reservation_body1">
                            <div>이름</div>
                            <div>
                            	<c:if test="${requestScope.userInfo != null}">
                            		<c:set var="loginName" value="${requestScope.userInfo.name}"/>
                            		<c:set var="loginBirth" value="${requestScope.loginBirth}"/>
									<c:set var="loginEmail" value="${requestScope.userInfo.email}"/>
									<c:set var="loginPhone" value="${requestScope.userInfo.phone}"/>
									<c:set var="loginEmergency" value="${requestScope.userInfo.phone}"/>
									<c:set var="readonly" value="readonly"/>
                            	</c:if>
                                <input 
                                	type="text" 
                                	name="reservation_name" 
                                	placeholder="ex.홍길동 (한글만 입력가능)" 
                                	value="${loginName}" ${readonly}
                                />
                            </div>
                            <div>생년월일</div>
                            <div>
                            	
                                <input 
                                	type="text" 
                                	name="reservation_birth" 
                                	placeholder="ex.19991231 (숫자만 입력가능)" 
                                	value="${loginBirth}" ${readonly}
                                />
                            </div>
                        </div>
                        <div class="airline_payment_reservation_body2">
                            <div>이메일</div>
                            <div>
                            	
                                <input 
                                	type="text" 
                                	name="reservation_email" 
                                	placeholder="ex.sample@hanatour.com"
                                	value="${loginEmail}" ${readonly}
                                />
                            </div>
                            <div>휴대폰 번호</div>
                            <div> 
                                <input 
                                	type="text" 
                                	name="reservation_phone" 
                                	placeholder="ex.01012345678 (숫자만 입력가능)"
                                	value="${loginPhone}" ${readonly}
                                />
                            </div>
                        </div>
                        <div class="airline_payment_reservation_body3">
                            <div>비상연락처</div>
                            <div>
                                <div>
                                    <select name="reservation_emergency_number1" id="">
                                        <option value="KR">대한민국(+82)</option>
                                        <option value="">쿠웨이트(+965)</option>
                                    </select>
                                </div>
                                <div>
                                    <input type="text" name="reservation_emergency_number1" placeholder="ex.01012345678 (숫자만 입력가능)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="airline_payment_reservation_footer">
                        탑승객의 승객정보 의무 수집 강화로 인해 비상연락처를 필수로 입력해야 합니다.
                    </div>
                </div>







                <div class="airline_passenger_title">
                        탑승자 정보
                </div>



                <div class="airline_passenger_container">


					<!-- 반복문 시작 -->
					<c:forEach var="i" begin="1" end="${totalMember}">
					
	                    <div class="
	                        airline_passenger_info
	                        airline_passenger_info${i}
	                    ">
	                        <div class="airline_passenger_info_header">
	                            <div class="airline_passenger_info_header_left">
	                                <span>탑승자 정보</span>
	                                <span>${i}</span>
	                                <span>
	                                	(성인)
	                                </span>
	                            </div>
	                            <!-- airline_passenger_info_header_right_reservation_active -->
	                            <div class="airline_passenger_info_header_right">
	                                <div class="
	                                    airline_passenger_info_header_right_reservation
	                                    
	                                ">
	                                    <span></span>
	                                    <span>예약자와 동일</span>
	                                </div>
	                                <!-- airline_passenger_info_header_right_passport_active -->
	                                <div class="
	                                    airline_passenger_info_header_right_passport
	                                    
	                                ">
	                                    <span></span>
	                                    <span>여권정보 나중에 등록</span>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="airline_passenger_info_body">
	                            <div class="airline_passenger_info_body1">
	                                <div>성명(한글)</div>
	                                <div>
	                                    <input type="text" name="passenger${i}_name_kr" placeholder="ex.홍길동 (한글만 입렵가능)"/>
	                                </div>
	                                <div>여권 이미지 업로드</div>
	                                <div>
	                                	<span class="passport_ocr_description">이미지로 여권번호 자동 입력</span>
	                                    <div class="passport_ocr">
	                                        <!-- file 업로드 -->
	                                        <input 
	                                            type="file" 
	                                            onchange="recognizeFile(window.lastFile=this.files[0], ${i})" 
	                                            id="passport_ocr_id${i}"
	                                        />
	                                        <select id="langsel" onchange="window.lastFile && recognizeFile(window.lastFile)">
	                                            <option value='eng'selected>English </option>
	                                        </select>
	                                        <div id="log"></div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="airline_passenger_info_body2">
	                                <div>생년월일</div>
	                                <div>
	                                    <input type="text" name="passenger${i}_birth" placeholder="ex.19991231 (숫자만 입력가능)"/>
	                                </div>
	                                <div>
	                                    성별
	                                </div>
	                                <div>
	                                    <input type="radio" name="passenger${i}_gender" value="M"/> 남성
	                                    <input type="radio" name="passenger${i}_gender" value="F"/> 여성
	                                </div>
	                            </div>
	                            <div class="airline_passenger_info_body3">
	                                <div>
	                                    영문 성 
	                                </div>
	                                <div>
	                                    <input type="text" name="passenger${i}_name_en_last" placeholder="ex.HONG (영문만 입력가능)"/>
	                                </div>
	                                <div>
	                                    영문 이름 
	                                </div>
	                                <div>
	                                    <input type="text" name="passenger${i}_name_en_first" placeholder="ex.GILDING (영문만 입력가능)"/>
	                                </div>
	                            </div>
	                            <div class="airline_passenger_info_body4">
	                                <div>휴대폰 번호</div>
	                                <div>
	                                    <input type="text" name="passenger${i}_phone" placeholder="ex.01012345678 (숫자만 입력가능)"/>
	                                </div>
	                                <div>
	                                    이메일
	                                </div>
	                                <div>
	                                    <input type="text" name="passenger${i}_email" placeholder="ex.sample@hanatour.com"/>
	                                </div>
	                            </div>
	                            <div class="airline_passenger_info_body5">
	                                <div>여권번호</div>
	                                <div>
	                                    <input 
	                                    	type="text" 
	                                    	name="passenger${i}_passport_number" 
	                                    	placeholder="여권번호(ex.M12345678)" 
	                                    	class="passport_number_input" 
	                                    	id="passport_number${i}"
	                                    />
	                                </div>
	                                <div>
	                                    여권 만료일
	                                </div>
	                                <div>
	                                    <input type="text" name="passenger${i}_passport_expiration_date" placeholder="여권 만료일(ex.20300101)"/>
	                                </div>
	                            </div>
	                            <div class="airline_passenger_info_body6">
	                                <div>국적</div>
	                                <div>
	                                    <select name="passenger${i}_nation" id="">
	                                        <option value="kr">대한민국</option>
	                                    </select>
	                                </div>
	                                <div>
	                                    발행 국가
	                                </div>
	                                <div>
	                                    <select name="passenger${i}_issuing" id="">
	                                        <option value="kr">대한민국</option>
	                                    </select>
	                                </div>
	                            </div>
	                        </div>
	
	                    </div>
                    </c:forEach>
                    <!-- 반복문 종료 -->
                    <!-- airline_passenger 종료 -->



                </div>
                <!-- airline_passenger_container 종료 -->
                
                
                
                <input type="submit"/>
                
                
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
            <!-- form 종료 -->

        </div>
        <!-- airline_payment_left 종료 -->






        <div class="airline_payment_right">
            
            <div class="airline_payment_right_header">
                상품결제정보
            </div>
            <div class="airline_payment_right_price_info">
                <div>결제예정금액</div>
                <div>
                    <span>
                    	<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/>
                    </span>
                    <span>원</span>
                </div>
                <div>
                    유류할증료/제세공과금 포함
                </div>
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
            
            <div class="airline_payment_right_personnel_price">
                인원 별 운임 정보
                <div></div>
            </div>
            <div class="airline_payment_right_description">
                하나투어는 개별 항공권 단독 판매에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며 
                해당 상품의 거래정보 및 거래 등에 대해 책임을 지지 않습니다.
            </div>
            <div class="airline_payment_right_submit_btn">
                <span>
                	<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/>
                </span>
                <span>원 결제하기</span>
            </div>
            <div class="airline_payment_right_rule_info">요금/환불 규정 및 상세일정 보기</div>
        </div>
        <!-- airline_payment_right 종료 -->
    </div>
    <!-- airline_payment_body 종료 -->



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
<script src='https://unpkg.com/tesseract.js@4.0.1/dist/tesseract.min.js'></script>

<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main5_round_trip5_reservation2.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/ocr.js"></script>

</html>