<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String startDate = (String)request.getAttribute("startDate");
	int goodsIdx = (Integer)request.getAttribute("goodsIdx");
	int totalPrice = (Integer)request.getAttribute("totalPrice");

	request.getAttribute("totalPrice");
/* 	String paramTotalPrice = request.getParameter("totalPrice");
	int totalPrice = Integer.parseInt(paramTotalPrice); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_type.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main1_1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/tour_order.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
	<title>Insert title here</title>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
	
		    let announcement = document.querySelectorAll('.footer1_announcement > a');
		    let idx = 0;
	
		    setInterval(function() {
		        announcement[idx].classList.remove('footer1_active');
		        idx++;
		        if(idx == announcement.length) {
		            idx = 0;
		        }
		        announcement[idx].classList.add('footer1_active');
	
		    }, 2000);
		})
	</script>
	<script>

	document.getElementById("menu_left").addEventListener("click", function() {
	    // alert("menu_left 클릭");


	    let smContainer = document.getElementById("sub_menu_container");

	    if(smContainer.classList.contains("smc_hide")) {
	        smContainer.classList.remove("smc_hide");
	    } else {
	        smContainer.classList.add("smc_hide");
	    }

	    let menuLeft = document.getElementById("menu_left");
	    if(menuLeft.classList.contains("ml_border_change")) {
	        menuLeft.classList.remove("ml_border_change");
	    } else {
	        menuLeft.classList.add("ml_border_change");
	    }
	   
	})
	</script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
function submitButton() {
    if(	$("input[name='check2']").is(":checked") &&
        	$("input[name='check3']").is(":checked") &&
        	$("input[name='check4']").is(":checked") 
        	) {
        	$("input[name='btn_payment']").prop("disabled", false);
        } else {
        	$("input[name='btn_payment']").prop("disabled", true);
        }
}
$(function() {
    $("#same").click(function(){
    	let name = $("#user_name").val();
    	let phoneNum = $("#user_phone_num").val();

 		$.ajax({
 			type: 'post',
 			url: '<%=request.getContextPath() %>/TourTotalPriceServlet',
 			data: {name: name, phoneNum: phoneNum},
 			success: function(response) {
 				$("#reserv_name").val(response.name);
 				$("#reserv_phone").val(response.phoneNum);
 			},
 			error: function(r, s, e) {
 				console.error("에러 발생" + e)
 			}
 		});
 		/* $("input[name='check1']").click(function(){
			if($(this).prop("checked")) {
				$(".checkbox").prop("checked", true);
			} else {
				$(".checkbox").prop("checked", false);
			}	
 		});
 		$(".checkbox").click(function(){
 			if($(".checkbox:checked").length == 3) {
 				$("input[name='check1']").prop("checked", true);
 			} else {
 				$("input[name='check1']").prop("checked", false);
 			}
 		}); */
    });
    
    submitButton();
    $("input[name='check2'], input[name='check3'], input[name='check4']").change(submitButton);

});

</script>

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

