<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/lightpick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main5_round_trip2.css">
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

    
      
    <div class="airline_search_page_header">
        

        <div class="airline_search_page_header_inner">
        

            <div class="airline_search_page_header_inner1">

                <div class="airline_info">


                    <div class="airline_info_top">
                        <div>${roundTripDepartureCity}</div>
                        <div>
                            <div></div>
                        </div>
                        <div>${roundTripArrivalCity}</div>
                    </div>


                    <div class="airline_info_bottom">
                        <div></div>
                        <div class="airline_info_bottom_center">
                            <div class="airline_info_date">
                                <div>${roundTripDepartureDate}</div>
                                <div>&nbsp;~&nbsp;</div>
                                <div>${roundTripArrivalDate}</div>
                            </div>
                            <div class="airline_info_member">
                                <div>
                                    <span>
                                    	<c:if test="${roundTripAdult ne 0}">성인 ${roundTripAdult}</c:if>
                                    </span>
                                </div>
                                <div>
                                    <span>
                                    	<c:if test="${roundTripChild ne 0}">, 소아 ${roundTripChild}</c:if>
                                    </span>
                                    	
                                </div>
                                <div>
                                    <span>
                                    	<c:if test="${roundTripInfant ne 0}">, 유아 ${roundTripInfant}</c:if>
                                    </span>
                                </div>
                                <div>
                                    <span>⊙${roundTripSeatClass}</span>
                                </div>
                            </div>
                        </div>
                        <div class="airline_info_change_btn">
                            <span>변경</span>
                        </div>
                    </div>


                </div>
                
            </div>

            <div class="airline_search_page_header_inner2">

                <!-- 탭 시작 -->
                <div class="airline_search_tab">
                    <div class="airline_search_tab_active">왕복</div>
                    <div class="">편도</div>
                    <div class="">다구간</div>
                </div>
                <!-- 탭 종료 -->


                <div class="airline_search">


                    <!-- 왕복 시작 -->
                    <div class="round_trip airline_search_tab_active">
                        <form action="${pageContext.request.contextPath}/FlightController">
							<input type="hidden" name="command" value="airlineRoundtrip1"/>
    
                            <div class="round_trip1">
    
                                <div class="round_trip_departure_airport">
                                    <input type="text" name="round_trip_departure_airport" value="SEL 인천/김포" placeholder="출발지"/>
    
                                    <!-- 출발공항 목록 -->
                                    <!-- search_airport_list_active -->
                                    <div class="search_airport_list">
                                        
    
                                        <div class="search_airport_list1">
                                            <div>최근출발지</div>
                                            <label for="" class="search_airport_list_close">
                                                <div>닫기</div>
                                                <div></div>
                                            </label>
                                        </div>
                                        <!-- search_airport_list1 -->
    
                                        
                                        <div class="search_airport_list2">
                                            <div class="search_airport_recent">
                                                <span>오사카(OSA)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent">
                                                <span>인천(ICN)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent">
                                                <span>김포(GMP)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent_delete">
                                                <span>전체삭제</span>
                                            </div>
                                        </div>
                                        <!-- search_airport_list2 -->
    
                                        
                                        <div class="search_airport_list3">
                                            지역이나 공항명으로 검색 가능합니다.
                                        </div>
                                        <!-- search_airport_list3 -->
    
    
                                        <div class="search_airport_list4">
                                            <!-- search_airport_list4_active -->
                                            <div class="search_airport_list4_left">
                                                <div class="search_airport_list4_active">국내</div>
                                                <div class="">동남아</div>
                                                <div class="">일본</div>
                                                <div class="">중국</div>
                                                <div class="">유럽</div>
                                                <div class="">미주</div>
                                                <div class="">캐나다</div>
                                                <div class="">서남아</div>
                                                <div class="">중남미</div>
                                                <div class="">중동</div>
                                                <div class="">아프리카</div>
                                            </div>
    
                                            <div class="search_airport_list4_right">
                                                <!-- search_airport_list4_active -->
                                                <div class="search_airport_list4_container search_airport_list4_active">
                                                    <div>제주</div>
                                                    <div>부산</div>
                                                    <div>김포</div>
                                                    <div>인천</div>
                                                    <div>광주</div>
                                                    <div>양양</div>
                                                    <div>여수</div>
                                                    <div>포항</div>
                                                    <div>울산</div>
                                                    <div>군산</div>
                                                    <div>원주</div>
                                                    <div>대구</div>
                                                    <div>청주</div> 
                                                    <div>무안</div>
                                                    <div>진주</div>
                                                </div>
    
                                                <div class="search_airport_list4_container ">
                                                    <div>방콕(수완나품)</div>
                                                    <div>방콕(돈므앙)</div>
                                                    <div>대만(타이페이)</div>
                                                    <div>대만(타이페이)(송산)</div>
                                                    <div>다낭</div>
                                                    <div>마닐라</div>
                                                    <div>싱가포르</div>
                                                    <div>세부</div>
                                                    <div>호치민 시티</div>
                                                    <div>푸껫</div>
                                                    <div>하노이</div>
                                                    <div>보라카이</div>
                                                    <div>발리(덴파사르)</div>
                                                    <div>코타키나발루</div>
                                                    <div>클락</div>
                                                    <div>푸꾸옥</div>
                                                    <div>나트랑</div>
                                                    <div>쿠알라룸푸르</div>
                                                    <div>시엠립</div>
                                                    <div>비엔티안</div>
                                                    <div>카우슝</div>
                                                    <div>타이중</div>
                                                    <div>치앙마이</div>
                                                    <div>양곤</div>
                                                    <div>하이퐁</div>
                                                    <div>푸에르토 프린세사</div>
                                                    <div>프놈펜</div>
                                                    <div>자카르타</div>
                                                    <div>보홀</div>
                                                    <div>화련(화롄)</div>
                                                </div>
                                            
    
    
                                                <div class="search_airport_list4_container">
                                                    <div>오사카</div>
                                                    <div>도쿄(나리타)</div>
                                                    <div>후쿠오카</div>
                                                    <div>도쿄(하네다)</div>
                                                    <div>삿포로</div>
                                                    <div>오키나와(나하)</div>
                                                    <div>나고야</div>
                                                    <div>타카마츠</div>
                                                    <div>마츠야마</div>
                                                    <div>히로시마</div>
                                                    <div>시즈오카</div>
                                                    <div>기타큐슈</div>
                                                    <div>센다이</div>
                                                    <div>가고시마</div>
                                                    <div>오이타</div>
                                                    <div>미야코지마(시모지시마 공항)</div>
                                                    <div>쿠마모토</div>
                                                    <div>아오모리</div>
                                                    <div>고마쓰</div>
                                                    <div>고마쓰미야자키</div>
                                                    <div>사가</div>
                                                    <div>니가타</div>
                                                    <div>아사히카와</div>
                                                    <div>요나고</div>
                                                    <div>도아마</div>
                                                    <div>나가사키</div>
                                                    <div>이바라키</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중국</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>유럽</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>미주</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>캐나다</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>서남아</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중남미</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중동</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>아프리카</div>
                                                </div>
    
                                            </div>
    
                                        </div>
                                        <!-- search_airport_list3 -->
    
    
    
    
                                    </div>
                                    <!-- 출발공항 목록 종료-->
    
    
                                </div>
    
                                <div class="round_trip_change"></div>
    
                                <div class="round_trip_arrival_airport">
                                    <input type="text" name="round_trip_arrival_airport" value="NRT 나리타" placeholder="도착지"/>
    
                                    <!-- 도착공항 목록 -->
                                    <!-- search_airport_list_active -->
                                    <div class="search_airport_list">
                                        
    
                                        <div class="search_airport_list1">
                                            <div>최근도착지</div>
                                            <label for="" class="search_airport_list_close">
                                                <div>닫기</div>
                                                <div></div>
                                            </label>
                                        </div>
                                        <!-- search_airport_list1 -->
    
                                        
                                        <div class="search_airport_list2">
                                            <div class="search_airport_recent">
                                                <span>오사카(OSA)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent">
                                                <span>인천(ICN)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent">
                                                <span>김포(GMP)</span>
                                                <span></span>
                                            </div>
                                            <div class="search_airport_recent_delete">
                                                <span>전체삭제</span>
                                            </div>
                                        </div>
                                        <!-- search_airport_list2 -->
    
                                        
                                        <div class="search_airport_list3">
                                            지역이나 공항명으로 검색 가능합니다.
                                        </div>
                                        <!-- search_airport_list3 -->
    
    
                                        <div class="search_airport_list4">
                                            <!-- search_airport_list4_active -->
                                            <div class="search_airport_list4_left">
                                                <div class="search_airport_list4_active">국내</div>
                                                <div class="">동남아</div>
                                                <div class="">일본</div>
                                                <div class="">중국</div>
                                                <div class="">유럽</div>
                                                <div class="">미주</div>
                                                <div class="">캐나다</div>
                                                <div class="">서남아</div>
                                                <div class="">중남미</div>
                                                <div class="">중동</div>
                                                <div class="">아프리카</div>
                                            </div>
    
                                            <div class="search_airport_list4_right">
                                                <!-- search_airport_list4_active -->
                                                <div class="search_airport_list4_container search_airport_list4_active">
                                                    <div>제주</div>
                                                    <div>부산</div>
                                                    <div>김포</div>
                                                    <div>인천</div>
                                                    <div>광주</div>
                                                    <div>양양</div>
                                                    <div>여수</div>
                                                    <div>포항</div>
                                                    <div>울산</div>
                                                    <div>군산</div>
                                                    <div>원주</div>
                                                    <div>대구</div>
                                                    <div>청주</div> 
                                                    <div>무안</div>
                                                    <div>진주</div>
                                                </div>
    
                                                <div class="search_airport_list4_container ">
                                                    <div>방콕(수완나품)</div>
                                                    <div>방콕(돈므앙)</div>
                                                    <div>대만(타이페이)</div>
                                                    <div>대만(타이페이)(송산)</div>
                                                    <div>다낭</div>
                                                    <div>마닐라</div>
                                                    <div>싱가포르</div>
                                                    <div>세부</div>
                                                    <div>호치민 시티</div>
                                                    <div>푸껫</div>
                                                    <div>하노이</div>
                                                    <div>보라카이</div>
                                                    <div>발리(덴파사르)</div>
                                                    <div>코타키나발루</div>
                                                    <div>클락</div>
                                                    <div>푸꾸옥</div>
                                                    <div>나트랑</div>
                                                    <div>쿠알라룸푸르</div>
                                                    <div>시엠립</div>
                                                    <div>비엔티안</div>
                                                    <div>카우슝</div>
                                                    <div>타이중</div>
                                                    <div>치앙마이</div>
                                                    <div>양곤</div>
                                                    <div>하이퐁</div>
                                                    <div>푸에르토 프린세사</div>
                                                    <div>프놈펜</div>
                                                    <div>자카르타</div>
                                                    <div>보홀</div>
                                                    <div>화련(화롄)</div>
                                                </div>
                                            
    
    
                                                <div class="search_airport_list4_container">
                                                    <div>오사카</div>
                                                    <div>도쿄(나리타)</div>
                                                    <div>후쿠오카</div>
                                                    <div>도쿄(하네다)</div>
                                                    <div>삿포로</div>
                                                    <div>오키나와(나하)</div>
                                                    <div>나고야</div>
                                                    <div>타카마츠</div>
                                                    <div>마츠야마</div>
                                                    <div>히로시마</div>
                                                    <div>시즈오카</div>
                                                    <div>기타큐슈</div>
                                                    <div>센다이</div>
                                                    <div>가고시마</div>
                                                    <div>오이타</div>
                                                    <div>미야코지마(시모지시마 공항)</div>
                                                    <div>쿠마모토</div>
                                                    <div>아오모리</div>
                                                    <div>고마쓰</div>
                                                    <div>고마쓰미야자키</div>
                                                    <div>사가</div>
                                                    <div>니가타</div>
                                                    <div>아사히카와</div>
                                                    <div>요나고</div>
                                                    <div>도아마</div>
                                                    <div>나가사키</div>
                                                    <div>이바라키</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중국</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>유럽</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>미주</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>캐나다</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>서남아</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중남미</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>중동</div>
                                                </div>
    
                                                <div class="search_airport_list4_container">
                                                    <div>아프리카</div>
                                                </div>
    
                                            </div>
    
                                        </div>
                                        <!-- search_airport_list3 -->
    
    
    
    
                                    </div>
                                    <!-- 도착공항 목록 종료-->
    
                                </div>
    
                                <div class="round_trip_direct_flight">
                                    직항
                                    <input type="checkbox" name="round_trip_direct"/>
                                </div>
    
                            </div>
                            <!-- round_trip1 종료 -->
    
                            <div class="round_trip2">
    
                                <div class="round_trip2_left">
                                    <div class="round_trip_departure_date">
                                        <input type="text" name="round_trip_departure_date_calender" placeholder="출발일" readonly/>
                                        <div class="round_trip_calender_select">
                                            날짜 선택완료
                                        </div>
                                    </div>
                                    <div class="round_trip_arrival_date">
                                        <input type="text" name="round_trip_arrival_date_calender" placeholder="도착일" readonly/>
                                    </div>
                                </div>
    
                                <div class="round_trip2_right">
                                    <input type="text" name="round_trip_member" placeholder="" readonly/>
    
                                    <div class="round_trip_member">
    
                                        <div class="round_trip_member1">
                                            인원
                                        </div>
    
                                        <div class="round_trip_member2">
                                            <div class="round_trip_member_adult">
                                                <div>성인</div>
                                                <div>
                                                    <div></div>
                                                    <div class="round_trip_member_adult_number">1</div>
                                                    <div></div>
                                                </div>
                                            </div>
                                            <div class="round_trip_member_child">
                                                <div>소아</div>
                                                <div>
                                                    <div></div>
                                                    <div class="round_trip_member_child_number">0</div>
                                                    <div></div>
                                                </div>
                                            </div>
                                            <div class="round_trip_member_infant">
                                                <div>유아</div>
                                                <div>
                                                    <div></div>
                                                    <div class="round_trip_member_infant_number">0</div>
                                                    <div></div>
                                                </div>
                                            </div>
                                        </div>
    
                                        <div class="round_trip_member3">
                                            좌석 등급
                                        </div>
    
                                        <div class="round_trip_member4">
                                            <div>
                                                <label for="" class="round_trip_seat_class_active">
                                                    <div></div>
                                                    <div>일반석</div>
                                                    <input type="radio" name="round_trip_seat_class" value="economy" checked/>
                                                </label>
                                            </div>
                                            <div>
                                                <label for="">
                                                    <div></div>
                                                    <div>프레스티지석</div>
                                                    <input type="radio" name="round_trip_seat_class" value="prestige"/>
                                                </label>
                                            </div>
                                           
                                        </div>
    
                                        <div class="round_trip_member5">
                                            <div class="round_trip_member_select">
                                                선택완료
                                            </div>
                                        </div>
    
                                    </div>
                                    <!-- round_trip_member -->
    
    
                                </div>
    
                                <div class="round_trip_submit">
                                    항공권 검색
                                </div>
    
    
                            </div>
                            <!-- round_trip2 종료 -->
    
                        </form>
                    </div>
                    <!-- 왕복 종료 -->
    
    
                    <!-- 편도 시작 -->
                    <div class="one_way ">
                        <form action="">
    
    
                            편도
    
    
                        </form>
                    </div>
                    <!-- 편도 종료 -->
                    
    
                    <!-- 다구간 시작 -->
                    <div class="multi_city ">
                        <form action="">
    
    
                            다구간
                    
    
                        </form>
                    </div>
                    <!-- 다구간 종료 -->
    
    
    
    
                </div>
                <!-- airline_search 종료 -->

            </div>
            <!-- airline_search_page_header_inner2 -->
        </div>



    </div>



    <div class="airline_search_page_body">
        <div class="airline_search_page_body_inner">

            <div class="airline_search_page_body_left">

                <div class="airline_search_page_body_left_top">

                    <div>
                        <div>결과 내 검색</div>
                        <div class="airline_filter_clear">
                            <div>초기화</div>
                        </div>
                    </div>

                    <div class="airline_filter_open_all">모두펼침</div>

                </div>



                <div class="airline_search_page_body_left_bottom">
                    
                    <div class="airline_filter">
                        <div>
                            <div>직항/경유</div>
                            <div></div>
                        </div>
                        <div class="">
                            <div>1</div>
                            <div>2</div>
                            <div>3</div>
                        </div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>항공사</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>가격</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>
                    
                    <div class="airline_filter">
                        <div>
                            <div>무료 수하물</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>가는편 출발 시간대</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>총 소요시간</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>결제조건</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>공동운항</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>요금조건</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>항공권 종류</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                    <div class="airline_filter">
                        <div>
                            <div>좌석상태</div>
                            <div></div>
                        </div>
                        <div>컨텐츠1</div>
                    </div>

                </div>

            </div>
            <!-- airline_search_page_body_left 종료 -->


            <div class="airline_search_page_body_right">

                <div class="airline_search_page_body_right_top">
                    <span class="airline_filter_list1">
                        <span>
                            <!-- 필터 이미지 -->
                        </span>
                        <span>필터</span>
                        <span>
                            <!-- 필터 개수 -->
                        </span>
                    </span>
                    <span class="airline_filter_list2">
                        <span>직항</span>
                        <span>대한항공</span>
                        <span>아시아나항공</span>
                        <span>예약가능</span>
                    </span>
                    <span class="airline_filter_list3">
                        필터초기화
                    </span>
                </div>



                <!-- selected_airline_ticket_container  시작 -->
				<c:forEach var="aDto" items="${selectedTicketList}"><
				
	                <div class="selected_airline_ticket_container">
	
	                    <div class="selected_airline_ticket ">
	
	                        <div class="selected_airline_ticket_header">
	                            <div></div>
	                            <div>${aDto.departureTimeDate} </div>
	                        </div>
	
	                        <div class="selected_airline_ticket_inner">
	
	                            <div class="selected_airline_ticket1">
	                                <div class="airline_ticket_airline">
	                                    <div>
	                                        <img src="https://image.hanatour.com/usr/static/img/airline/${aDto.airlineIata}.png" alt="">
	                                    </div>
	                                    <div>${aDto.airlineName }</div>
	                                </div>
	                            </div>
	                            <div class="selected_airline_ticket2">
	                                <div class="airline_ticket_flight_number">
	                                    <span>${aDto.flightNumber}&#44;</span>
	                                    <span>
	                                    	<c:if test="${aDto.freeBaggage eq 'T' }">수하물포함</c:if>
	                                    	<c:if test="${aDto.freeBaggage eq 'F' }">수하물미포함</c:if>
	                                    </span>
	                                </div>
	                                <div class="airline_ticket_codeshare">
	                                    <span>
	                                    	<c:if test="${aDto.codeShare eq 'T' }">공동운항</c:if>
	                                    	<c:if test="${aDto.codeShare eq 'F' }"></c:if>
	                                    </span>
	                                    <span class="airline_ticket_codeshare_mark"></span>
	                                    <div class="airline_ticket_codeshare_hover">
	                                        <span>실제탑승&#58;</span>
	                                        <span>${aDto.codeShareAirline}</span>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="selected_airline_ticket3">
	                                <div class="airline_ticket_time">
	                                    <div>${aDto.departureTimeHour }</div>
	                                    <div>${aDto.departureIata }</div>
	                                </div>
	                                <div class="airline_ticket_stop">
	                                    <div>${aDto.flyingTime }</div>
	                                    <div class="airline_ticket_stop_line"></div>
	                                    <div>
	                                    	<c:if test="${aDto.stop eq 0}">직항</c:if>
	                                    	<c:if test="${aDto.stop ne 0}">경유${aDto.stop}회</c:if>
	                                    </div>
	                                </div>
	                                <div class="airline_ticket_time">
	                                    <div>${aDto.arrivalTimeHour }</div>
	                                    <div>${aDto.arrivalIata }</div>
	                                </div>
	                            </div>
	                            <div class="selected_airline_ticket4">
	                                <div class="airline_ticket_detail_schedule">
	                                    상세일정 보기
	                                    <div></div>
	                                </div>
	                            </div>
	                            <div class="selected_airline_ticket5">
	                                <a href="#">
	                                    <div class="airline_ticket_select_btn">
	                                        변경
	                                    </div>
	                                    <div>
	                                        <span>잔여</span>
	                                        <span>${aDto.leftSeats}</span>
	                                        <span>석</span>
	                                    </div>
	                                </a>
	                            </div>
	
	                        </div>
	                    </div>
	                 </div>   
	                    <!-- selected_airline_ticket -->
               
                </c:forEach>
                <!-- selected_airline_ticket_container 종료 -->





                <div class="airline_search_page_body_right_middle">
                    <div>
                        <div>오는 항공편 선택</div>
                        <div>
                            <span>${roundTripDepartureDate}</span>
                            &nbsp;
                            <span>${roundTripDepartureCity}(${roundTripDepartureIata})</span>
                            <span>→</span>
                            <span>${roundTripArrivalCity}(${roundTripArrivalIata})</span>
                        </div>
                    </div>
                    <div>성인 1인 왕복요금입니다</div>
                </div>

                <div class="airline_search_page_body_right_middle2">
                    <div>
                        <span>총</span>
                        <span>${ticketList.size()}</span>
                        <span>개</span>
                    </div>
                    <div class="airline_ticket_order">
                        <span class="airline_ticket_order_active">추천순</span>
                        <span>가격낮은순</span>
                        <span>소요시간적은순</span>
                        <span>출발시간빠른순</span>
                    </div>
                </div>


                <div class="airline_ticket_container">
                
                
                

					<!-- Dto 반복문 시작 -->
					<c:forEach var="aDto" items="${ticketList}">
						<!-- ${aDto.ticketIdx } -->
							
												
						<!-- 티켓0 -->
                        <div class="airline_ticket">
					
                            <div class="airline_ticket_inner">
								<input type="hidden" name="airline_ticket_id" value="${aDto.ticketIdx}"/>
                                <div class="airline_ticket1">
                                    <div class="airline_ticket_airline">
                                        <div>
                                            <img src="https://image.hanatour.com/usr/static/img/airline/${aDto.airlineIata}.png" alt="">
                                        </div>
                                        <div>${aDto.airlineName}</div>
                                    </div>
                                     <div class="airline_ticket_flight_number">
                                        <span>${aDto.flightNumber}&#44;</span>
                                        <span>
                                        	<c:if test="${aDto.freeBaggage == 'T'}">수하물포함</c:if>
                                        	<c:if test="${aDto.freeBaggage == 'F'}">수하물미포함</c:if>
                                        </span>
                                    </div>
                                    <div class="airline_ticket_codeshare">
                                        <span>
                                        	<c:if test="${aDto.codeShare == 'T'}">공동운항</c:if>
                                        	<c:if test="${aDto.codeShare == 'F'}"></c:if>
                                        </span>
                                        <span class="airline_ticket_codeshare_mark"></span>
                                        <div class="airline_ticket_codeshare_hover">
                                            <span>실제탑승&#58;</span>
                                            <span>${aDto.codeShareAirline}</span>
                                        </div>
                                    </div>
                                    <div class="airline_ticket_detail_schedule">
                                        상세일정 보기
                                        <div></div>
                                    </div>
                                </div>


                                <div class="airline_ticket2">
                                    <div class="airline_ticket_time">
                                        <div>
                                        	${aDto.departureTimeHour}
                                        </div>
                                        <div>${aDto.departureIata}</div>
                                    </div>
                                    <div class="airline_ticket_stop">
                                        <div>${aDto.flyingTime}</div>
                                        <div class="airline_ticket_stop_line"></div>
                                        <div>
                                        	<c:if test="${aDto.stop == 0}">직항</c:if>
                                        	<c:if test="${aDto.stop != 0}">경유 ${aDto.stop}회</c:if>
                                        </div>
                                    </div>
                                    <div class="airline_ticket_time">
                                        <div>
                                        	${aDto.arrivalTimeHour}
                                        </div>
                                        <div>${aDto.arrivalIata}</div>
                                    </div>
                                </div>

                                <div class="airline_ticket3">
                                    <div>
                                        <span>
                                        	<c:if test="${requestScope.roundTripSeatClass eq '일반석' }">
                                       			<fmt:formatNumber value="${aDto.economyClassPrice}" type="number" groupingUsed="true"/>
                                        	</c:if>
                                        	<c:if test="${requestScope.roundTripSeatClass eq '프레스티지석' }">
	                                        	<fmt:formatNumber value="${aDto.prestigeClassPrice}" type="number" groupingUsed="true"/>
                                        	</c:if>
                                        </span>
                                        <span>원~</span>
                                    </div>
                                    <div>
                                        <span>성인</span>
                                        <span>1인</span>
                                    </div>
                                </div>


                                <div class="airline_ticket4">
                                    <a href="#">
                                        <div class="airline_ticket_select_btn">
                                            선택
                                        </div>
                                        <div>
                                            <span>잔여</span>
                                            <span>${aDto.leftSeats}</span>
                                            <span>석</span>
                                        </div>
                                    </a>
                                </div>


                            </div>
                            <!-- airline_ticket_inner 종료 -->
                        </div>
						<!-- 티켓0 -->
						 
					
						
					</c:forEach>
					<!-- Dto 반복문 종료 --> 
							
                </div>
                <!-- airline_ticket_container 종료 -->







                            
                <div class="
                    airline_ticket_select_result">
                    <div class="airline_ticket_select_result_info">
                        <div class="airline_ticket_select_result_info_top">
                            <div>성인1,소아1,유아1(일반석)</div>
                            <div>
                                <div>총 예상금액(왕복)</div>
                                <div>
                                    <span>848,800</span>
                                    <span>원</span>
                                    <span></span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="airline_ticket_select_result_info_line"></div>

                        <div class="airline_ticket_select_result_bottom">
                            <div>
                                <div>&nbsp;유류할증료, 제세공과금, 발권대행 수수료 포함(변동가능)</div>
                                <div>
                                    <span>&nbsp;예약변경 및 환불 수수료는 별도</span>
                                    <span>이며, 상세내용은 요금/환불 규정을 확인바랍니다.</span>
                                </div>
                            </div>
                            <div>
                                <div class="airline_ticket_select_result_bottom_btn">
                                    요금/환불 규정
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="airline_ticket_select_result_btn">
                        <div>공유하기</div>
                        <div>일정 상세보기</div>
                        <div>예약하기</div>
                    </div>
                </div>




            </div>
            <!-- airline_search_page_body_right 종료 -->


        </div>
        <!-- airline_search_page_body_inner 종료 -->
    </div>
  















    <div class="airline_ticket_detail_schedule_popup">
        <div class="airline_ticket_detail_schedule_popup_inner">

            <div class="airline_ticket_detail_schedule_popup1">
                <div>항공 상세일정</div>
                <div><!-- 끄기 버튼 --></div>
            </div>

            <div class="airline_ticket_detail_schedule_popup2">
                <div class="airline_ticket_detail_schedule_popup2_left">
                    <div class="airline_ticket_detail_schedule_popup2_local">
                        <div>서울 (ICN)</div>
                        <div><!-- 이미지 --></div>
                        <div>도쿄 (NRT)</div>
                    </div>
                    <div class="airline_ticket_detail_schedule_popup2_stop">
                        <div>2시간 25분 소요</div>
                        <div>직항</div>
                    </div>
                </div>
                <div class="airline_ticket_detail_schedule_popup2_right">
                    예약가능7석
                </div>
            </div>
            
            <div class="airline_ticket_detail_schedule_popup3">
                <div>2024.09.12&nbsp;(목)&nbsp;14:45</div>
                <div>
                    <div>예약가능</div>
                    <div>요금확정</div>
                </div>
            </div>

            <div class="airline_ticket_detail_schedule_popup4">
                <div class="airline_ticket_detail_schedule_popup4_date">
                    <div>09/12 (목)</div>
                    <div>09/12 (목)</div>
                </div>
                <div class="airline_ticket_detail_schedule_popup4_line">
                    <!-- 파란선 -->
                </div>
                <div class="airline_ticket_detail_schedule_popup4_time">
                    <div>14:45</div>
                    <div>2시간 25분 비행</div>
                    <div>17:10</div>
                </div>
                <div class="airline_ticket_detail_schedule_popup4_airport">
                    <div>
                        <span>서울 (ICN) 출발</span>
                        <span>인천 국제공항&nbsp;&ndash;&nbsp;터미널 2</span>
                    </div>
                    <div>
                        <span>대한항공 KE5743(공동운항)</span>
                        <span>진에어(실제운항)</span>
                    </div>
                    <div>
                        <span>일반석</span>
                        <span>위탁수하물 포함(1개)</span>
                    </div>
                    <div>
                        <span>도쿄(NRT) 도착</span>
                        <span>나리타 국제공항&nbsp;&ndash;&nbsp;터미널 1</span>
                    </div>
                </div>
            </div>


            <div class="airline_ticket_detail_schedule_popup5">
                예약변경 및 환불 수수료는 별도이며, 상세내용은 요금/환불 규정을 확인바랍니다.
            </div>



        </div>
        <!-- airline_ticket_detail_schedule_popup_inner 종료 -->
    </div>
    <!-- airline_ticket_detail_schedule_popup 종료 -->

	<form action="${pageContext.request.contextPath}/FlightController" class="round_trip_select1">
		<input type="hidden" name="command" value="airlineRoundtrip3"/>
	
		<input type="hidden" name="roundtrip_departure_iata" value="${roundTripDepartureIata}"/>
		<input type="hidden" name="roundtrip_departure_city" value="${roundTripDepartureCity}"/>
		<input type="hidden" name="roundtrip_departure_date" value="${roundTripDepartureDate}"/>
		
		<input type="hidden" name="roundtrip_arrival_iata" value="${roundTripArrivalIata}"/>
		<input type="hidden" name="roundtrip_arrival_city" value="${roundTripArrivalCity}"/>
		<input type="hidden" name="roundtrip_arrival_date" value="${roundTripArrivalDate}"/>
	
		<input type="hidden" name="roundtrip_adult" value="${roundTripAdult}"/>
		<input type="hidden" name="roundtrip_child" value="${roundTripChild}"/>
		<input type="hidden" name="roundtrip_infant" value="${roundTripInfant}"/>
		
		<input type="hidden" name="roundtrip_direct_flight" value="${roundTripDirectFlight}"/>
		<input type="hidden" name="roundtrip_seat_class" value="${roundTripSeatClass}"/>
		
		<!--  출발지 -> 도착지, 도착지 -> 출발지 -->
		<input type="hidden" name="roundtrip_airline_ticket1" value="${selectedroundTripAirlineTikcetList[0]}"/>
		<input type="hidden" name="roundtrip_airline_ticket2" value=""/>
	</form>
	
	
	
	
	





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


<!-- 달력 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/lightpick.js"></script>

<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main5_round_trip2.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/scriptt/footer.js"></script>
</html>