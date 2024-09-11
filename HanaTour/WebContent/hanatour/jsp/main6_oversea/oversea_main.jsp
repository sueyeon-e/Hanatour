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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/oversea_main.css">
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
                <img src="https://image.hanatour.com/usr/manual/md/2024/07/PM00667E83B2/pc_sm_bnr.jpg" alt="">
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
            <div id="search_box" class="center">
            	<form action="">
	            	<div id="search_city_kw">
	            		<input type="text" title="검색어 입력" placeholder="어디로 떠나세요?" maxlength="50">
	            	</div>
	            	<div id="search_date_kw">
	            		<input type="text" placeholder="2024.09.10 ~ 2024.10.09">
	            	</div>
	            	<div id="search_person_kw">
	            		<input type="text" placeholder="객실1.성인1명">
	            	</div>
	            	<input type="submit" value="숙소 검색" id="btn_hotel_search">
            	</form>
            </div>
            
            <!-- modal -->
            <div id="main_city_kw_container">
            	<div class="main_city_title">주요도시</div>
            </div>
        </div>
    </div>
    
    <!-- type6 -->
    <div class="type6" style="margin-top: 100px;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/md/2024/03/PL00112886/bnr/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
    
      <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    지난 주 가장 많이 팔렸어요! <span style="color: rgb(248, 4, 8);">인기 TOP</span> 호텔 🔥️
            </div>
        </div>
    </div>
    
      <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2022/08/25/10000/1eeb035e-de26-4cda-ba3e-df77a813a8ef.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/04/08/10000/c5b7b21c-18e9-494e-a570-f97a1cc85582.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/09/07/10000/46ead848-3190-4617-85c9-14d63395a791.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2024/03/04/10000/a4f0380f-74df-4ad2-8aff-0f4067ff0e30.png" alt="">
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
    <div class="type6"  style="margin-top: 100px !important;">
        <div class="type6_inner">
            <div class="type6_img">
                <img src="https://image.hanatour.com/usr/manual/update/pc/hotel/1c/bnr_1c_017.jpg" alt="">
            </div>
        </div>
    </div>
    
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    7월은 먹거리+호캉스 성지 ✌ 이달의 도시 "방콕" 🛫️
            </div>
        </div>
    </div>
    
    <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/04/16/20000/b7dcd20a-e800-4f06-a28e-1e5c27a3772e.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/28/10000/03ece0c7-a543-4286-849e-c064d6477927.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/07/13/10000/403b0dbb-3eab-4037-8a68-b0626af43270.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2023/07/13/10000/51035086-c464-4938-84ad-122ef87331f5.jpg" alt="">
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
                <img src="https://image.hanatour.com/usr/manual/md/2022/10/PL00113365/new/bnr_1c.jpg" alt="">
            </div>
        </div>
    </div>
    
        <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    새로 오픈 했어요! <span style="color: rgb(0, 128, 0);">파릇파릇</span> 신규 호텔 🌱️
            </div>
        </div>
    </div>
    
    
     <!-- type8_container -->
    <div class="type8_container">
        <div class="type8_container_inner">

            <div class="type8">
                <a href="#">
                    <div class="type8_img">
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2024/03/22/10000/f9149149-6dc0-4a2e-909f-a22979c2e378.jpg" alt="">
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
                        <img src="https://image.hanatour.com/usr/cms/resize/400_0/2024/02/16/10000/23f5969d-10c8-4b09-b254-c017cbfe073c.jpg" alt="">
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
                    아직도 안 가봤다고-오? 🤦‍♀️ 한 번은 가야할 호캉스 도시 📌️
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
    
     <!--  type4 -->
    <div class="type4">
        <div class="type4_inner">
            <div class="type4_title">
                    해외호텔 토박이가 골라봤어요. 진심 추천 호텔 🌎️
            </div>
        </div>
    </div>
    
     <!-- type9 -->
    <div class="type9">
        <div class="type9_inner"> 

            <div class="type9_tab">
                <div class="type9_tab_active">동남아</div>
                <div>미주</div>
                <div>일본</div>
                <div>대만/홍콩/상해</div>
                <div>괌/사이판</div>
                <div>유럽</div>
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
                    하나투어만의 특별한 혜택!️
            </div>
        </div>
    </div>
    
    <!-- benefit_container -->
    <div class="benefit_container">
        <div class="benefit_container_inner" style="margin-bottom: 180px;">

            <div class="benefit">
                <a href="#">
                    <div class="benefit_img">
                        <img src="https://image.hanatour.com/usr/manual/update/co/cp/021.jpg" alt="">
                    </div>
                    <div class="benefit_title">
                    	롯데/신라/신세계/현대백화점
                    </div>
                    <strong>
                    	4대 면세 쇼핑 혜택
                    </strong>
                </a>
            </div>

            <div class="benefit">
                <a href="#">
                    <div class="benefit_img">
                        <img src="https://image.hanatour.com/usr/manual/update/co/cp/029.jpg" alt="">
                    </div>
                    <div class="benefit_title">
                    	하나만 믿고! 한눈에 비교하는
                    </div>
                    <strong>
                    	국내/해외 여행자 보험
                    </strong>
                </a>
            </div>

            <div class="benefit">
                <a href="#">
                    <div class="benefit_img">
                        <img src="https://image.hanatour.com/usr/manual/update/co/cp/020.jpg" alt="">
                    </div>
                    <div class="benefit_title">
                    	공항철도 직통열차 할인 혜택
                    </div>
                    <strong>
                    	인천 공항철도 할인 혜택
                    </strong>
                </a>
            </div>

            <div class="benefit">
                <a href="#">
                    <div class="benefit_img">
                        <img src="https://image.hanatour.com/usr/manual/update/co/cp/019.jpg" alt="">
                    </div>
                    <div class="benefit_title">
                    	포켓와이파이 하나투어 무료 혜택드림!
                    </div>
                    <strong>
                    	SKT 와이파이 전용 혜택
                    </strong>
                </a>
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
                            <img src="../../img/footer/facebook.png" alt="페이스북">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="../../img/footer/instagram.png" alt="인스타그램">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="../../img/footer/naverblog.png" alt="네이버 블로그">
                        </a>
                    </div>
                    <div >
                        <a href="#">
                            <img src="../../img/footer/kakaoplus.png" alt="카카오 플러스">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="../../img/footer/youtube.png" alt="유튜브">
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <img src="../../img/footer/kakaostory.png" alt="카카오 스토리">
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
                        <img src="../../img/footer/footer2_left.png" alt="">
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
                            <img src="../../img/footer/award-logo-01.png" alt="">
                        </div>
                        <div class="fl">
                            대한민국<br/>100대 브랜드
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="../../img/footer/award-logo-02-2024.png" alt="">
                        </div>
                        <div class="fl">
                            한국능률협회선정<br/>20년연속(2005~2024)<br/>브랜드파워 1위
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div class="fl">
                        <div class="fl">
                            <img src="../../img/footer/award-logo-03-2024.png" alt="">
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
                        <img src="../../img/footer/ico-arrow-left.png" alt="">
                    </button>
                    <button>
                       <img src="../../img/footer/ico-arrow-right.png" alt="">
                   </button>
                </div>
                <!-- footer4_center 종료 -->
                <div class="footer4_right fl">
                    <div>
                        <img src="../../img/footer/korea_brand_awards.jpg" alt="">
                    </div>
                    <div>
                        <img src="../../img/footer/mark_01.png" alt="">
                    </div>
                    <div>
                        <img src="../../img/footer/mark1_eprivacy.png" alt="">
                    </div>
                    <div>
                        <img src="../../img/footer/mark_03_new.png" alt="">
                    </div>
                    <div>
                        <img src="../../img/footer/ico_isms.png" alt="">
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
<script src="../../script/header.js"></script>
<script src="../../script/footer.js"></script>
<script src="../../script/main_type.js"></script>
<script>
	$(function() {
		$("#main_city_kw_container").hide();
		let i=0;
		$("#search_city_kw").click(function(){
			i += 1;
			if(i%2==1) {
				$("#main_city_kw_container").show();
			} else if(i%2==0){
				$("#main_city_kw_container").hide();
			}
		});
	});
</script>
</html>