<form>
	<div id="order_top" class="center center">
		ORDER
	</div>
	<div id="order_info" class="center">
		<div>기본주문정보</div>
	</div>
	<div><table id="content_table" class="center">	<!-- : order_info_content -->
			<tr>
				<th>이름<span class="essential">*</span></th>
				<td><input id="user_name" type="text" class="input_box" placeholder="김수연"></td>
			</tr>
			<tr class="tr_top" style="border-top: 1px solid #e5e5e5;">
				<th>이메일<span class="essential">*</span></th>
				<td><input type="text" class="input_box"></td>
			</tr>
			<tr class="tr_top" style="border-top: 1px solid #e5e5e5;" >
				<th>휴대전화 번호<span class="essential">*</span></th>
				<td>
					<select class="input_box_phone1" style="color: #333;">
						<option>대한민국 (+82>)</option>
						<option>괌 (+1-671)</option>
					</select>
					<input id="user_phone_num" type="text" class="input_box_phone2" placeholder="휴대전화 번호">
				</td>
			</tr>
		</table>
	</div>
	<div id="goods_info_title" class="center">
		<div id="good_info" >상품정보</div>
	</div>
	<div id="goods_info" class="center">
		<div id="seller">
			<img src="https://static.hanatour.com/profile/2021/10/25/0444jjradj/medium.png">
			<span>하나투어</span>
			
		</div>
		<div id="info_detail" style="line-height: 1.2;">
			<div id="goods_name">[파리] 프랑스 디즈니랜드 티켓 예약 입장권 1일</div>
			<div id="type_info">
				<div>
					<strong class="type_text">상품타입</strong>
					<span class="type_text2">[파리]디즈니랜드 1일권 - Tier 1</span>
				</div>
				<div class="line_interval">
					<strong class="type_text">사용일</strong>
					<span class="type_text2">2024년 9월 10일</span>
				</div>
				<div class="line_interval">
					<strong class="type_text">상품타입 수량</strong>
					<span class="type_text2">모든연령 비용동일 × 2</span>
				</div>
				<div>주문완료 단계까지 무료 취소 가능</div>
			</div>
			<div id="dot_line">
				<div>
				</div>																									
			</div>
			<div id="reserv_perseon_title">
				<span class="reserv_person_text" style="margin-bottom: 33px;">예약자 정보</span>
				<span style="float: right;">
				<label for="same">주문자 정보와 동일</label>
				<input id="same" type="checkbox" name="order_person" value="person"></span>
			</div>
			<div id="reserv_info_table">
				<table>
					<tr style="border-bottom: 1px solid #e5e5e5;">
						<th class="table2">영문 이름(여권기준)<span class="essential">*</span></th>
						<td style="width: 84.91%;"><input type="text" name="first_name" placeholder="ex.GILDONG" class="input_right"></td>
					</tr>
					<tr style="border-bottom: 1px solid #e5e5e5;">
						<th class="table2">영문 성(여권기준)><span class="essential">*</span></th>
						<td style="width: 84.91%;"><input type="text" name="last_name" placeholder="ex.HONG" class="input_right"></td>
					</tr>
					<tr style="border-bottom: 1px solid #e5e5e5;">
						<th class="table2">성명</th>
						<td style="width: 84.91%;"><input id="reserv_name" type="text" name="name" placeholder="한글성명(ex. 김하나)" class="input_right"></td>
					</tr>
					<tr>
						<th class="table2">긴급연락처 전화번호<span class="essential"></br>*</span></th>
						<td style="width: 84.91%;"><input id="reserv_phone" type="text" name="phone_num" placeholder="긴급연락처 전화번호(ex. 01012345678)" class="input_right"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="discount_title">
			<div class="title_text">쿠폰할인</div>
		</div>
		<div id="discount" class="discount">
			<div>
				<span>적용된 쿠폰이 없습니다.</span>
				<input type="submit" value="할인 쿠폰 선택" class="button fr">
			</div>
		</div>
		<div id="recommend_code_title">
			<div class="title_text">대리점 추천 코드</div>
			<div></div>
		</div>
		<div id="recommend_code">
			<div>
				<input type="text" name="code" class="code_box">
				<span style="padding:15px;">※대리점을 통한 예약 시에만 입력해 주세요.</span>
			</div>
		</div>
		<div id="pay" class="title_text">결제방법 선택</div>
		<div style="height: 23px;"></div>
		<div id="pay_box">
			<div class="border"> 
				<input id="payment" type="radio" name="method">
				<label for="payment" class="label_inner">신용카드</label>
			</div>
		</div>
		<div id="entire_check">
			<span>
				<input type="checkbox" name="check1" value="all">
			</span>
			<span class="agreement_bold">내용을 모두 확인하였으며 결제에 동의합니다.</span>
		</div>
		<div id="box1">
			<div class="box_top">
				<span>
					<input type="checkbox" name="check2" value="a" class="checkbox">	
				</span>
				<span class="agreement_bold">개인정보 수집 및 이용 동의</span>
				<span class="agreement_bold" style="color:#e55973;">(필수)</span>	
			</div>
			<div>
				<div id="box_inner">
					<p>회사는 여행상품의 예약 및 여행 관련 서비스 제공 등의 업무처리를 위하여 고객으로부터 최소한의 필수정보를 수집하며, 제공한 모든 개인정보는 별도의 동의가 없는 한 해당 목적 이외의 다른 목적으로 사용하지 않습니다.</p>
					<p>고객님은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있습니다. 동의를 거부할 경우 여행상품 예약 서비스 이용이 불가함을 알려드립니다.</p>
					<p style="height: 0;"></p>
					<table class="agree_chekbox1_table">
						<tr>
							<th class="agree1_th1">개인정보 내역</th>
							<th class="agree1_th2">용도</th>
							<th class="agree1_th3">보유 및 이용기간</th>
						</tr>
						<tr>
							<td class="agree1_td">예약자 : 성명, 생년월일, 연락처, 이메일, 주소</td>
							<td class="agree1_td">여행상품 예약 및 상담, 항공지연 안내</td>
							<td class="agree1_td" style="font-weight: 800;">일반 개인정보 : 여행출발일로부터 5년 후 파기 및 또는 관계 법령에 따른 보존기간까지</td>
						</tr>
						<tr>
							<td class="agree1_td">성명, 생년월일,연락처, 이메일</td>
							<td class="agree1_td">내부방침 상 반복된 악성민원 제기로 인한 이용자 본인확인 및 서비스 제한</td>
							<td class="agree1_td" style="font-weight: 800;">접수일로부터 5년</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="box2" class="fl">
			<div class="box_top" style="width: 588px; height: 57.5px;">
				<span>
					<input type="checkbox" name="check3" value="a" class="checkbox">
				</span>
				<span class="agreement_bold">취소 및 환불정책</span>
				<span class="agreement_bold" style="color:#e55973;">(필수)</span>
			</div>
			<div class="box_inner_bottom">
				<div id="agree_wrap2">
					<div class="agree2_title">제1조 (규정의 적용범위)</div>
					<p>본 규정은 당사의 홈페이지의 투어/입장권메뉴에서 판매하는 투어/입장권 상품에 한하여 적용됩니다.</p>
					<br/>
					<div class="agree2_title">제2조 (투어/입장권 상품의 상세내역)</div>
					<p>당사 홈페이지에 판매하는 투어/입장권 상품의 상세내역(상품의 세부사양, 취소규정 등)은 홈페이지에 고지한 사항에 따릅니다.</p>
					<br/>
					<div class="agree2_title">제3조 (상품의 예약 및 확정)</div>
					<p></p>
					<ol>
						<li class="list_one">여행자는 홈페이지에서 투어/입장권 상품을 구매할 수 있으며, 본 규정에 동의해야 합니다.</li>
						<li class="list_two">여행자는 전 항의 규정에 동의하지 않을 수 있으나, 동의하지 않을 경우, 투어/입장권 상품을 구매할 수 없습니다.</li>
						<li class="list_three">여행자가 홈페이지에서 투어/입장권 상품을 구매하는 것으로 예약의 확약을 보장하는 것은 아니며,당사는 여행자에게 실제 그 투어/입장권 상품 공급이 가능한지 검토 후 예약을 확정하여 통지합니다.</li>
						<li class="list_four">전 항에 따라 당사가 예약을 확정한 경우, 당사와 여행자간 계약이 체결된 것으로 봅니다.</li>
					</ol>
					<br/>
					
				</div>
			</div>
		</div>
		<div id="box3" class="fl">
			<div class="box_top" style="width: 588px; height: 57.5px;">
				<span>
					<input type="checkbox" name="check4" value="a" class="checkbox">
				</span>
				<span class="agreement_bold">개인정보 제 3자 제공</span>
				<span class="agreement_bold" style="color:#e55973;">(필수)</span>
			</div>
			<div class="box_inner_bottom">
				<div id="agree_wrap3">
					<p>고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송(예약), 고객상담이 제한됩니다</p>
					<table id="agree_box3">
						<tr>
							<th class="agree3_th">제공 받는자</th>
							<td class="agree3_td">하나투어</td>
						</tr>
						<tr>
							<th class="agree3_th">목적</th>
							<td class="agree3_td">주문 상품의 배송(예약), 고객상담 및 불만처리</td>
						</tr>
						<tr>
							<th class="agree3_th">항목</th>
							<td class="agree3_td">예약자 : 이름 , 이메일, 휴대전화번호
								여행자 : 영문 이름(여권기준), 영문 성(여권기준), 성명, 생년월일</td>
						</tr>
						<tr>
							<th class="agree3_th">보유기간</th>
							<td class="agree3_td">구매확정 후 3개월까지</td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
				
	</div>
	<div id="final_bottom_box">
		<div id="bottom_box_inner" style="position: relative;">
			<div class="fl">
				<strong class="bottom_text1">주문금액</strong>
				<div class="bottom_text2"><%=totalPrice %>원</div>
				<div class="bottom_text3">상품금액 합계 <%=totalPrice %>원</div>
				<div class="bottom_text3" style="margin-top: 8px;">배송비 합계 0원</div>
				<div style="clear:both;"></div>
			</div>
			<div class="fl">
				<strong class="bottom_text1">할인금액</strong>
				<div class="bottom_text2">0원</div>
				<div class="bottom_text3">배송비 할인 0원</div>
				<div class="bottom_text3" style="margin-top: 8px;">쿠폰 0원</div>
				<div style="clear:both;"></div>
			</div>
			<div class="fl">
				<strong class="bottom_text1">결제금액</strong>
				<div class="bottom_text2" style="color: #5e2BB8"><%=totalPrice %>원</div>
				<div class="bottom_text3">하나투어 상품권 및 마일리지 적립, 결제불가 상품 입니다.</div>
				<div style="clear:both;"></div>
			</div>
		</div>
	</div>
	<div class="circle" style="margin-top: -155px; margin-left: 537px;">+</div>
	<div class="circle" style="margin-top: -155px; margin-left: 937px;">=</div>
	<div style="clear:both;"></div>
	<div id="btn_pay" class="center">
		<input type="submit" name="btn_payment" value="결제하기" class="button">
	</div>
	<div style="width: 1497px; height:225px;"></div>
</form>

 <!-- <div style="height: 2000px; background-color: lightgoldenrodyellow;"></div> -->

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
<script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>

<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main_type.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/main1_home.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>
</html>
