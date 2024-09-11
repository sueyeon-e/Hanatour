<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나투어 : 꿈꾸는 대로, 펼쳐지다</title>
    <!-- bsxlider css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main_type.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_1.css">
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
	



    <div class="main1_type1">
        <div class="main1_type1_inner">
            <!-- 이미지 -->
            <div class="main1_type1_search">
                <div class="main1_type1_search_top">
                    고객님,<br> <strong>어떤 여행을 꿈꾸시나요?</strong>
                </div>
                <div class="main1_type1_search_bottom">

                    <div class="main1_type1_search_tab">
                        <div class="main1_type1_search_tab_active">패키지</div>
                        <div class="">항공</div>
                        <div class="">호텔</div>
                    </div>




                    <div class="main1_type1_search_setting ">


                        <!-- 패키지 -->
                        <!-- main1_type1_search_tab_active -->
                        <div class="
                            main1_type1_search_tour 
                            main1_type1_search_tab_active
                            
                        ">
                            <form action="#">
                                <!-- main1_type1_search_tour1_input_empty -->
                                <div class="
                                    main1_type1_search_tour1
                                ">
                                    <input type="text" name="search_tour_arrival" placeholder="어디로 떠나세요?"/>
                                </div>

                                <div class="main1_type1_search_tour2">
                                    <select name="search_tour_departure" id="">
                                        <option value="default">출발지 전체</option>
                                        <option value="">인천/김포</option>
                                        <option value="">부산</option>
                                        <option value="">대구</option>
                                        <option value="">청주</option>
                                        <option value="">광주(무안)</option>
                                        <option value="">제주</option>
                                        <option value="">양양</option>
                                    </select>
                                </div>

                                <div class="main1_type1_search_tour3">
                                    <input type="text" name="search_tour_date" placeholder="여행시작일 선택" readonly/>
                                    <div class="main1_type1_search_tour3_calender">
                                        달력자리
                                    </div>
                                </div>

                                <div class="main1_type1_search_tour4">
                                    <!-- main1_type1_search_tour4_active -->
                                    <label for="" class="">
                                        <div>
                                            <span></span>
                                            <span>항공권은<br/>있어요</span>
                                        </div>
                                        <input type="checkbox" name="search_tour_option1"/>
                                    </label>
                                    <!-- main1_type1_search_tour4_active -->
                                    <label for="" class="">
                                        <div>
                                            <span></span>
                                            <span>우리끼리만<br/>여행할래요</span>
                                        </div>
                                        <input type="checkbox" name="search_tour_option2"/>
                                    </label>
                                </div>

                                <div class="main1_type1_search_tour5">
                                    패키지 검색
                                </div>

                            </form>
                        </div>






                        <!-- 항공 -->
                        <div class="
                            main1_type1_search_airline
                            
                        ">
                            <div class="main1_type1_search_airline_tab">
                                <div class="main1_type1_search_airline_active">왕복</div>
                                <div class="">편도</div>
                                <div class="">다구간</div>
                            </div>

                            <div class="main1_type1_search_airline_search_setting">

                                <!-- main1_type1_search_airline_active -->
                                <div class="
                                    main1_type1_search_airline_round_trip
                                    main1_type1_search_airline_active
                                ">
                                    <form action="">

                                        <div class="main1_type1_search_airline_round_trip1">
                                            <div>
                                                <input type="text" name="search_airline_round_trip_departure"/>
                                            </div>
                                            <div>
                                                <span></span>
                                            </div>
                                            <div>
                                                <input type="text" name="search_airline_round_trip_arrival" placeholder="도착지"/>
                                            </div>
                                        </div>

                                        <div class="main1_type1_search_airline_round_trip_submit_fail">
                                            도착지를 선택해주세요.
                                        </div>

                                        <div class="main1_type1_search_airline_round_trip2">
                                            <div>
                                                <input type="text" name="search_airline_round_trip_departure_date" readonly/>
                                            </div>
                                            
                                            <div>
                                                <input type="text" name="search_airline_round_trip_arrival_date" readonly/>
                                            </div>
                                            <div class="main1_type1_search_airline_round_trip2_calender">
                                                달력자리
                                            </div>
                                        </div>

                                        <div class="main1_type1_search_airline_round_trip3">
                                            <div>
                                                <input type="text" name="search_airline_round_trip_member" readonly/>
                                            </div>
                                            <!-- round_trip_direct_active -->
                                            <div class="">
                                                직항
                                                <input type="checkbox" name="search_airline_round_trip_direct"/>
                                            </div>


                                            <div class="search_airline_round_trip_member">

                                                <div class="search_airline_round_trip_member1">
                                                    인원
                                                </div>

                                                <div class="search_airline_round_trip_member2">
                                                    <div class="search_airline_round_trip_member_adult">
                                                        <div>성인</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_round_trip_member_adult_number">1</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                    <div class="search_airline_round_trip_member_child">
                                                        <div>소아</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_round_trip_member_child_number">0</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                    <div class="search_airline_round_trip_member_infant">
                                                        <div>유아</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_round_trip_member_infant_number">0</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="search_airline_round_trip_member3">
                                                    좌석 등급
                                                </div>

                                                <div class="search_airline_round_trip_member4">
                                                    <div>
                                                        <label for="" class="search_airline_round_trip_seat_class_active">
                                                            <div></div>
                                                            <div>일반석</div>
                                                            <input type="radio" name="search_airline_round_trip_seat_class" value="economy" checked/>
                                                        </label>
                                                    </div>
                                                    <div>
                                                        <label for="">
                                                            <div></div>
                                                            <div>프레스티지석</div>
                                                            <input type="radio" name="search_airline_round_trip_seat_class" value="prestige"/>
                                                        </label>
                                                    </div>
                                                   
                                                </div>

                                                <div class="search_airline_round_trip_member5">
                                                    <div class="search_airline_round_trip_member_select">
                                                        선택완료
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- search_airline_round_trip_member -->

                                        </div>

                                        <div class="main1_type1_search_airline_round_trip4">
                                            항공권 검색
                                        </div>

                                    </form>

                                </div>
                                <!-- main1_type1_search_airline_round_trip 종료 -->



                                <div class="
                                    main1_type1_search_airline_one_way
                                ">
                                    <form action="">

                                        <div class="main1_type1_search_airline_one_way1">
                                            <div>
                                                <input type="text" name="search_airline_one_way_departure"/>
                                            </div>
                                            <div>
                                                <span></span>
                                            </div>
                                            <div>
                                                <input type="text" name="search_airline_one_way_arrival" placeholder="도착지"/>
                                            </div>
                                        </div>

                                        <div class="main1_type1_search_airline_one_way_submit_fail">
                                            도착지를 선택해주세요.
                                        </div>

                                        <div class="main1_type1_search_airline_one_way2">
                                            <div>
                                                <input type="text" name="search_airline_one_way_departure_date" readonly/>
                                            </div>
                                            <div class="main1_type1_search_airline_one_way2_calender">
                                                달력자리
                                            </div>
                                        </div>

                                        <div class="main1_type1_search_airline_one_way3">
                                            <div>
                                                <input type="text" name="search_airline_one_way_member" readonly/>
                                            </div>
                                            <!-- one_way_direct_active -->
                                            <div class="">
                                                직항
                                                <input type="checkbox" name="search_airline_one_way_direct"/>
                                            </div>


                                            <div class="search_airline_one_way_member">

                                                <div class="search_airline_one_way_member1">
                                                    인원
                                                </div>
                                        
                                                <div class="search_airline_one_way_member2">
                                                    <div class="search_airline_one_way_member_adult">
                                                        <div>성인</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_one_way_member_adult_number">1</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                    <div class="search_airline_one_way_member_child">
                                                        <div>소아</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_one_way_member_child_number">0</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                    <div class="search_airline_one_way_member_infant">
                                                        <div>유아</div>
                                                        <div>
                                                            <div></div>
                                                            <div class="search_airline_one_way_member_infant_number">0</div>
                                                            <div></div>
                                                        </div>
                                                    </div>
                                                </div>
                                        
                                                <div class="search_airline_one_way_member3">
                                                    좌석 등급
                                                </div>
                                        
                                                <div class="search_airline_one_way_member4">
                                                    <div>
                                                        <label for="" class="search_airline_one_way_seat_class_active">
                                                            <div></div>
                                                            <div>일반석</div>
                                                            <input type="radio" name="search_airline_one_way_seat_class" value="economy" checked/>
                                                        </label>
                                                    </div>
                                                    <div>
                                                        <label for="">
                                                            <div></div>
                                                            <div>프레스티지석</div>
                                                            <input type="radio" name="search_airline_one_way_seat_class" value="prestige"/>
                                                        </label>
                                                    </div>
                                                   
                                                </div>
                                        
                                                <div class="search_airline_one_way_member5">
                                                    <div class="search_airline_one_way_member_select">
                                                        선택완료
                                                    </div>
                                                </div>
                                        
                                            </div>
                                            <!-- search_airline_one_way_member -->



                                        </div>

                                        <div class="main1_type1_search_airline_one_way4">
                                            항공권 검색
                                        </div>
                                       
                                    </form>
                                </div>
                                <!-- main1_type1_search_airline_one_way 종료 -->




                            </div>
                            <!-- main1_type1_search_airline_search_setting 종료 -->

                        </div>







                        <!-- 호텔 -->
                        <div class="
                            main1_type1_search_inn
                        ">
                        
                            <form action="">

                                <div class="main1_type1_search_inn1">
                                    <input type="text" name="search_inn_arrival" placeholder="어디로 떠나세요?"/>
                                </div>

                                <div class="main1_type1_search_inn2">
                                    <div class="search_inn_date">
                                        <div>
                                            <input type="text" name="search_inn_date_departure" value="2024.07.16" readonly/>
                                        </div>
                                        <div>
                                            <input type="text" name="search_inn_date_arrival" value="2024.07.17" readonly/>
                                        </div>
                                    </div>
                                    <div class="main1_type1_search_inn2_calender">
                                        달력자리
                                    </div>
                                </div>

                                <div class="main1_type1_search_inn3">
                                    <input type="text" name="search_inn_member" value="객실1 ' 성인 2명" readonly/>


                                    <div class="search_inn_room_member">

                                        <div class="search_inn_room_member1">
                                            객실 선택
                                        </div>

                                        <div class="search_inn_room_member2">
                                            <div>객실</div>
                                            <div>
                                                <div></div>
                                                <div class="search_inn_room_member_room_number">1</div>
                                                <div></div>
                                            </div>
                                        </div>

                                        <div class="search_inn_room_member3">
                                            객실별 인원 설정
                                        </div>

                                        <div class="search_inn_room_member4">
                                            <div class="search_inn_room_member_adult">
                                                <div>성인</div>
                                                <div>
                                                    <div></div>
                                                    <div class="search_inn_room_member_adult_number">2</div>
                                                    <div></div>
                                                </div>
                                            </div>
                                            <div class="search_inn_room_member_children">
                                                <div>아동</div>
                                                <div>
                                                    <div></div>
                                                    <div class="search_inn_room_member_children_number">0</div>
                                                    <div></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="search_inn_room_member5">
                                            <div>
                                                <div>
                                                    <span>객실</span>
                                                    <span class="search_inn_room_member_room_number">1</span>
                                                </div>
                                                &nbsp; &apos; &nbsp;
                                                <div>
                                                    <span>성인</span>
                                                    <span class="search_inn_room_member_adult_number">2</span>
                                                </div>
                                                &nbsp;
                                                <div>
                                                    <span class="search_inn_room_member_children_text"></span>
                                                    <span class="search_inn_room_member_children_number"></span>
                                                </div>
                                            </div>
                                            <div>선택완료</div>
                                        </div>

                                    </div>
                                    <!-- search_inn_room_member -->
                                </div>


                                <div class="main1_type1_search_inn4">
                                    숙소 검색
                                </div>

                            </form>
                        </div>







                    </div>
                    <!-- main1_type1_search_setting 종료 -->





                </div>
                <!-- main1_type1_search_bottom 종료 -->
            </div>
            <!-- main1_type1_search 종료 -->

            <div class="main1_type1_img">

                <div class="bxslider2">
                    <div><img src="${pageContext.request.contextPath}/hanatour/img/main1_home/main1_type1_img1.jpg"/></div>
                    <div><img src="${pageContext.request.contextPath}/hanatour/img/main1_home/main1_type1_img2.jpg"/></div>
                    <div><img src="${pageContext.request.contextPath}/hanatour/img/main1_home/main1_type1_img3.jpg"/></div>
                    <div><img src="${pageContext.request.contextPath}/hanatour/img/main1_home/main1_type1_img4.jpg"/></div>
                    <div><img src="${pageContext.request.contextPath}/hanatour/img/main1_home/main1_type1_img5.jpg"/></div>
                </div>

           
            </div>
            <!-- main1_type1_img 종료 -->

        </div>
    </div>


    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                💜빅하투페어 X ⏰타임세일 콜라보 한정특가
            </div>
        </div>
    </div>



    <div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                매주 월요일 10시! 역대급 타임세일을 만나보세요!
            </div>
        </div>
    </div>


    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img1.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        
                    </div>
                    <div class="type8_title">
                        홋카이도 패키지 4일 
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                869,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img2.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        백두산/연길 4~5일
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                469,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img3.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        이탈리아 일주 9일 VS 이탈리아/스위스 9일
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,490,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img4.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        삿포로 에어텔 4일
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                399,000
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
                무르익어 가는 나의 여행力
            </div>
        </div>
    </div>



    <div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                하나의 새로운 매력이 여행을 떠나게 만들지🎒
            </div>
        </div>
    </div>


    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img5.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        캄보디아 프놈펜/시엠립 5일
                    </div>
                    <div class="type8_bottom_tag">
                        과거와 현재를 보는 두 도시 여행
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                619,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img6.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        시즈오카/야마나시 4일
                    </div>
                    <div class="type8_bottom_tag">
                        숏폼촬영하러 떠나는! 핫플정복!
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,079,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img7.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        홋카이도/후라노/비에이 3~5일
                    </div>
                    <div class="type8_bottom_tag">
                        홋카이도 진짜 풍경 보러 가요
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,269,900
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img8.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                    </div>
                    <div class="type8_title">
                        남미 핵심일주 13~17일
                    </div>
                    <div class="type8_bottom_tag">
                        걸어서 남미속으로
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                16,371,000
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
                <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type6_img1.jpg" alt="">
                <!-- <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type6_img2.jpg" alt=""> -->
            </div>
        </div>
    </div>


    


    <div class="type3">
        <div class="type3_inner">
            <div class="type3_background_img">
                <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_background_img.jpg" alt="">
            </div>

            <div class="type3_contents">
                <div class="type3_contents_left fl">
                    <div class="type3_title">
                        <strong>
                            빅하투페어<br>여름휴가 혜택<br>최대 90% sale
                        </strong>
                    </div> 

                    <div class="type3_tab">

                        <div class="type3_tab_active">
                            여름휴가🌊의 정석은 동남아
                            <div class="type3_type8_container">

                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img1.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            패키지
                                        </div>
                                        <div class="type8_title">
                                            세부 4~6일
                                        </div>
                                        <div class="type8_bottom_tag">
                                            #샹그릴라리조트 #더리프 #뫼벤픽
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    499,600
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img2.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            패키지
                                        </div>
                                        <div class="type8_title">
                                            대만 4~5일
                                        </div>
                                        <div class="type8_bottom_tag">
                                            #비교불가 #가볍게 떠나는 대만
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    549,900
                                                </strong>
                                            </span>
                                            <span>원~</span>
                                        </div>
                                    </a>
                                </div>
        
                                <div class="type8">
                                    <a href="#">
                                        <div class="type8_img">
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img3.jpg" alt="">
                                        </div>
                                        <div class="type8_top_tag">
                                            패키지
                                        </div>
                                        <div class="type8_title">
                                            싱가포르 5일
                                        </div>
                                        <div class="type8_bottom_tag">
                                            #완전특가  #NO쇼핑
                                        </div>
                                        <div class="type8_price">
                                            <span>
                                                <strong>
                                                    966,800
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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
                                            <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type3_type8_container_img4.jpg" alt="">
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

                        
                    </div>
                    <!-- type3_tab 종료 -->

                </div>
                <!-- type3_contents_left 종료 -->

            </div>
        </div>
    </div>







    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                고객님만을 위한 추천여행
            </div>
        </div>
    </div>


    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img9.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        패키지
                    </div>
                    <div class="type8_title">
                        [스마트 초이스]홋카이도 4일 #북해도여름향기 #후라노비에이 #팜도미타 #대 ...
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,279,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img10.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        패키지
                    </div>
                    <div class="type8_title">
                        발리 5일 #모벤픽리조트#1일자유#우붓스윙#사라스와띠#마사지2시간#특식2회
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                1,766,600
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img11.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        패키지
                    </div>
                    <div class="type8_title">
                        [홈쇼핑에디션] 보홀 5일 #비그랜드리조트 #고래상어투어 #발마사지 #알로나 ...
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                599,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type8_img12.jpg" alt="">
                    </div>
                    <div class="type8_top_tag">
                        패키지
                    </div>
                    <div class="type8_title">
                        [홈쇼핑에디션] 보홀 5일 #비그랜드리조트 #고래상어투어 #발마사지 #알로나 ...
                    </div>
                    <div class="type8_bottom_tag">
                    </div>
                    <div class="type8_price">
                        <span>
                            <strong>
                                663,000
                            </strong>
                        </span>
                        <span>원~</span>
                    </div>
                </a>
            </div>

           

        </div>
    </div>




    <div class="type10">

        <div class="type10_inner">


            <div class="type10_item_container">

                <div class="type10_item">
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_img1.jpg" alt="">
                    </div>

                    <div class="type10_item_right">

                        <div class="type10_description">
                            <div>인도/스리랑카/네팔</div>
                            <div>인생에 한번쯤,</div>
                            <div>
                                버킷리스트 여행지 모음ZIP<br/>
                                v 삶에 감사하며, 인크레더블 인디아<br/>
                                v 홍차와 인도양의 나라 스리랑카<br/>
                                v 세계의 지붕 히말라야를 품은 네팔<br/><br/>
                                #리얼여행 #대자연 #세계문화유산의 그곳으로
                            </div>
                        </div>

                        <div class="type10_product_container">

                            <div class="type10_product">
                                <div class="type10_product_img">
                                    <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_product1.jpg" alt="">
                                </div>
                                <div class="type10_product_description">
                                    <div>청량한 일주일을 나 자신에게 선물해보세요</div>
                                    <div>[인도 북부] 레(leh) 일주 #여름 시즌에만 허락된 그 곳</div>
                                    <div>
                                        <span>2,709,100</span>
                                        <span>원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="type10_product">
                                <div class="type10_product_img">
                                    <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_product2.jpg" alt="">
                                </div>
                                <div class="type10_product_description">
                                    <div>반짝이는 인도양의 나라</div>
                                    <div>스리랑카 8일 #인도양의보석 #코끼리의낙원</div>
                                    <div>
                                        <span>2,642,900</span>
                                        <span>원</span>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- type10_item_right -->
                </div>
                <!-- type10_item1 종료 -->


                <div class="type10_item">
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_img2.jpg" alt="">
                    </div>

                    <div class="type10_item_right">

                        <div class="type10_description">
                            <div>꿈을 담은 특별한 여행</div>
                            <div>하나 Original</div>
                            <div>
                                <b>특별한 키워드를 담은 하나 Original 상품을 만나보세요.</b><br>
                                <b>#특별한 숙소</b> 숙박 이상의 잊지 못할 경험을 선사하는 여행<br>
                                <b>#특별한 경험</b> 오로라투어, 다이빙 등 이색적인 여행<br>
                                <b>#미식여행</b> 그 나라의 맛과 문화를 체험하는 여행<br>
                                <b>#전문가 동행</b> 예술/사진/음악 등 전문가와 함께하는 여행<br>
                                <b>#환경친화적인</b> 환경친화적 일상을 실천하는 여행<br>
                                <b>#하이엔드</b> 최고의 럭셔리 패키지 여행
                            </div>
                        </div>

                        <div class="type10_product_container">

                            <div class="type10_product">
                                <div class="type10_product_img">
                                    <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_product3.jpg" alt="">
                                </div>
                                <div class="type10_product_description">
                                    <div>#골프 라운딩 #이지 트레킹 #웰메이드 휴식</div>
                                    <div>[롱스테이, 온몸으로 느껴보는] 하와이 10일</div>
                                    <div>
                                        <span>3,360,000</span>
                                        <span>원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="type10_product">
                                <div class="type10_product_img">
                                    <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type10_product4.jpg" alt="">
                                </div>
                                <div class="type10_product_description">
                                    <div>#젓가락만들기 #현지핫플 #우동정복</div>
                                    <div>[나만의 젓가락 투어] 다카마츠 4일 #우동투어 #1일자유</div>
                                    <div>
                                        <span>1,419,900</span>
                                        <span>원</span>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- type10_item_right -->
                </div>
                <!-- type10_item2 종료 -->


            </div>
            <!-- type10_item_container 종료 -->

            <div class="type10_slider_btn">
                <div class="type10_btn type10_btn_active">
                    <button></button>
                </div>
                <div class="type10_btn">
                    <button></button>
                </div>
            </div>

        </div>
        <!-- type10_inner 종료 -->
       
    </div>





    
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                내나라 구석구석
            </div>
        </div>
    </div>



    <div class="main1_type7">
        <div class="main1_type7_inner">

            <div class="main1_type7_item_container">

                <div class="main1_type7_item">
                    <div class="main1_type7_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type7_img1.jpg" alt="">
                    </div>
                    <div class="main1_type7_title">
                        언제가도 좋은 섬, 제주
                    </div>
                    <div class="main1_type7_tag">
                        패키지부터 자유여행까지! <br>올 여름에는 아름다운 섬 제주로💛
                    </div>
                </div>
                
                
                <div class="main1_type7_item">
                    <div class="main1_type7_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type7_img2.jpg" alt="">
                    </div>
                    <div class="main1_type7_title">
                        여름을 기다리는 울릉도🌿
                    </div>
                    <div class="main1_type7_tag">
                        푸른 바다와 자연 풍경이 넘치는<br>모두의 버킷리스트 여행지 울릉도!
                    </div>
                </div>
                
                <div class="main1_type7_item">
                    <div class="main1_type7_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type7_img3.jpg" alt="">
                    </div>
                    <div class="main1_type7_title">
                        <p class="item_title">이달의 국내여행</p>
                    </div>
                    <div class="main1_type7_tag">
                        바다 여행‍🌊<br>#강원바다 #제주바다 #섬여행
                    </div>
                </div>
                
                <div class="main1_type7_item">
                    <div class="main1_type7_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type7_img4.jpg" alt="">
                    </div>
                    <div class="main1_type7_title">
                        이유 있는 선택, 내나라 여행
                    </div>
                    <div class="main1_type7_tag">
                        2007년 시작, 연간 1만명의<br>고객이 선택한 고품격 국내여행🏆
                    </div>
                </div>
                
                <div class="main1_type7_item">
                    <div class="main1_type7_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type7_img4.jpg" alt="">
                    </div>
                    <div class="main1_type7_title">
                        천혜의 자연 속으로, 섬 여행
                    </div>
                    <div class="main1_type7_tag">
                        패키지로 편하게 떠나는<br>#홍도 #흑산도 #백령도 #대청도
                    </div>
                </div>


            </div>
        </div>
    </div>


    <div class="type11">

        <div class="type11_inner">

            <div class="type11_title">
                <strong>
                    꿈꾸는 대로, 펼쳐지다
                </strong>
            </div>
            <div class="type11_item_container">

                <div class="type11_item_left">
                    <div>
                        <iframe 
                            width="387" 
                            height="218" 
                            src="https://www.youtube.com/embed/qaxwwcdDH9k?si=oYjbm1aooWj8sqhM" title="YouTube video player" 
                            frameborder="0" 
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" r
                            eferrerpolicy="strict-origin-when-cross-origin" 
                            allowfullscreen>
                        </iframe>
                    </div>
                    <div>
                        <div class="type11_item_left_title">
                            	하이난 거기가 어딘데?
                        </div>
                        <div class="type11_item_left_contents_top">
                            	하이난 고수가 소개해주는 랜선투어👨‍💻<br>
                            	천애해각에서부터 대동해까지<br>
                            	낯선 여행지도 어렵지 않아요~<br>
                            	꿔바로우 ♥ 코코넛 빙수 먹방도 놓치지 마세요!<br><br>
                        </div>
                        <div class="type11_item_left_contents_bottom">
                            	랜선투어 하이난 ep1 함께 떠나보아요!
                        </div>
                    </div>
                </div>

                <div class="type11_item_center">
                    <div>
                        	하이난은 언제부터 동양의 하와이가 됐을까
                    </div>
                    <div>
                        	여행하기 좋은 따뜻한 날씨<br>
                        	아름다운 풍경과 낭만을 품은 바다<br>
                        	해변을 따라 늘어선 호텔에서 바다멍 호캉스<br>
                        	다양한 액티비티와 골캉스의 매력까지<br><br>
                    </div>
                    <div>
                        	우리는 지금 바로 여기 하이난>
                    </div>
                </div>

                <div class="type11_item_right">
                    <div>
                        <img src="${pageContext.request.contextPath}/hanatour/img/main1_home/type11_img2.jpg" alt="">
                    </div>
                    <div>
                        <div>
                            	지금 예약하면 딱 좋은!
                        </div>
                        <div>
                            	기대 이상의 감동 [장가계]<br>
                            	마음에 담는 진한 감동 [백두산]<br>
                            	웅장한 동양의 그랜드캐년 [태항산]<br>
                            	천하절경! 하늘 위 무릉도원 [황산]<br>
                            	오색빛 물의 향연 [구채구]<br>
                        </div>
                        <div>
                            	중국 5대 풍경구 보러가기>
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
<!-- bx slider js -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main_type.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_home.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
</html>