<%@page import="dao.OverseaHotelSearchDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ArrayList<OverseaHotelSearchDto> listOverseaSearch = (ArrayList<OverseaHotelSearchDto>)request.getAttribute("listOverseaSearch");
	ArrayList<OverseaHotelPrice> listHotelPrice = (ArrayList<OverseaHotelPrice>)request.getAttribute("listHotelPrice");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_type.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main1_1.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/hotel_search.css">
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


	<!-- cursor -->
	<div id="entire_container">
		<div id="search_box">
			<div id="search_box_left">
				<button type="submit" class="search_button" style="top: 16px; left: 21px;"></button>
				<input type="text" name="input_hotel_name" placeholder="오사카" style="color: #111;">
			</div>
			<div id="search_box_right" class="fr">
				<a href="#none" class="search_box fr">숙소검색</a>
				<a href="#none" class="search_box fr">
					<span style="vertical-align: middle;" class="input_room_num">객실1</span>
					<span style="vertical-align: middle;" class="choose_person_num">성인 2명</span>
				</a>
				<a href="#none"class="search_box fr">
					<span class="hotel_search_date">
						2024.08.05 - 2024.08.08
					</span>
					<span style="vertical-align: middle;" class="input_days">1박</span>
				</a>
				<div style="clear: both;"></div>
			</div>
		</div>

		<!-- 검색결과 왼쪽 컨테이너 -->
		<div id="side_bar" class="fl">
			<div id="bar_top">
				<strong class="side_bar_title">결과 내 검색</strong>
				<div>
					<input type="text" name="input" class="search_in_result" placeholder="호텔명/랜드마크를 입력해주세요">
					<div class="fr search_button_box">
						<button class="search_button" style="margin-left: 5px; margin-top: 15px;"></button>
					</div>
				</div>
				<div id="price_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">가격</div>
							</div>
						</summary>
							<div class="details_inner fl">8만원 미만</div>
							<div class="details_inner fl">8 ~ 16만원</div>
							<div class="details_inner fl">16 ~ 27만원</div>
							<div class="details_inner fl">27 ~ 38만원</div>
							<div class="details_inner fl">38만원 이상</div>
					</details>
				</div>
				<div id="popular_filter_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">인기 필터</div>
							</div>
						</summary>
							<div class="details_inner fl">회원특가</div>
					</details>
				</div>
				<div id="inn_rating_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">숙소 평점</div>
							</div>
						</summary>
							<div class="details_inner fl">최고(4.5+)</div>
							<div class="details_inner fl">우수(4+)</div>
							<div class="details_inner fl">좋음(3.5+)</div>
							<div class="details_inner fl">양호(3+)</div>
					</details>
				</div>
				<div id="inn_type_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">숙소 종류</div>
							</div>
						</summary>
							<div class="details_inner fl">호텔</div>
							<div class="details_inner fl">레지던스</div>
							<div class="details_inner fl">리조트</div>
							<div class="details_inner fl">Inn</div>
							<div class="details_inner fl">콘도</div>
							<div class="details_inner fl">산장/롯지</div>
							<div class="details_inner fl">크루즈</div>
							<div class="details_inner fl">캠핑장</div>
							<div class="details_inner fl">골프텔</div>
					</details>
				</div>
				<div id="inn_star_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">숙소 	등급</div>
							</div>
						</summary>
							<div class="details_inner fl">5성급</div>
							<div class="details_inner fl">4성급</div>
							<div class="details_inner fl">3성급</div>
							<div class="details_inner fl">2성급</div>
							<div class="details_inner fl">1성급</div>
							<div class="details_inner fl">성급없음</div>
					</details>
				</div>
				<div id="amenity_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">숙소 부대시설</div>
							</div>
						</summary>
							<div class="details_inner fl">wifi</div>
							<div class="details_inner fl">주차</div>
							<div class="details_inner fl">프론트데스크</div>
							<div class="details_inner fl">여가시설</div>
							<div class="details_inner fl">짐보관 서비스</div>
							<div class="details_inner fl">레스토랑</div>
							<div class="details_inner fl">수영장</div>
							<div class="details_inner fl">기타 서비스</div>
							<div class="details_inner fl">기타 편의시설</div>
							<div class="details_inner fl">조식 서비스</div>
							<div class="details_inner fl">흡연가능</div>
							<div class="details_inner fl">피트니스 센터</div>
							<div class="details_inner fl">셔틀서비스</div>
							<div class="details_inner fl">스파/웰빙</div>
							<div class="details_inner fl">전용 해변</div>
							<div class="details_inner fl">비즈니스 시설</div>
							<div class="details_inner fl">키즈 시설</div>
							<div class="details_inner fl">장애인 편의시설</div>
							<div class="details_inner fl">인터넷</div>
							<div class="details_inner fl">쇼핑시설</div>
							<div class="details_inner fl">전기차 충전소</div>
							<div class="details_inner fl">반려동물 동반</div>
					</details>
				</div>
				<div id="facility_detail">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">객실 편의시설</div>
							</div>
						</summary>
							<div class="details_inner fl">wifi</div>
							<div class="details_inner fl">에어컨</div>
							<div class="details_inner fl">욕실용품</div>
							<div class="details_inner fl">tv</div>
							<div class="details_inner fl">미니바</div>
							<div class="details_inner fl">안전금고</div>
							<div class="details_inner fl">기타 객실시설</div>
							<div class="details_inner fl">객실 편의시설</div>
							<div class="details_inner fl">조리도구,주방기구</div>
							<div class="details_inner fl">발코니/테라스</div>
							<div class="details_inner fl">룸서비스</div>
							<div class="details_inner fl">커피 메이커</div>
							<div class="details_inner fl">전화</div>
							<div class="details_inner fl">엑스트라배드 추가가능</div>
							<div class="details_inner fl">욕실시설</div>
							<div class="details_inner fl">유아용 침대 이용가능</div>
							<div class="details_inner fl">개별온도조절</div>
							<div class="details_inner fl">소파베드</div>
							<div class="details_inner fl">장애인 편의시설</div>
							<div class="details_inner fl">유아용 식탁의자</div>
							<div class="details_inner fl">인터넷</div>
					</details>
				</div>
				<div id="area">
					<details>
						<summary>
							<div class="summary">
								<div class="summary_inner">지역/div>
							</div>
						</summary>
							<div class="details_inner fl">patong</div>
							<div class="details_inner fl">rawai</div>
							<div class="details_inner fl">karon</div>
							<div class="details_inner fl">choeng thale</div>
							<div class="details_inner fl">kamala</div>
							<div class="details_inner fl">phuket</div>
							<div class="details_inner fl">chalong</div>
							<div class="details_inner fl">wichit</div>
							<div class="details_inner fl">sa khu</div>
							<div class="details_inner fl">kathu</div>
							<div class="details_inner fl">ratsada</div>
							<div class="details_inner fl">ko kaeo</div>
							<div class="details_inner fl">ko yao</div>
							<div class="details_inner fl">mai khao</div>
							<div class="details_inner fl">ko racha yai</div>
							<div class="details_inner fl">phuket</div>
							<div class="details_inner fl">maprao island</div>
							<div class="details_inner fl">siray</div>
							<div class="details_inner fl">koh lon</div>
							<div class="details_inner fl">koh he</div>
							<div class="details_inner fl">ppa klok</div>
							<div class="details_inner fl">si sunthon</div>
					</details>
				</div>
