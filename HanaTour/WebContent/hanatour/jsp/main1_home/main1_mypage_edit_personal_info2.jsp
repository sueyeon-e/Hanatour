<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하나투어 : 꿈꾸는 대로, 펼쳐지다</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_mypage_edit_personal_info2.css">

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
    
    
    <div class="container center">
        <div class="container_inner">
            <div class="side_bar">
                <div class="side_bar_inner fl">
                    <div class="side_title">마이페이지</div>
                    <div class="side_bottom_box">
                        <div class="side_box">
                            <a href="#">예약내역</a>
                        </div>
                        <div class="side_box">
                            <a href="#">찜</a>
                        </div>
                        <div class="side_box">
                            <a href="#">1:1문의</a>
                        </div>
                        <div class="side_box">
                            <a href="#">자주 찾는 질문</a>
                        </div>
                        <div class="side_box">
                            <a href="#">MY 여행후기</a>
                        </div>
                        <div class="side_box">
                            <a href="#">개인정보</a>
                        </div>
                    </div>
                    <div class="reserv_list">
                        <a href="#none">
                            <img src="https://image.hanatour.com/usr/static/img/pc/mpg/btn_ticket_history.jpg">
                        </a>
                    </div>
                    <div class="side_banner">
                        <img src="https://image.hanatour.com/usr/manual/md/2020/11/safety/mypage.jpg">
                    </div>
                </div>
            </div>

            

			<div class="container_right">


                <div class="container_right_header">
                    개인정보
                </div>


                <div class="container_right_body">

                    <div class="container_right_body1">
                        <!-- container_tab_active -->
                        <a href="${pageContext.request.contextPath}/FlightController?command=editPersonalInfoEntrance">
                            <div class="container_tab_active">회원정보 수정</div>
                        </a>
                        <a href="${pageContext.request.contextPath}/FlightController?command=editPersonalInfoChangePw">
                            <div class="">비밀번호 변경</div>
                        </a>
                        <a href="${pageContext.request.contextPath}/FlightController?command=editPersonalInfoSNSEntrance">
                            <div class="">SNS연동</div>
                        </a>
                        <a href="${pageContext.request.contextPath}/FlightController?command=editPersonalInfoDeleteAccount">
                            <div class="">회원탈퇴</div>
                        </a>
                    </div>

	
	
						
					<div class="container_right_header2">
                        기본 정보 입력
                    </div>


                    <div class="container_right_body2">

                        <div class="basic_info_name">
                            <div class="basic_info_name_left">이름</div>
                            <div class="basic_info_name_right">
	                        	${sessionScope.loginId != null ? requestScope.hideName : '???'}
                            </div>
                        </div>
                        <!-- basic_info_name -->

                        <div class="basic_info_id">
                            <div class="basic_info_id_left">아이디</div>

                            <div class="basic_info_id_right">

                                <div class="basic_info_id_right1">
                                    <div>
			                        	${sessionScope.loginId != null ? sessionScope.loginId : '???'}
                                    </div>
                                    <div class="basic_info_id_btn1">아이디 변경하기</div>
                                    <div class="basic_info_id_btn2">아이디 중복 체크</div>
                                    <div class="basic_info_id_btn3">아이디 변경</div>
                                </div>

                                <div class="basic_info_id_right2">
                                	<form action="${pageContext.request.contextPath}/FlightController" method="post">
                                		<input type="hidden" name="command" value="editPersonalInfoIdUpdate"/>
                                    	<input 
                                    		type="text" 
                                    		name="user_change_id" 
                                    		placeholder="변경할 아이디를 입력해주세요."
                                    	/>
                                	</form>
                                    <ul>
                                        <li>하나투어닷컴에서는 사용하고 계신 e-mail주소를 아이디로 사용합니다.</li>
                                        <li>e-mail 변경 시 아이디변경하기로 변경 가능</li>
                                    </ul>
                                </div>
                                
                            </div>

                        </div>
                        <!-- basic_info_id -->



                        <div class="basic_info_phone">
                            <div class="basic_info_phone_left">휴대폰번호</div>
                            <div class="basic_info_phone_right">
                                <div>
                                	${sessionScope.loginId != null ? requestScope.hidePhone : ''}
                               	</div>
                                <div class="basic_info_phone_input">
                                	<form action="${pageContext.request.contextPath}/FlightController" method="post">
                                		<input type="hidden" name="command" value="editPersonalInfoPhoneUpdate"/>
                            			<input type="text" name="user_change_phone" placeholder="변경할 휴대폰번호를 입력해주세요."/>
                                	</form>
                                </div>
                                <div class="basic_info_phone_btn1">수정</div>
                                <div class="basic_info_phone_btn2">휴대폰 번호 변경</div>
                            </div>
                        </div>
                        <!-- basic_info_phone -->




                        <div class="basic_info_birth_gender">
                            <div>생년월일/성별</div>
                            <div>
                         		${sessionScope.loginId != null ? requestScope.hideBirth : ''}
                           	</div>
                        </div>
                        <!-- basic_info_birth_gender -->



                        <div class="basic_info_email">
                            <div class="basic_info_email_left">이메일</div>
                            <div class="basic_info_email_right">
                                <div class="basic_info_email_right_input">
                                    <div>
                                    	<form action="${pageContext.request.contextPath}/FlightController" method="post">
                                    		<input type="hidden" name="command" value="editPersonalInfoEmailUpdate"/>
                                        	<input 
                                        		type="text" 
                                        		name="user_email" 
                                        		value=${sessionScope.loginId != null ? requestScope.hideEmail : ''}
                                        		disabled
                                        	/>
                                    	</form>
                                    </div>
                                    <div class="basic_info_email_btn1">이메일 변경하기</div>
                                    <div class="basic_info_email_btn2">이메일 중복 체크</div>
                                    <div class="basic_info_email_btn3">이메일 변경</div>
                                </div>
                                <div class="basic_info_email_right_ul">
                                    <ul>
                                        <li>하나투어닷컴에서는 사용하고 계신 e-mail주소를 아이디로 사용합니다.</li>
                                        <li>e-mail 변경 시 아이디변경하기로 변경 가능.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- basic_info_email -->


                    </div>
                    <!-- container_right_body2 -->


                    <form action="${pageContext.request.contextPath}/FlightController" method="post">
                    	<input type="hidden" name="command" value="editPersonalInfoPassportInfoDelete"/>
                        <div class="container_right_header3">
                            <div class="container_right_header3_left">여권정보 입력</div>
                            <div class="container_right_header3_right">
                                <div>* 여권을 재발급 받으신 경우 여권정보 삭제 후 재등록 가능합니다.</div>
                                <!-- delete_passport_info_active -->
                                <div class="
                                	delete_passport_info
                                	${requestScope.deletePassportInfoActive}
                                ">여권정보 삭제</div>
                            </div>
                        </div>
                    </form>


                    <form action="${pageContext.request.contextPath}/FlightController" method="post">
                    	<input type="hidden" name="command" value="editPersonalInfoPassportInfoUpdate"/>
                        <div class="container_right_body3">
                            <div>
                                <div>영문 성</div>
                                <div>
                                    <input 
                                    	type="text" 
                                    	name="user_last_name" 
                                    	placeholder="${requestScope.lastName}"
                                    	class=""
                                    />
                                </div>
                                <div>영문 명</div>
                                <div>
                                    <input 
                                    	type="text" 
                                    	name="user_first_name" 
                                    	placeholder="${requestScope.firstName}"
                                    	class=""
                                    />
                                </div>
                            </div>
                            <div>
                                <div>여권번호</div>
                                <div>
                                    <input 
                                    	type="text" 
                                    	name="user_passport_number" 
                                    	placeholder="${requestScope.passportNumber}>"
                                    	class=""
                                    />
                                </div>
                                <div>여권 만료일</div>
                                <div>
                                    <input 
                                    	type="text" 
                                    	name="user_expiration_date" 
                                    	placeholder="${requestScope.passportExpirationDate}"
                                    	class=""
                                    />
                                </div>
                            </div>
                            <div>
                                <div>국적</div>
                                <div>
                                	<!-- container_right_body3_red -->
                                    <select name="user_nationality" class="">
                                        <option value="default">
                                        	${requestScope.nationality}
                                        </option>
                                        <option value="kr">(국적) 대한민국</option>
                                        <option value="jp">(국적) 일본</option>
                                        <option value="cn">(국적) 중국</option>
                                        <option value="us">(국적) 미국</option>
                                    </select>
                                </div>
                                <div>발행국가</div>
                                <div>
                                	<!-- container_right_body3_red -->
                                    <select name="user_authority" class="">
                                        <option value="default">
                                        	${requestScope.authority}
                                        </option>
                                        <option value="kr">(발행국가) 대한민국</option>
                                        <option value="jp">(발행국가) 일본</option>
                                        <option value="cn">(발행국가) 중국</option>
                                        <option value="us">(발행국가) 미국</option>
                                    </select>
                                </div>
                            </div>
                            <div class="container_right_body3_agreements">
                                <div>개인정보 수집동의</div>
                                <div>
                                    <div class="">
                                        (필수) <span>개인정보 수집 및 이용</span>에 대해 동의
                                    </div>
                                    <div class="container_right_body3_agree1">
                                        <label for="" class="">
                                            <div>동의합니다</div>
                                            <input type="radio" name="container_right_body3_agree1" value="Y"/>
                                        </label>
                                        <label for="" class="container_right_body3_agree1_active">
                                            <div>동의 하지 않습니다.</div>
                                            <input type="radio" name="container_right_body3_agree1" value="N" checked/>
                                        </label>
                                    </div>
                                    <div class="">
                                        (필수) <span>고유식별 정보 수집 및 처리</span>에 대해 동의
                                    </div>
                                    <div class="container_right_body3_agree2">
                                        <label for="" class="">
                                            <div>동의합니다</div>
                                            <input type="radio" name="container_right_body3_agree2" value="Y"/>
                                        </label>
                                        <label for="" class="container_right_body3_agree2_active">
                                            <div>동의 하지 않습니다.</div>
                                            <input type="radio" name="container_right_body3_agree2" value="N" checked/>
                                        </label>
                                    </div>
                                </div>
                                <div class="passport_img">여권 사진 업로드</div>
                                <div class="passport_img_input">
                                	<div class="passport_ocr">
                                        <!-- file 업로드 -->
                                        <input 
                                            type="file" 
                                            onchange="recognizeFile(window.lastFile=this.files[0])" 
                                            id="passport_ocr_id"
                                        />
                                        <select id="langsel" onchange="window.lastFile && recognizeFile(window.lastFile)">
                                            <option value='eng'selected>English </option>
                                        </select>
                                        <div id="log"></div>
                                    </div>
                                	<div>
                                		여권 사진을 업로드하여 여권번호를 입력할 수 있습니다.
                                		<br/>사진 업로드 후 여권번호가 입력되기 전까지 잠시만 기다려주세요.
                                	</div>
                                </div>
                            </div>
                            <!-- container_right_body3_agreements -->
                        </div>
                        <!-- container_right_body3 -->

                         <div class="passport_info_save">
                            <!-- passport_info_save_active -->
                            <div class="
                                passport_info_save_inner
                            ">
                                여권정보 저장
                            </div>
                         </div>

                    </form>






                    <div class="container_right_header4">
                        마케팅 활용 동의
                    </div>




                    <form action="${pageContext.request.contextPath}/FlightController">
						<input type="hidden" name="command" value="editPersonalInfoEntrance2"/>
                        <div class="container_right_body4">

                            <div class="container_right_body4_top">
                                <div>문자메시지(SMS)</div>
                                <div>
                                    <label for="">
                                        <div>예</div>
                                        <input type="radio" name="container_right_body4_agree1" value="Y"/>
                                    </label>
                                    <label for="" class="container_right_body4_agree_active">
                                        <div>아니오</div>
                                        <input type="radio" name="container_right_body4_agree1" value="N" checked/>
                                    </label>
                                </div>
                                <div>이메일</div>
                                <div>
                                    <label for="">
                                        <div>예</div>
                                        <input type="radio" name="container_right_body4_agree2" value="Y"/>
                                    </label>
                                    <label for="" class="container_right_body4_agree_active">
                                        <div>아니오</div>
                                        <input type="radio" name="container_right_body4_agree2" value="N" checked/>
                                    </label>
                                </div>
                            </div>

                            <div class="container_right_body4_bottom">
                                <div>우편</div>
                                <div>
                                    <label for="">
                                        <div>예</div>
                                        <input type="radio" name="container_right_body4_agree3" value="Y"/>
                                    </label>
                                    <label for="" class="container_right_body4_agree_active">
                                        <div>아니오</div>
                                        <input type="radio" name="container_right_body4_agree3" value="N" checked/>
                                    </label>
                                </div>
                                <div>전화</div>
                                <div>
                                    <label for="">
                                        <div>예</div>
                                        <input type="radio" name="container_right_body4_agree4" value="Y"/>
                                    </label>
                                    <label for="" class="container_right_body4_agree_active">
                                        <div>아니오</div>
                                        <input type="radio" name="container_right_body4_agree4" value="N" checked/>
                                    </label>
                                </div>
                            </div>

                        </div>

                       

                        <div class="container_right_body4_btn">
                            <a href="${pageContext.request.contextPath }/FlightController?command=personalInfoEntrance">
                                <div>취소</div>
                            </a>
                            <a href="">
                                <div>확인</div>
                            </a>
                        </div>



                    </form>	
						
						
						
						
						
						

                    

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
<script src='https://unpkg.com/tesseract.js@4.0.1/dist/tesseract.min.js'></script>

<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_mypage_edit_personal_info2.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/my_page_ocr.js"></script>
</html>
</html>