<%@page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<%@page import="dao.PaymentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
	// Dao
	PaymentDao pDao = new PaymentDao();

	// Dto 
	PaymentPriceDto dto = (PaymentPriceDto)request.getAttribute("dto");	// 가격정보
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/payment.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/header.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/footer.css">
</head>
<body>
	<%@ include file="header.jsp" %>  
    <form action="">
	    <div id="payment_background-color">
			<div id="payment_page" class="center">
				<div id="payment">
					<div>결제하기</div>
					<div>
						<div>결제상세내역</div>
						<div>
							<div class="fl">총 상품금액</div>
							<div class="fr">
								<strong class="comma">
										${totalPrice}원
								</strong>
							</div>
							<div style="clear:both;"></div>
						</div>
						<div>
							<div class="fl">전액결제</div>
							<div class="fr">
								<strong class="comma">
										${totalPrice}
								</strong>
								원
							</div>
							<div style="clear:both;"></div>
						</div>
						<div>
							<div class="fl">총 할인금액</div>
							<div class="fr"><strong>0원</strong></div>
							<div style="clear:both;"></div>
						</div>
						<div class="purple_font">
							<div class="fl"><strong>최종 결제금액</strong></div>
							<div class="fr">
								<strong class="comma" id="reservation_parameter">
										${totalPrice}
								</strong>
								원
							</div>
							<div style="clear:both;"></div>
						</div>
						<div>
							<div class="fr grey_font">유류할증료 &제세공과금 포함</div>
							<br/>
							<div class="fr grey_font">하나투어 마일리지 <span class="red_font">적립 불가</span> 상품</div>
							<div style="clear:both;"></div>
						</div>
					</div>
			
				</div>
				<div></div>
				<div id="payment_method">
						<div>
							<div class="title">결제상세 내역</div>
						</div>
						
						<div>
							<div>
								<input type="radio" id="kakao" value="kakao" name="payment_method" />
								<label for="kakao">카카오페이</label>
								<label for="kakao"><span class="kakao_img"></span></label>
							</div>
						</div>
						<div id="pay_button">
							<div>	
								<button type="button" id="payButton" class="button_base_big">
									<div>결제하기</div>
									<input type="hidden" id="payTotalMoney" name="totalPrice" value="${totalPrice}">
								</button>
							</div>	
						</div>
				</div>
			</div>
		</div>
		
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
<script src="${pageContext.request.contextPath}/hanatour/script/payment.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/header.js"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/footer.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</html>