<!-- 				<div class="title_box">
				<a href="www.naver.com" class="title_text">가격</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">인기 필터</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">숙소 평점</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">숙소 종류</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">숙소 특징</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">숙소 등급</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">숙소 부대시설</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">객실 편의시설</a>
				</div>
				<div class="title_box">
				<a href="www.naver.com" class="title_text">지역</a> -->
				</div>
			</div>
		<!-- 검색 결과 오른쪽 컨테이너 -->
		<div id="main" class="fr">
			<div id="filter_top" class="fl">
				<div id="filter_top_left" class="fl">
					<span class="filter_icon fl" style="width: 88px; height: 20px; font-size: 17px;">필터</span>
					<span class="fl"></span>
					<span style="clear: both;"></span>
				</div>
				<span></span>
				<div id="filters" class="fl">
					<a href="#none" class="filter_reset" style="padding-top: 9px;">
						<span class="reset_filter">필터초기화</span>
					</a>
				</div>
			</div>
			<div id="map" class="fl">
				<div class="fr">
					<strong>지도로 보기</strong>
					<div class="fr map_off">
						OFF <!-- <input type="checkbox" id="show_map">      	클릭>>동그라미 위치 바뀔 수 있도록 만들기-->
					</div>
				</div>
			</div>	
			<div id="align" class="fl">
				<a href="#none" class="fl align_atag_purple">1박 최저가</a>

				<a href="#none" class="fr align_atag">상품평 높은순</a>
				<a href="#none" class="fr align_atag">성급 낮은순</a>
				<a href="#none" class="fr align_atag">성급 높은순</a>
				<a href="#none" class="fr align_atag">가격 낮은순</a>
				<a href="#none" class="fr align_atag">가격 높은순</a>
				<a href="#none" class="fr align_atag_purple" style="text-decoration: none;">추천순</a>
			</div>
			<div style="clear:both;">
			<span style="clear:both;">
			<div id="banner1">
				<div>
					<em>회원 특가란?</em>
					<em style="color: #333;">하나투어 고객에게 드리는 </em>
					<em>스페셜 최저가</em>
				</div>
				<span class="fr"><img src="img/icon_close.png"></span>
			</div>
			<div id="banner2">
				<img src="https://image.hanatour.com/usr/static/img/pc/temp/banner_htl01.png">
			</div>
			
			<!-- 여기 -->
			<% for(OverseaHotelSearchDto dto: listOverseaSearch)  {%>
			<div class="product">
			
				<!-- 리스트로 바꿔서 값 넣기! -->
				<form action="ControllerOversea">
					<input type="hidden" name=command value="oversea_hotel_detail">
						<input type="image" src="<%=dto.getMinImgUrl() %>" class="product_img" >
				<div id="hotel_price" class="fr">
					<div class="fr">
					<% for(OverseaHotelPrice pDto: listHotelPrice) {%>
						<% if(dto.getInnIdx()==pDto.getInnIdx()){ %>
							<span class="price_static">1박 기준</span>
							<span class="price_num"><%=pDto.getPrice() %></span>
							<span>원~</span>
						<% } %>
					<% } %>
					</div>
					<div class="fr price_contain">객실 세금/봉사료 포함</div>
					<div class="fr" style="margin-top: 64.5px;">
						<a href="#none" id="zzim" class="button_top fl">
						</a>
						<a href="#none"id="compare" class="button_top fl" style="margin-left:6px; text-decoration: none; color: #333;"  >비교</a>
					</div>
					<input type="submit" id="show_detail" class="button_bottom fr" value="상세보기">		
					<input type="hidden" name="innIdx" value="<%=dto.getInnIdx()%>">
					<input type="hidden" name="inputCheckin" value="240805">
					<input type="hidden" name="inputCheckout" value="4">
					<input type="hidden" name="roomNum" value="1">
					<input type="hidden" name="inputPersonnel" value="2">
					
				</div>
				<div id="hotel_info" class="fr">
					<div>
						<strong class="strong"><%=dto.getInnKor() %></strong>
						<span class="rating"><%=dto.getStar() %>성급</span>
					</div>
					<div class="hotel_eng"><%=dto.getInnEng() %></div>
					<div id=location>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_note.png" class="location_icon">
							<%=dto.getPurpleBox() %>
						</div>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_location_line_12.png" class="location_icon">
							<%=dto.getFamousSpot() %>
						</div>
					</div>
					<div id="hotel_info_bottom">
						<div id="hotel_info_bottom1">
							<div>
								#스페셜 베네핏
							</div>
						</div>
						<div id="hotel_info_bottom2">
							<div>
								<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_star_solid_12.png" class="star">
								<span><%=dto.getReviewRating() %></span>
								<span class="rating_level">우수</span>
								<span class="review_num"><%=dto.getReviewCount() %>개의 후기</span>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
			<% } %>
			<div class="product">
			
				<!-- 리스트로 바꿔서 값 넣기! -->
				<img src="https://image.hanatour.com/usr/cms/resize/400_0/2022/09/28/10000/2b8473c9-a011-4497-89b9-3e6e7dfd45fd.jpg" class="product_img">

				<div id="hotel_price" class="fr">
					<div class="fr">
						<span class="price_static">1박 기준</span>
						<span class="price_num">227,271</span>
						<span>원~</span>
					</div>
					<div class="fr price_contain">객실 세금/봉사료 포함</div>
					<div class="fr" style="margin-top: 64.5px;">
						<a href="#none" id="zzim" class="button_top fl">
						<img src="img/icon_zzim_empty.png" style="width: 18px; height: 18px; vertical-align: middle">
						</a>
						<a href="#none"id="compare" class="button_top fl" style="margin-left:6px; text-decoration: none; color: #333;"  >비교</a>
					</div>
					<a href="#none" id="show_detail" class="button_bottom fr">상세보기</a>		
				</div>
				<div id="hotel_info" class="fr">
					<div>
						<strong class="strong">칼리마 리조트 & 스파, 푸켓 - SHA Extra Plus</strong>
						<span class="rating">5성급</span>
					</div>
					<div class="hotel_eng">KALIMA RESORT AND SPA</div>
					<div id=location>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_note.png" class="location_icon">
							파통 비치 부근에 위치
						</div>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_location_line_12.png" class="location_icon">
							Patong 칼림 비치 1.09km 파통 비치 2.63km
						</div>
					</div>
					<div id="hotel_info_bottom">
						<div id="hotel_info_bottom1">
							<div>
								#스페셜 베네핏
							</div>
						</div>
						<div id="hotel_info_bottom2">
							<div>
								<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_star_solid_12.png" class="star">
								<span>4.3</span>
								<span class="rating_level">우수</span>
								<span class="review_num">981개의 후기</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="product">
				<!-- 리스트로 바꿔서 값 넣기! -->
				<img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/03/26/840000/9ba61bf7-95bc-4f68-bdea-6df4871e5788.jpg" class="product_img">

				<div id="hotel_price" class="fr">
					<div class="fr">
						<span class="price_static">1박 기준</span>
						<span class="price_num">125,692</span>
						<span>원~</span>
					</div>
					<div class="fr price_contain">객실 세금/봉사료 포함</div>
					<div class="fr" style="margin-top: 64.5px;">
						<a href="#none" id="zzim" class="button_top fl">
						<img src="img/icon_zzim_empty.png" style="width: 18px; height: 18px; vertical-align: middle">
						</a>
						<a href="#none"id="compare" class="button_top fl" style="margin-left:6px; text-decoration: none; color: #333;"  >비교</a>
					</div>
					<a href="https://m.naver.com/" id="show_detail" class="button_bottom fr">상세보기</a>		
				</div>
				<div id="hotel_info" class="fr">
					<div>
						<strong class="strong">홀리데이 인 리조트 푸켓, IHG 호텔</strong>
						<span class="rating">4성급</span>
					</div>
					<div class="hotel_eng">HOLIDAY INN RESORT PHUKET</div>
					<div id=location>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_note.png" class="location_icon">
							방라 로드 부근에 위치
						</div>
						<div class="location_text">
							<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_location_line_12.png" class="location_icon">
							Patong 방라 로드 0.67km 정실론 쇼핑센터 0.72km
						</div>
					</div>
					<div id="hotel_info_bottom">
						<div id="hotel_info_bottom1">
							<div>
								#스페셜 베네핏
							</div>
						</div>
						<div id="hotel_info_bottom2">
							<div>
								<img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_star_solid_12.png" class="star">
								<span>4.4</span>
								<span class="rating_level">우수</span>
								<span class="review_num">966개의 후기</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
</div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main_type.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main1_home.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>

</html>