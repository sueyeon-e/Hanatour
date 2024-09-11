<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나투어 : 꿈꾸는 대로, 펼쳐지다</title>
    <!-- bsxlider css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/lightpick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main_type.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main5_1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
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
    





    <div class="type1">

        <div class="bxslider">
            <div>
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type1_img1.jpg"/>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type1_img2.jpg"/>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type1_img3.jpg"/>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type1_img4.jpg"/>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type1_img5.jpg"/>
            </div>
        </div>

        <div class="type1_inner">
            

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
							
							<div class="weather_info">
								날씨정보 확인
								<div class="weather_info_list">
									<input type="text" name="weather_iata" placeholder="공항코드 입력"/>
									<button class="weather_iata" type="button">검색</button>
									<button class="weather_info_close" type="button">닫기</button>
									<table>
									
										<thead>
											<tr>
												<th>공항코드</th>
												<th>시간</th>
												<th>날씨</th>
												<th>기온</th>
												<th>기압</th>
												<th>습도</th>
												<th>구름량</th>
												<th>풍속</th>
												<th>강수량</th>
												<th>적설량</th>
												<th>도시</th>
												<th>국가</th>
												<th>시간대</th>
												<th>일출시간</th>
												<th>일몰시간</th>
												<th>날씨 아이콘</th>
											</tr>
										</thead>
										
										<tbody>
										
											<!-- 반복문 시작 -->
											<c:forEach var="wDto" items="${requestScope.weatherList}">
												<tr>
													<td>${wDto.iata}</td>
													<td>${wDto.weatherDate}</td>
													<td>${wDto.weather}</td>
													<td>${wDto.temp}</td>
													<td>${wDto.pressure}</td>
													<td>${wDto.humidity}</td>
													<td>${wDto.clouds}</td>
													<td>${wDto.wind}</td>
													<td>${wDto.rain}</td>
													<td>${wDto.snow}</td>
													<td>${wDto.city}</td>
													<td>${wDto.country}</td>
													<td>${wDto.timeZone}</td>
													<td>${wDto.sunRise}</td>
													<td>${wDto.sunSet}</td>
													<td>
														<img src="${wDto.iconUrl}"/>
													</td>
												</tr>
											</c:forEach>
											<!-- 반복문 종료 -->
										</tbody>
																			
									</table>
									
									
								</div>
							</div>
                        </div>
                        <!-- round_trip1 종료 -->

                        <div class="round_trip2">

                            <div class="round_trip2_left">
                                <div class="round_trip_departure_date">
                                    <input type="text" name="round_trip_departure_date_calender" value="2024.10.08" placeholder="출발일" readonly/>
                                    <div class="round_trip_calender_select">
                                        날짜 선택완료
                                    </div>
                                </div>
                                <div class="round_trip_arrival_date">
                                    <input type="text" name="round_trip_arrival_date_calender" value="2024.10.17"  placeholder="도착일" readonly/>
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
        <!-- type1_inner 종료 -->


    </div>
    <!-- type1 종료 -->





    <div class="type6">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type6_img1.jpg" alt="">
            </div>
        </div>
    </div>





    <div class="type3">
        <div class="type3_inner">
            <div class="type3_background_img">
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_background_img.jpg" alt="">
            </div>

            <div class="type3_contents">
                <div class="type3_contents_left fl">
                    <div class="type3_title">
                        인기도시<br/>항공 특가✈️
                    </div> 

                    <div class="type3_tab">

                        <div class="type3_tab_active">
                            단거리 특가 🔥
                            <div class="type3_type8_container">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img1.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            하나투어 좌석 확보
                                        </div>
                                        <div class="type8_title">
                                            인천↔세부 땡처리 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 6월 9일 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    169,000
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img2.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            하나투어 좌석 확보
                                        </div>
                                        <div class="type8_title">
                                            인천↔사이판 땡처리 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 6~7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    230,000
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img3.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            하나투어 좌석 확보 
                                        </div>
                                        <div class="type8_title">
                                            인천↔오사카 땡처리 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 6월 11일 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    1,450,700
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </div>

                        <div class="">
                            장거리 특가 🔥
                            <div class="type3_type8_container ">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img4.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            하나투어 좌석 확보
                                        </div>
                                        <div class="type8_title">
                                            인천↔싱가포르 땡처리 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 6~7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    340,600
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img5.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            하나투어 좌석 확보
                                        </div>
                                        <div class="type8_title">
                                            인천↔시드니 땡처리 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 6~8월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    850,000
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img6.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            아시아나항공 특가
                                        </div>
                                        <div class="type8_title">
                                            인천↔아테네 땡처리 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            🗓️ 5~6월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    1,080,000
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            동남아 특가
                            <div class="type3_type8_container ">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img7.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            방콕을 즐기기 가장 좋은 계절
                                        </div>
                                        <div class="type8_title">
                                            인천↔방콕 왕복 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    300,700
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img8.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            깊게 빠져드는 다낭의 매력
                                        </div>
                                        <div class="type8_title">
                                            인천↔다낭 왕복 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 6월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    251,900
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img9.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            휴양지 속 힐링
                                        </div>
                                        <div class="type8_title">
                                            인천↔세부 왕복 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    263,600
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            
                        </div>

                        <div class="">
                            유럽&미주 특가
                            <div class="type3_type8_container ">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img10.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            영원한 버킷리스트,하와이
                                        </div>
                                        <div class="type8_title">
                                            인천↔호놀룰루 왕복 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 9월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    1,159,100
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img11.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            꿈꾸던 LA 여행을 떠날 시간
                                        </div>
                                        <div class="type8_title">
                                            인천↔LA 왕복 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 9월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    708,700
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img12.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            보기 드문 얼리버드 특가
                                        </div>
                                        <div class="type8_title">
                                            인천↔파리 왕복 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    1,067,816
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            일본 특가
                            <div class="type3_type8_container ">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img13.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            떠날수록 빠져드는 오사카의 매력
                                        </div>
                                        <div class="type8_title">
                                            인천↔오사카 왕복 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 6월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    205,700
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img14.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            미리 준비하는 도쿄의 벚꽃
                                        </div>
                                        <div class="type8_title">
                                            인천↔도쿄 왕복 항공권 
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    262,300
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type3_type8_container_img15.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            부담없이 떠나는 일본 여행지
                                        </div>
                                        <div class="type8_title">
                                            인천↔후쿠오카 왕복 항공권
                                        </div>
                                        <div class="type8_bottom_tag">
                                            📆 7월 출발
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    122,800
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- type3_tab 종료 -->

                </div>
                <!-- type3_contents_left 종료 -->

            </div>
        </div>
    </div>




    
    <div class="type6">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type6_img0.jpg" alt="">
            </div>
        </div>
    </div>





    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    항공사 추천 특가✈️
            </div>
        </div>
    </div>

    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img1.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        MD 추천 특가
                    </div>
                    <div class="type8_title">
                        인천 ↔ 로스앤젤레스 왕복 항공권 
                    </div>
                    <div class="type8_bottom_tag">
                        아시아나항공 특가 
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,450,700
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img2.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        MD 추천 특가
                    </div>
                    <div class="type8_title">
                        인천 ↔ 몬트리올 왕복 항공권 
                    </div>
                    <div class="type8_bottom_tag">
                        에어캐나다 특가 
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,391,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img3.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        MD 추천 특가
                    </div>
                    <div class="type8_title">
                        인천 ↔ 마카오 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        진에어 특가
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                223,200
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img4.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        MD 추천 특가
                    </div>
                    <div class="type8_title">
                        인천 ↔ 오사카 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        제주항공 특가
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                237,200
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

           

        </div>
    </div>
     
    



    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                요즘 여행의 발견 ✨ 항공 특가
            </div>
        </div>
    </div>

    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img5.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        PICK! 추천 특가
                    </div>
                    <div class="type8_title">
                        인천↔시드니 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        💳카드사별 할인 🌃 아름다운 야경
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                801,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img6.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        PICK! 추천 특가 
                    </div>
                    <div class="type8_title">
                        인천↔나트랑 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        💳카드사별 할인 🏖️ 요즘 가장 핫한 여행지
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                261,700
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img7.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        PICK! 추천 특가
                    </div>
                    <div class="type8_title">
                        인천↔괌 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        💳카드사별 할인 🛍️ 관광과 쇼핑의 천국
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                380,600
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img8.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        PICK! 추천 특가
                    </div>
                    <div class="type8_title">
                        인천↔보홀 왕복 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        💳카드사별 할인🌊 인생 액티비티
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                305,200
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

           

        </div>
    </div>





    <div class="type6">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type6_img2.jpg" alt="">
            </div>
        </div>
    </div>





    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                이 주의 국내 항공사 특가  🛫
            </div>
        </div>
    </div>

    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img9.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        에어부산 특가 ✈️
                    </div>
                    <div class="type8_title">
                        김포 → 제주 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        6월 18일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                20,550
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img10.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        에어부산 특가 ✈️ 
                    </div>
                    <div class="type8_title">
                        부산 → 제주 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        6월 18일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                27,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img11.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        에어부산 특가 ✈️
                    </div>
                    <div class="type8_title">
                        김포 → 부산 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        6월 19일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                40,860
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img12.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        에어부산 특가 ✈️
                    </div>
                    <div class="type8_title">
                        제주 → 김포 항공권
                    </div>
                    <div class="type8_bottom_tag">
                        6월 19일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                26,760
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

           

        </div>
    </div>
        
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                Hot Pick 국내 항공 특가  🔥
            </div>
        </div>
    </div>

    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img13.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        국내 MD추천
                    </div>
                    <div class="type8_title">
                        김포 → 제주 
                    </div>
                    <div class="type8_bottom_tag">
                        6월 25일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                22,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img14.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        국내 MD추천
                    </div>
                    <div class="type8_title">
                        김포 → 부산
                    </div>
                    <div class="type8_bottom_tag">
                        6월 26일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                33,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img15.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        국내 MD추천
                    </div>
                    <div class="type8_title">
                        김포 → 여수
                    </div>
                    <div class="type8_bottom_tag">
                        6월 26일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                58,100
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline/type8_img16.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        국내 MD추천
                    </div>
                    <div class="type8_title">
                        부산 → 제주
                    </div>
                    <div class="type8_bottom_tag">
                        6월 26일 출발
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                27,700
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

           

        </div>
    </div>
        
	
	
	
	
	<form action="${pageContext.request.contextPath}/FlightController">
		<input type="hidden" name="command" value="airportWeather"/>
		<input type="hidden" name="weather_iata_real"/>
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
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<!-- 달력 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/lightpick.js"></script>

<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main_type.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main5_airline.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>


</html>
