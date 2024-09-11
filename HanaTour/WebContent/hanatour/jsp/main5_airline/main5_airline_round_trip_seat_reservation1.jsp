<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main5_airline_round_trip_seat_reservation1.css">
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




    <div class="airplane_seat_select">    

        <div class="airplane_seat_select_inner">

            <div class="airplane_seat_select_header">
                
                <div class="airplane_seat_select_header1">
                    <div>항공권 예약 인원수</div>
                    <div>
                        <span>성인</span>
                        <span>1</span>
                    </div>
                    <div>
                        <span>소아</span>
                        <span>1</span>
                    </div>
                    <div>
                        <span>유아</span>
                        <span>1</span>
                    </div>
                </div>
                <div class="airplane_seat_select_header2">
                    <h2>유의사항</h2>
                </div>
                <div class="airplane_seat_select_header3">
                    <h3>유아</h3>
                    <ul>
                        <li>유아는 생후 7일부터 탑승 가능하며, 각 구간별 부모 또는 탑승일 기준 만 18세 이상의 보호자가 동반해야 합니다.</li>
                        <li>유아가 좌석을 점유하는 경우 소아로 예약합니다.</li>
                        <li>성인 1명 당 유아 1명을 동반할 수 있습니다.</li>
                        <li>성인 1명이 2명의 유아를 동반하는 경우, 유아 1명은 좌석을 제공하는 소아 항공권을 구매해야 합니다.</li>
                        <li>좌석을 배정받지 않더라도 꼭 예약명단에 포함되어 보호자와 함께 예약되어야 하며, 여권을 준비해야 합니다.</li>
                    </ul>
                    <h3>소아</h3>
                    <ul>
                        <li>각 구간별 부모 또는 탑승일 기준 만 18세 이상의 보호자가 동반해야 합니다.</li>
                        <li>유아가 좌석을 점유하는 경우 소아로 예약합니다.</li>
                        <li>보호자와 함께 앉을 수 있도록 미리 꼭 좌석 선택을 해주세요.</li>
                        <li>일반석은 항공권 구매 완료한 시점부터 출발 48시간 전까지, 일등석/프레스티지석은 예약 확약 시점부터 출발 24시간 전까지 신청해주세요.</li>
                    </ul>
                </div>
                <div class="airplane_seat_select_header4">
                    좌석선택
                </div>
            </div>
            <!-- airplane_seat_select_header -->
        </div>
        <!-- airplane_model_inner 종료 -->
    </div>








    
    <!-- airline_airplane_active -->
    <div class="
        airline_airplane
    ">

        <div class="airline_airplane_container">

            <div class="airline_airplane_container_header">
                <div class="airline_airplane_container_header_passenger_info">
                    <div>항공권 예약 인원수</div>
                    <div>
                        <span>성인</span>
                        <span>2</span>
                    </div>
                    <div>
                        <span>소아</span>
                        <span>2</span>
                    </div>
                    <div>
                        <span>유아</span>
                        <span>2</span>
                    </div>
                    <div>
                        <span></span>
                    </div>
                </div>
                <div class="airline_airplane_container_close_btn">
                    <div></div>
                </div>
            </div>

            <div class="airline_airplane_container_body">

                <!-- airline_airplane_model_active -->
                <div class="
                    airline_airplane_model
                    airline_airplane_model1
                ">
                        <div class="airline_airplane_model_img">
                            <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline6/fl-737-8-146-seatmap-pc.png" alt="">

                            <div class="airline_prestige_container">
                                <!-- model1_prestige_selected -->
                                <!-- model1_prestige_reserved -->
                                <div 
                                    class=""
                                    style="position: absolute; top: 478.667px; left: 155.667px; width: 59.3333px; height: 58.6667px;" 
                                    id="airplane_model1_a7"
                                >
                                </div>
                                <div 
                                    class="model1_prestige_reserved"
                                    style="position: absolute; top: 478.667px; left: 214px; width: 57.3333px; height: 58.6667px;"
                                    id="airplane_model1_b7"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 478.667px; left: 314.667px; width: 59.3333px; height: 58.6667px;"
                                    id="airplane_model1_d7"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 478.667px; left: 374.333px; width: 57px; height: 58.6667px;"
                                    id="airplane_model1_e7"
                                >
                                </div>        
                                   
                                <div 
                                    class="model1_prestige_reserved"
                                    style="position: absolute; top: 583.333px; left: 155.333px; width: 59.6667px; height: 60px;"
                                    id="airplane_model1_a8"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 583.333px; left: 215.333px; width: 57.3333px; height: 60px;"
                                    id="airplane_model1_b8"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 582px; left: 316.333px; width: 58.3333px; height: 62.3333px;"
                                    id="airplane_model1_d8"
                                >
                                </div>
                                <div 
                                    class="model1_prestige_pet" 
                                    style="position: absolute; top: 581.667px; left: 375px; width: 58px; height: 63.3333px;"
                                    id="airplane_model1_e8"
                                >
                                </div>


                            </div>
                            <!-- airline_prestige_container 종료 -->




                            <div class="airline_economy_container">
                                <!-- model1_economy_selected -->
                                <!-- model1_economy_reserved -->

                                <!-- model1_economy_pet -->
                                <!-- model1_economy_disability -->
                                <!-- model1_economy_extra_leg -->
                                <!-- model1_economy_preferred-->
                                <div
                                    class="" 
                                    style="position: absolute; top: 745.667px; left: 153px; width: 38.3333px; height: 38px;"
                                    id="airplane_model1_a28"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 746px; left: 193px; width: 39px; height: 38.3333px;"
                                    id="airplane_model1_b28"
                                >
                                </div>
                                <div
                                    class="model1_economy_disability" 
                                    style="position: absolute; top: 746px; left: 235.333px; width: 38.3333px; height: 37px;"
                                    id="airplane_model1_c28"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 746px; left: 313.333px; width: 39px; height: 37.6667px;"
                                    id="airplane_model1_d28"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 746.333px; left: 356px; width: 37px; height: 38px;"
                                    id="airplane_model1_e28"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 746.333px; left: 396px; width: 38.6667px; height: 39px;"
                                    id="airplane_model1_f28"
                                >
                                </div>

                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 795.333px; left: 154.333px; width: 36px; height: 37.3333px;"
                                    id="airplane_model1_a29"
                                >
                                </div>
                                <div
                                    class="model1_economy_disability" 
                                    style="position: absolute; top: 795.333px; left: 192.667px; width: 39px; height: 37.6667px;"
                                    id="airplane_model1_b29"
                                >
                                </div>
                                <div
                                    class="model1_economy_disability" 
                                    style="position: absolute; top: 795.333px; left: 234.667px; width: 39px; height: 38.6667px;"
                                    id="airplane_model1_c29"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 795.333px; left: 312.667px; width: 39.3333px; height: 37.6667px;"
                                    id="airplane_model1_d29"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 795.333px; left: 353.333px; width: 39.6667px; height: 38.3333px;"
                                    id="airplane_model1_e29"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 796px; left: 396.667px; width: 37px; height: 38px;"
                                    id="airplane_model1_f29"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 844.667px; left: 153.667px; width: 37.3333px; height: 36.3333px;"
                                    id="airplane_model1_a30"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 844.667px; left: 191.667px; width: 41.3333px; height: 36.6667px;"
                                    id="airplane_model1_b30"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 845.667px; left: 233.667px; width: 39.6667px; height: 35px;"
                                    id="airplane_model1_c30"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred model1_economy_reserved" 
                                    style="position: absolute; top: 844px; left: 312.667px; width: 39px; height: 37.3333px;"
                                    id="airplane_model1_d30"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 844.333px; left: 353px; width: 40.3333px; height: 36.6667px;"
                                    id="airplane_model1_e30"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 844.667px; left: 393.667px; width: 41.3333px; height: 38.3333px;"
                                    id="airplane_model1_f30"
                                >
                                </div>

                                
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 892.333px; left: 154px; width: 36.6667px; height: 37.3333px;"
                                    id="airplane_model1_a31"
                                >
                                </div>
                                <div
                                    class="model1_economy_disability" 
                                    style="position: absolute; top: 893.667px; left: 191.667px; width: 41px; height: 36.6667px;"
                                    id="airplane_model1_b31"
                                >
                                </div>
                                <div
                                    class="model1_economy_disability model1_economy_reserved" 
                                    style="position: absolute; top: 893px; left: 234px; width: 39px; height: 38px;"
                                    id="airplane_model1_c31"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 894px; left: 314.333px; width: 38px; height: 36.3333px;"
                                    id="airplane_model1_d31"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 894.333px; left: 354.333px; width: 39px; height: 36px;"
                                    id="airplane_model1_e31"
                                >
                                </div>
                                <div
                                    class="model1_economy_preferred" 
                                    style="position: absolute; top: 894px; left: 394px; width: 41px; height: 36.3333px;"
                                    id="airplane_model1_f31"
                                >
                                </div>

                                
                                <div
                                    class="" 
                                    style="position: absolute; top: 941.333px; left: 152.333px; width: 39.3333px; height: 37.6667px;"
                                    id="airplane_model1_a32"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 941.333px; left: 192.333px; width: 41.3333px; height: 38px;"
                                    id="airplane_model1_b32"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 941px; left: 234.333px; width: 39.6667px; height: 38.6667px;"
                                    id="airplane_model1_c32"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 941px; left: 313.667px; width: 38.3333px; height: 36.6667px;"
                                    id="airplane_model1_d32"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 941px; left: 352.667px; width: 41.3333px; height: 37px;"
                                    id="airplane_model1_e32"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 942px; left: 394.333px; width: 40px; height: 36px;"
                                    id="airplane_model1_f32"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 990.333px; left: 151.667px; width: 39.6667px; height: 37.6667px;"
                                    id="airplane_model1_a33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 990.667px; left: 191.667px; width: 41px; height: 37.3333px;"
                                    id="airplane_model1_b33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 991px; left: 234.333px; width: 38.6667px; height: 37px;"
                                    id="airplane_model1_c33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 990.333px; left: 312.667px; width: 39px; height: 37.3333px;"
                                    id="airplane_model1_d33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 991px; left: 351.667px; width: 41px; height: 36.3333px;"
                                    id="airplane_model1_e33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 991.333px; left: 394px; width: 41px; height: 36px;"
                                    id="airplane_model1_f33"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1039.33px; left: 151.333px; width: 39.6667px; height: 37px;"
                                    id="airplane_model1_a34"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1039px; left: 191.667px; width: 41px; height: 37.3333px;"
                                    id="airplane_model1_b34"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1038.67px; left: 232.667px; width: 40.3333px; height: 37.6667px;"
                                    id="airplane_model1_c34"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1039.67px; left: 314px; width: 38.3333px; height: 37.6667px;"
                                    id="airplane_model1_d34"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1039.67px; left: 352.667px; width: 41.3333px; height: 37.6667px;"
                                    id="airplane_model1_e34"
                                >
                                </div>
                                <div
                                    class="model1_economy_pet" 
                                    style="position: absolute; top: 1039.67px; left: 394.333px; width: 40.3333px; height: 37.6667px;"
                                    id="airplane_model1_f34"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1087.67px; left: 150.667px; width: 41px; height: 37.6667px;"
                                    id="airplane_model1_a35"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1087.67px; left: 192.333px; width: 38.6667px; height: 38px;"
                                    id="airplane_model1_b35"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1088.67px; left: 233.333px; width: 40.6667px; height: 36.6667px;"
                                    id="airplane_model1_c35"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1088px; left: 313.333px; width: 39.3333px; height: 37.3333px;"
                                    id="airplane_model1_d35"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1088.67px; left: 353.667px; width: 39px; height: 37.3333px;"
                                    id="airplane_model1_e35"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1089.33px; left: 393px; width: 41.6667px; height: 37px;"
                                    id="airplane_model1_f35"
                                >
                                </div>

                                
                                <div
                                    class="" 
                                    style="position: absolute; top: 1156.33px; left: 153.333px; width: 38px; height: 37px;"
                                    id="airplane_model1_a36"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1156.33px; left: 191.333px; width: 41.6667px; height: 37.3333px;"
                                    id="airplane_model1_b36"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1156.33px; left: 233.333px; width: 41.3333px; height: 38px;"
                                    id="airplane_model1_c36"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1155.33px; left: 313px; width: 38.3333px; height: 39.6667px;"
                                    id="airplane_model1_d36"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1155.33px; left: 352.333px; width: 41.3333px; height: 39.3333px;"
                                    id="airplane_model1_e36"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1154.67px; left: 394px; width: 41.3333px; height: 40.6667px;"
                                    id="airplane_model1_f36"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg model1_economy_reserved" 
                                    style="position: absolute; top: 1228px; left: 153.333px; width: 38.3333px; height: 37.3333px;"
                                    id="airplane_model1_a37"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 1228.33px; left: 192.667px; width: 40.3333px; height: 37.6667px;"
                                    id="airplane_model1_b37"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 1228.67px; left: 234.667px; width: 39px; height: 37.6667px;"
                                    id="airplane_model1_c37"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 1227.67px; left: 313.667px; width: 39.3333px; height: 37.3333px;"
                                    id="airplane_model1_d37"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 1228px; left: 353.333px; width: 40px; height: 37.3333px;"
                                    id="airplane_model1_e37"
                                >
                                </div>
                                <div
                                    class="model1_economy_extra_leg" 
                                    style="position: absolute; top: 1228.67px; left: 393.333px; width: 41.3333px; height: 36.3333px;"
                                    id="airplane_model1_f37"
                                >
                                </div>


                                
                                <div 
                                    class=""
                                    style="position: absolute; top: 1277px; left: 153.333px; width: 37px; height: 36.6667px;"
                                    id="airplane_model1_a38"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1277.67px; left: 191.333px; width: 41.6667px; height: 36.3333px;"
                                    id="airplane_model1_b38"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1276.67px; left: 235px; width: 38.3333px; height: 37px;"
                                    id="airplane_model1_c38"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1277.33px; left: 314px; width: 37px; height: 35.3333px;"
                                    id="airplane_model1_d38"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1277.33px; left: 352.667px; width: 40.6667px; height: 37px;"
                                    id="airplane_model1_e38"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1277.67px; left: 393.333px; width: 40px; height: 36.6667px;"
                                    id="airplane_model1_f38"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1325.33px; left: 152.667px; width: 38px; height: 36.6667px;"
                                    id="airplane_model1_a39"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1325.67px; left: 191px; width: 41.3333px; height: 36.6667px;"
                                    id="airplane_model1_b39"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1325.33px; left: 233.667px; width: 39.6667px; height: 38.3333px;"
                                    id="airplane_model1_c39"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1325.67px; left: 313.667px; width: 38.3333px; height: 35.6667px;"
                                    id="airplane_model1_d39"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1325.33px; left: 353.333px; width: 39px; height: 36.6667px;"
                                    id="airplane_model1_e39"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1325.67px; left: 393.333px; width: 41.6667px; height: 36.3333px;"
                                    id="airplane_model1_f39"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1374px; left: 152px; width: 39.3333px; height: 37px;"
                                    id="airplane_model1_a40"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1374.33px; left: 193px; width: 39.3333px; height: 36.6667px;"
                                    id="airplane_model1_b40"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1374px; left: 233.333px; width: 39px; height: 38px;"
                                    id="airplane_model1_c40"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1373.67px; left: 313.333px; width: 38.3333px; height: 38.6667px;"
                                    id="airplane_model1_d40"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1373.67px; left: 351.667px; width: 41.6667px; height: 38.6667px;"
                                    id="airplane_model1_e40"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1374.33px; left: 393.667px; width: 42px; height: 38.6667px;"
                                    id="airplane_model1_f40"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1422px; left: 151.667px; width: 40px; height: 39.3333px;"
                                    id="airplane_model1_a41"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1422.33px; left: 192.333px; width: 40.3333px; height: 39px;"
                                    id="airplane_model1_b41"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1422.67px; left: 234px; width: 39px; height: 38.3333px;"
                                    id="airplane_model1_c41"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1423.67px; left: 314px; width: 38.6667px; height: 37px;"
                                    id="airplane_model1_d41"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1423.67px; left: 353px; width: 40px; height: 37px;"
                                    id="airplane_model1_e41"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1423.67px; left: 393.333px; width: 42.6667px; height: 37.3333px;"
                                    id="airplane_model1_f41"
                                >
                                </div>
                                
                                <div
                                    class="" 
                                    style="position: absolute; top: 1471px; left: 152px; width: 39.5px; height: 38.5px;"
                                    id="airplane_model1_a42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1471px; left: 194px; width: 38.5px; height: 39.5px;"
                                    id="airplane_model1_b42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1472px; left: 233.5px; width: 40.5px; height: 39.5px;"
                                    id="airplane_model1_c42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1470.5px; left: 313.5px; width: 39px; height: 40px;"
                                    id="airplane_model1_d42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1472px; left: 352.5px; width: 41px; height: 39px;"
                                    id="airplane_model1_e42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1472px; left: 395px; width: 41.5px; height: 38.5px;"
                                    id="airplane_model1_f42"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1519px; left: 154px; width: 37.5px; height: 39.5px;"
                                    id="airplane_model1_a43"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1518.5px; left: 192.5px; width: 41.5px; height: 41px;"
                                    id="airplane_model1_b43"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1519.5px; left: 235px; width: 39px; height: 39px;"
                                    id="airplane_model1_c43"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1520.5px; left: 315px; width: 38.5px; height: 38px;"
                                    id="airplane_model1_d43"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1520.5px; left: 356.5px; width: 36px; height: 38.5px;"
                                    id="airplane_model1_e43"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1520px; left: 395px; width: 41.5px; height: 39px;"
                                    id="airplane_model1_f43"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1566.5px; left: 153.5px; width: 38.5px; height: 40px;"
                                    id="airplane_model1_a44"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1566px; left: 193.5px; width: 40px; height: 41px;"
                                    id="airplane_model1_b44"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1568px; left: 234.5px; width: 40px; height: 39px;"
                                    id="airplane_model1_c44"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1568px; left: 312.5px; width: 41px; height: 39px;"
                                    id="airplane_model1_d44"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1566.5px; left: 356px; width: 37.5px; height: 40.5px;"
                                    id="airplane_model1_e44"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1567px; left: 394px; width: 41px; height: 40px;"
                                    id="airplane_model1_f44"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1616.5px; left: 154px; width: 38px; height: 38px;"
                                    id="airplane_model1_a45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1616px; left: 194px; width: 39.5px; height: 40px;"
                                    id="airplane_model1_b45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1618px; left: 234.5px; width: 39px; height: 38.5px;"
                                    id="airplane_model1_c45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1619px; left: 312.5px; width: 39.5px; height: 36.5px;"
                                    id="airplane_model1_d45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1619px; left: 352px; width: 41.5px; height: 37px;"
                                    id="airplane_model1_e45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1618px; left: 394px; width: 42.5px; height: 39px;"
                                    id="airplane_model1_f45"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1664.5px; left: 153.5px; width: 38.5px; height: 39px;"
                                    id="airplane_model1_a46"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1663.5px; left: 192.5px; width: 41px; height: 41px;"
                                    id="airplane_model1_b46"
                                >
                                </div>
                                <div
                                    class="model1_economy_reserved" 
                                    style="position: absolute; top: 1664.5px; left: 234px; width: 40.5px; height: 41px;"
                                    id="airplane_model1_c46"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1666.5px; left: 313.5px; width: 40px; height: 38px;"
                                    id="airplane_model1_d46"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1665.5px; left: 354px; width: 40px; height: 39px;"
                                    id="airplane_model1_e46"
                                >
                                </div>
                                <div
                                    class="" 
                                    style="position: absolute; top: 1666px; left: 395px; width: 40px; height: 38.5px;"
                                    id="airplane_model1_f46"
                                >
                                </div>
                                
                                <div 
                                    class=""
                                    style="position: absolute; top: 1714.33px; left: 153.333px; width: 38px; height: 38.6667px;"
                                    id="airplane_model1_a47"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1714px; left: 192px; width: 41px; height: 38.6667px;"
                                    id="airplane_model1_b47"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1713.67px; left: 233.667px; width: 41px; height: 39px;"
                                    id="airplane_model1_c47"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1714.67px; left: 313.333px; width: 38.6667px; height: 39px;"
                                    id="airplane_model1_d47"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1714px; left: 352.667px; width: 40.3333px; height: 39.6667px;"
                                    id="airplane_model1_e47"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1714px; left: 393.333px; width: 41.6667px; height: 39.6667px;"
                                    id="airplane_model1_f47"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1764px; left: 153.333px; width: 38px; height: 37.3333px;"
                                    id="airplane_model1_a48"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1763.67px; left: 191.667px; width: 41.3333px; height: 38.6667px;"
                                    id="airplane_model1_b48"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1763px; left: 233px; width: 41.6667px; height: 39.6667px;"
                                    id="airplane_model1_c48"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1764.33px; left: 313.333px; width: 38.6667px; height: 38px;"
                                    id="airplane_model1_d48"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1764px; left: 352px; width: 42.3333px; height: 38.6667px;"
                                    id="airplane_model1_e48"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1764px; left: 395px; width: 41px; height: 38.6667px;"
                                    id="airplane_model1_f48"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1814px; left: 153.333px; width: 37.6667px; height: 35.3333px;"
                                    id="airplane_model1_a49"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1814px; left: 193.667px; width: 39.6667px; height: 35.6667px;"
                                    id="airplane_model1_b49"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1813.67px; left: 235.333px; width: 37.3333px; height: 37px;"
                                    id="airplane_model1_c49"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1813px; left: 313.333px; width: 39.6667px; height: 36.3333px;"
                                    id="airplane_model1_d49"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1813px; left: 353.667px; width: 39px; height: 37.3333px;"
                                    id="airplane_model1_e49"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1812.67px; left: 394.333px; width: 39px; height: 38.3333px;"
                                    id="airplane_model1_f49"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1861.67px; left: 153.333px; width: 38.3333px; height: 37.3333px;"
                                    id="airplane_model1_a50"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1861.33px; left: 193.333px; width: 38.6667px; height: 37.3333px;"
                                    id="airplane_model1_b50"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1861.33px; left: 234.667px; width: 39px; height: 38px;"
                                    id="airplane_model1_c50"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1862.33px; left: 313.667px; width: 38.3333px; height: 37px;"
                                    id="airplane_model1_d50"
                                >
                                </div>
                                <div 
                                    class=""
                                    style="position: absolute; top: 1861.33px; left: 354px; width: 38.3333px; height: 38.3333px;"
                                    id="airplane_model1_e50"
                                >
                                </div>
                                <div 
                                    class="model1_economy_reserved"
                                    style="position: absolute; top: 1861px; left: 394px; width: 40.3333px; height: 38.6667px;"
                                    id="airplane_model1_f50"
                                >
                                </div>




                            </div>
                            <!-- airline_economy_container -->



                        </div>
                        <!-- airline_airplane_model_img  -->
                        
                        
                </div>
                <!-- airline_airplane_model1 종료 -->


                <div class="
                    airline_airplane_model
                    airline_airplane_model2
                ">
                    <div class="airline_airplane_model_img">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline6/fl-737-800-138-seatmap-pc.png" alt="">
                    </div>
                </div>
                <!-- airline_airplane_model2 종료 -->



                <div class="airline_airplane_container_body_right">
                    <div class="airline_airplane_container_body_right_seat_info">
                        <img src="${pageContext.request.contextPath}/hanatour/img/main5_airline6/seats_info.png" alt="">
                    </div>
                    <div>
                        선택한 좌석
                        <div class="airline_airplane_container_body_right_selected_info">
                            <!-- <div></div> -->
                        </div>
                    </div>
                    <div>
                        남은 선택 가능한 좌석수
                        <div></div>
                    </div>
                    <div class="seat_submit">
                        선택완료
                    </div>
                </div>


            </div>



        </div>
        <!-- airline_airplane_container 종료 -->
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
<script src="${pageContext.request.contextPath}/hanatour/script/main5_airline_round_trip_seat_reservation1.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
</html>