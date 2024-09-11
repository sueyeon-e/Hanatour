<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_type.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/tour_main.css">
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
     <!-- type1 -->
    <div class="type1">
        <div class="type1_inner">
            <!-- 이미지 -->
            <div class="type1_img">
                <img src="https://image.hanatour.com/usr/manual/md/2024/04/PL00114841/bnr_pc_sm.jpg" alt="">
                <!-- <img src="../../img/main5_airline/type1_img2.jpg" alt=""> -->
                <!-- <img src="../../img/main5_airline/type1_img3.jpg" alt=""> -->
                <!-- <img src="../../img/main5_airline/type1_img4.jpg" alt=""> -->
                <!-- <img src="../../img/main5_airline/type1_img5.jpg" alt=""> -->
            </div>
            <div class="type1_img_slider_btn">
                <div>
                    <a href="#">
                        <img src="../../img/main5_airline/type1_button_left.png" alt="">
                    </a>
                </div>
                <div>
                    <a href="#">
                        <img src="../../img/main5_airline/type1_button_right.png" alt="">
                    </a>
                </div>
                <div>
                    <a href="#">
                        <img src="../../img/main5_airline/type1_button_stop.png" alt="">
                    </a>
                </div>
            </div>
            <div class="img_slider_number">
                <span>1</span>
                <span>/</span>
                <span>5</span>
            </div>
            <form action="ControllerTour" >
            <div id="tour_search_city" class="center">
            	<div id="tour_search_inner">
            		<input type="text" class="city_keyword" name="cityName" placeholder="여행지, 상품, 장소를 검색해보세요">
            	</div>
            	<input type="hidden" id="command" name="command" value="tour_search">
            	<input type="submit" id="btn_search_city_kw" value="검색">검색</button>
            </div>
            </form>
        </div>
    </div>
    
        <!-- type6 -->
    <div class="type6" style="margin-top: 100px !important;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/md/2024/06/PL00115003/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
        <!--  type4 -->
    <div class="type4" style="margin-top: 127px;">
        <div class="type4_inner">
            <div class="type4_title">
                    지금이 제일 저렴해요🧐️
            </div>
        </div>
    </div>
    
    
    <!-- type5 -->
    <div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                타임세일 & 반값 특가
            </div>
        </div>
    </div>
    
    <!-- type8_container -->
    <div class="type8_container" style="margin-top: 40px;">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://static.hanatour.com/product/2023/11/28/062739de15/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2024/01/11/0050p5o619/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2023/12/04/08081ay3ye/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2024/05/29/0635mlqu9y/large.jpg" alt="">
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
    
    <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://static.hanatour.com/product/2023/03/30/0607yia5sw/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2024/03/06/0751c28hvq/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2024/02/27/0720ona4lu/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2024/01/23/0208vxl7tb/large.png" alt="">
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
    
    <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    이번주 급상승 여행키워드📈️
            </div>
        </div>
    </div>
    
     <!-- type7 -->
    <div class="type7">
        <div class="type7_inner">

            <div class="type7_item">
                <div class="type7_img">
                    <img src="../../img/main1_home/type7_img1.jpg" alt=""/>
                    <div>
                        <div>
                            <h4><b>태국</b></h4>
                        </div>
                        <div>먹거리 & 호캉스 천국! ></div>
                    </div>
                </div>
                <div class="type7_title"></div>
                <div class="tag"></div>
            </div>

            <div class="type7_item">
                <div class="type7_img">
                    <img src="../../img/main1_home/type7_img2.jpg" alt=""/>
                    <div>
                        <div>
                            <h4>홍콩&마카오</h4>
                        </div>
                        <div>동양과 서양의 매력 가득!  ></div>
                    </div>
                </div>
                <div class="type7_title"></div>
                <div class="tag"></div>
            </div>

            <div class="type7_item">
                <div class="type7_img">
                    <img src="../../img/main1_home/type7_img3.jpg" alt=""/>
                    <div>
                        <div>
                            <h4>하와이</h4>
                        </div>
                        <div>리조트피 포함 & 추가금 제로! ></div>
                    </div>
                </div>
                <div class="type7_title"></div>
                <div class="tag"></div>
            </div>

            <div class="type7_item">
                <div class="type7_img">
                    <img src="../../img/main1_home/type7_img4.jpg" alt=""/>
                    <div>
                        <div>
                            <h4>일본</h4>
                        </div>
                        <div>먹거리 & 놀거리 천국! ></div>
                    </div>
                </div>
                <div class="type7_title"></div>
                <div class="tag"></div>
            </div>

        </div>
    </div>
    
    <!-- type6 -->
    <div class="type6" style="margin-top: 100px !important;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/md/2024/05/PL00114889/bnr/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
     <!--  type4 -->
    <div class="type4" style="margin-top: 105px;">
        <div class="type4_inner">
            <div class="type4_title">
                    오사카 유니버셜 스튜디오 재팬 모아보기👀️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                #쇼핑쿠폰 #기다림 없이 익스프레스
            </div>
        </div>
    </div>
    
      <!-- type8_container -->
    <div class="type8_container" style="margin-top: 40px !important;">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/06/21/10000/c9c2f949-2993-4022-8184-4d72f1f2aebd.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2023/12/01/0556q3dhtm/large.jpg" alt="">
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
                        <img src="https://static.hanatour.com/product/2023/12/01/06263ltw97/large.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/29/10000/f83d06ba-6785-403c-9ba8-5f41db96cf94.jpg" alt="">
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
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    지금 떠나기 딱 좋다낭️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                인기 투어, 입장권 추천 😎
            </div>
        </div>
    </div>
    
      <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="../../img/main5_airline/type8_img1.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img2.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img3.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img4.jpg" alt="">
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
    
        <!-- type6 -->
    <div class="type6" style="margin-top: 100px !important;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/md/2023/12/PL00114486/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    매력 만점, 방콕🌴️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                공항 픽업부터 리버 크루즈까지
            </div>
        </div>
    </div>
    
    
      <!-- type8_container -->
    <div class="type8_container" style="margin-top: 40px;">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="../../img/main5_airline/type8_img1.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img2.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img3.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img4.jpg" alt="">
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
    
     <!--  type4 -->
    <div class="type4" style="margin-top: 56px;">
        <div class="type4_inner">
            <div class="type4_title">
                    다이나믹, 싱가포르️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                다양한 문화와 매력이 공존하는 도시✨
            </div>
        </div>
    </div>
    
    
      <!-- type8_container -->
    <div class="type8_container" style="margin-top: 40px;">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="../../img/main5_airline/type8_img1.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img2.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img3.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img4.jpg" alt="">
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
    
        <!-- type6 -->
    <div class="type6" style="margin-top: 75px;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/md/2022/12/PL00113498/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
        <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    타이베이 여행 준비 한 번에️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                🎫자유여행 필수 아이템
            </div>
        </div>
    </div>
    
      <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="../../img/main5_airline/type8_img1.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img2.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img3.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img4.jpg" alt="">
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
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    유럽은 근교에 더 멋진 곳들이 있어요!️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                소도시로 떠나는🚌 버스투어
            </div>
        </div>
    </div>
    
      <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="../../img/main5_airline/type8_img1.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img2.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img3.jpg" alt="">
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
                        <img src="../../img/main5_airline/type8_img4.jpg" alt="">
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
    
      <!-- type6 -->
    <div class="type6">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/update/pc/fnd/1c/bnr_1c_002.jpg" alt="">
            </div>
        </div>
    </div>
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    여행 전문가가 추천해요👍️
            </div>
        </div>
    </div>

	<!-- type5 -->
	<div class="type5">
        <div class="type5_inner">
            <div class="type5_subtitle">
                #MD추천 #이 상품 어때요?
            </div>
        </div>
    </div>
    
     <!-- type9 -->
    <div class="type9">
        <div class="type9_inner"> 


            <div class="type9_tab">
                <div class="type9_tab_active">일본</div>
                <div>동남아/대만</div>
                <div>남태평양</div>
                <div>미주</div>
                <div>유럽</div>
                <div>중국/홍콩/마카오</div>
            </div>


            <div class="type9_type8_container">

                <div class="type9_type8_innner type9_tab_active">
                    
                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_1.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 4.5성급
                            </div>
                            <div class="type8_title">
                                [세부] 더 리프 아일랜드 리조트
                            </div>
                            <div class="type8_bottom_tag">
                                아름다운 인피티니 풀
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        183,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>
                    
                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_2.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 5성급 
                            </div>
                            <div class="type8_title">
                                [다낭] 그랜드 머큐어 다낭
                            </div>
                            <div class="type8_bottom_tag">
                                다낭 시내 인기 리조트
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        100,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>
                    
                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_3.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 5성급 
                            </div>
                            <div class="type8_title">
                                [방콕] 이스틴 그랜드 호텔 사톤
                            </div>
                            <div class="type8_bottom_tag">
                                방콕 대표 가성비 호텔
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        153,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>
                    
                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_4.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 5성급 
                            </div>
                            <div class="type8_title">
                                [보홀] 아모리타 리조트
                            </div>
                            <div class="type8_bottom_tag">
                                보홀 인기 리조트!
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        231,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="type9_type8_innner ">

                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_5.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 5성급 
                            </div>
                            <div class="type8_title">
                                [호놀룰루] 알로힐라니 리조트 와이키키
                            </div>
                            <div class="type8_bottom_tag">
                                깔끔한 시설의 리뉴얼 호텔
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        385,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>

                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_6.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 3성급
                            </div>
                            <div class="type8_title">
                                [뉴욕] 포드 타임스 스퀘어
                            </div>
                            <div class="type8_bottom_tag">
                                타임스퀘어 중심 위치
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        173,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>

                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_7.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 4성급
                            </div>
                            <div class="type8_title">
                                [뉴욕] 뉴욕 힐튼 미드타운
                            </div>
                            <div class="type8_bottom_tag">
                                센트럴 파크 도보 7분
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        334,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>

                    <div class="type8">
                        <a href="#">
                            <div class="type8_img">
                                <img src="../../img/main1_home/type9_type8_8.jpg" alt="">
                            </div>
                            <div class="type8_top_tag">
                                ★ 3.5성급 
                            </div>
                            <div class="type8_title">
                                [호놀룰루] 쉐라톤 프린세스 카이울라니
                            </div>
                            <div class="type8_bottom_tag">
                                와이키키 시내 중심 위치
                            </div>
                            <div class="type8_price">
                                <span>
                                    <strong>
                                        301,000
                                    </strong>
                                </span>
                                <span>원~</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="type9_type8_innner">
                    일본
                </div>

                <div class="type9_type8_innner">
                    대만/홍콩/상해
                </div>

                <div class="type9_type8_innner">
                    괌/사이판
                </div>

                <div class="type9_type8_innner">
                    유럽
                </div>
            </div>

        </div>
    </div>
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    여행 떠나기 전! 미리 준비해보세요🛫️
            </div>
        </div>
    </div>
    
    <!-- prepare_container -->
    <div class="prepare_container">
        <div class="prepare_container_inner">

            <div class="prepare">
                <a href="#">
                    <div class="prepare_img">
                        <img src="https://image.hanatour.com/usr/manual/md/2022/08/PL00113284/bnr_co.jpg" alt="">
                    </div>
                    <div class="prepare_title">
                    	✅ 합리적으로 미리 준비하세요!
                    </div>
                    <strong>
                    	여행자 보험 비교하기
                    </strong>
                </a>
            </div>

            <div class="prepare">
                <a href="#">
                    <div class="prepare_img">
                        <img src="https://image.hanatour.com/usr/manual/md/2022/12/PL00113545/bnr_co.jpg" alt="">
                    </div>
                    <div class="prepare_title">
                    	✅ 떠나기 전 미리 준비하세요!
                    </div>
                    <strong>
                    	전 세계 유심&와이파이
                    </strong>
                </a>
            </div>

            <div class="prepare">
                <a href="#">
                    <div class="prepare_img">
                        <img src="https://image.hanatour.com/usr/manual/md/2023/01/PL00113580/bnr_co.jpg" alt="">
                    </div>
                    <div class="prepare_title">
                    	✅ 공항에서 호텔로 편한 이동
                    </div>
                    <strong>
                    	전 세계 픽업&샌딩
                    </strong>
                </a>
            </div>

            <div class="prepare">
                <a href="#">
                    <div class="prepare_img">
                        <img src="https://image.hanatour.com/usr/manual/md/2022/11/PL00113434/bnr_co.jpg" alt="">
                    </div>
                    <div class="prepare_title">
                    	✅ 편안한 여행의 시작
                    </div>
                    <strong>
                    	전 세계 공항라운지
                    </strong>
                </a>
            </div>
        </div>
    </div>
    
    <div class="bottom_container center">
    	<div class="bottom_consult_box">
    		<div class="bottom_title">투어/입장권 예약상담</div>
    		<div class="bottom_box">
    			<div class="guide_board">
    				<div class="icon_tv"></div>
    				<ul>
    					<li style="margin-top: 0;">투어/입장권 상품 문의는 투어/입장권 상품페이지 내 "상품문의" 게시판을 이용 부탁합니다.</li>
    					<li>투어/입장권 일반 문의는 "<a href="#">고객문의</a>" 게시판을 이용 부탁합니다.</li>
    					<li>투어/입장권 예약, 취소, 결제, 환불은 "<a href="#">자주 찾는 질문</a>" 게시판에서 확인 부탁합니다.</li>
    				</ul>
    			</div>
    			<div class="guide_tel">
    				<div class="icon_question_mark"></div>
    				<ul>
    					<li>Help desk (기타문의)  <strong>1577-1233</strong></li>
    				</ul>
    			</div>
    		</div>
    	</div>
    	<div class="bottom_sell_box">
    		<div class="bottom_title">투어/입장권 판매회원 가입</div>
    		<div class="bottom_box" style="height: 115px !important;">
    			<div class="icon_guide_join"></div>
    			<div class="join_text">
	    			<ul>
	   					<li>투어/입장권 상품 판매는 "<a href="#">판매회원 가입 안내</a>" 페이지에서 별도의 회원가입 후 가능합니다.</li>
	   					<li>판매회원 가입 문의 (해외)<strong>jinie27@hanatour.com</strong></li>
	   				</ul>
   				</div>
    		</div>
    	</div>
    	<div class="bottom_bank_box">
    		<div class="bottom_box" style="height: 108.59px;">
    			<div class="bank_title">하나은행 구매안전 서비스</div>
    			<div class="bank_info">고객님은 안전거래를 위해 현금으로 결제 시 (주)하나투어에서 가입한 하나은행으로 구매안전서비스를 이용하실 수 있습니다.  서비스 가입사실 확인</div>
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
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main_type.js"></script>
</html>