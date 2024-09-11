<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//getAttribute
	String countryCity = (String)request.getAttribute("countryCity");
	ArrayList<RecommendPackageOneInfoDto> recommendPackageOneInfo = (ArrayList<RecommendPackageOneInfoDto>)request.getAttribute("recommendPackageOneInfo"); // 해외여행 추천 한줄 정보
	ArrayList<RecommendPackageDateDto> recommendPackageDate =  (ArrayList<RecommendPackageDateDto>)request.getAttribute("recommendPackageDate"); // 해외여행 추천 출발일 도착일 정보
	ArrayList<RecommendPackageCityDto> recommendPackageCity = (ArrayList<RecommendPackageCityDto>)request.getAttribute("recommendPackageCity"); // 추천 해외여행 지역 
	ArrayList<RecommendAttractionTopDto> recommendAttractionTop = (ArrayList<RecommendAttractionTopDto>)request.getAttribute("recommendAttractionTop"); // 추천여행지 
	ArrayList<RecommendHotelDto> recommendHotel = (ArrayList<RecommendHotelDto>)request.getAttribute("recommendHotel"); // 추천 호텔 
	ArrayList<RecommendTicketDto> recommendTicket = (ArrayList<RecommendTicketDto>)request.getAttribute("recommendTicket");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
	  <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
	  <link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/main_search.css">
	  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="header.jsp" %>     
    <!-- main 시작 -->
    <form action="page2">
	     <div id="main" class="center">
	     	<div class="center fl">
	     		<span class="purple_font"><%=countryCity %></span> 검색결과
	     	</div>
	     	<div id="oversea">
		     	<div class="border-bottom fl">
		     		<div class="big_font fl"><strong>해외여행</strong></div>
		     		<button type="submit" class="fr button">
		     			<div class="fl">해외여행 더보기</div>
		     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/icon_arrowright_32_black@3x.png">
		     		</button>
		     	</div>
		     	<!-- 여기 -->
		     	<%
		     		for(RecommendPackageOneInfoDto dto : recommendPackageOneInfo) {
		     	%>
			     	<div class="fl content_box grey_border ">
			     		<div class="fl">
			     			<img src="<%=dto.getImgUrl() %>" alt="해외여행 이미지" />
			     		</div>
			     		<div class="fl">
			     			<div><strong><%=dto.getPackageName() %></strong></div>
			     			<div>
			     				<div class="fl"><%=dto.getTravelPeriod() %> </div>
			     				<%
			     					for(RecommendPackageDateDto dateDto: recommendPackageDate) {
			     						if(dateDto.getPackageIdx() == dto.getPackageIdx()) {
			     				%>
			     					<div class="fl"><%=dateDto.getDepartureDate() %> ~ <%=dateDto.getArrivalDate()%></div>
			     				<%
			     						}
			     					}
			     				%>
			     				<div style="clear:both;"></div>
			     			</div>
			     			<div>
			     				<img class="fl" src="<%=dto.getLogo() %>" alt="항공사 이미지"/>
			     				<div class="fl"><%=dto.getName() %></div>
			     				<% 
			     					if(dto.getGuide().equals("T")) { 
			     				%>
			     					<div class="fl">가이드 동행</div>
			     				<%	
			     					} else {
			     				%>
			     					<div class="fl">가이드 비동행</div>
			     				<%
			     					}
			     				%>
			     				<% 
			     					if(dto.getShopping().equals("T")) { 
			     				%>
			     					<div class="fl"><%=dto.getShoppingTimes() %></div>
			     				<%	
			     					} else {
			     				%>
			     					<div class="fl">쇼핑없음</div>
			     				<%
			     					}
			     				%>
			     				
			     				<div style="clear:both;"></div>
			     			</div>
			     			<div>
			     				<div class="fl">패키지</div>
			     				<div class="fl"><%=dto.getBrand()%></div>
			     				<div class="fl">관광</div>
			     				<%
			     					if(dto.getGroupTravel().equals("T")) {	
			     				%>
			     					<div class="fl">단체</div>
			     				<%
			     					} else {
			     				%>
			     					<div class="fl">우리끼리여행</div>
			     				<%
			     					}
			     				%>
			     				<div style="clear:both;"></div>
			     			</div>
			     			<div>
			     				<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/ic_location_line.png" alt="위치표시"/>
			     				<div class="fl">
			     					<% 
			     						for (RecommendPackageCityDto cityDto : recommendPackageCity) { 
			     							if(cityDto.getPackageIdx() == dto.getPackageIdx()) {
			     					%>
			     							<%=cityDto.getCityName()%>
			     					<%
			     							}
			     						}
			     					%>
			     				</div>
			     				<div style="clear:both;"></div>
			     			</div>
			     			<div>
			     				<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/ic_star_solid.png" alt="보라색 별" />
			     				<div class="fl"><b><%=dto.getReviewStar() %></b></div>
			     				<div class="fl">(<%=dto.getReviewStar() %>)</div>
			     				<div style="clear:both;"></div>
			     			</div>
			     		</div>
			     		<div class="fl">
				     		<div><span><strong class="comma"><%=dto.getAdult() %></strong></span>원</div>
				     		<button type="button">
				     			<div>패키지 상세 보기<img src="https://image.hanatour.com/usr/static/img2/pc/its/ic_arrow@3x.png" alt="하단 화살표"></div>
				     		</button>
				     	</div>
				     	<div style="clear:both;"></div>
			     	</div>
		     	<%
		     		}
		     	%>
	     	
	     	<div id="inn"> <!-- 호텔 시작 -->
	     		<div class="border-bottom fl">
		     		<div class="big_font fl"><strong>호텔</strong></div>
		     		<button type="submit" class="fr button">
		     			<div class="fl">호텔 더보기</div>
		     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/icon_arrowright_32_black@3x.png">
		     			<div style="clear:both;"></div>
		     		</button>
		     	</div>
		     	
		     	<% for (RecommendHotelDto dto : recommendHotel) { %> 
		     	<form action="<%= request.getContextPath() %>/hanatour/jsp/main6_oversea/oversea_hotel_detail.jsp?innIdx=<%= dto.getInnIdx() %>"> <!-- 언니 파라미터 받아야 함 -->
			     	<button type="submit" class="inn_content_box fl inn_margin-right">
			     		
			     		<img class="fl" src="<%=dto.getInnImgUrl() %>" alt="숙소 이미지"/>
			     		<div class="fl"><strong><%=dto.getInnKor() %></strong></div>
			     		<div class="fl">
			     			<div class="fl"><%=dto.getInnType() %></div>
			     			<div class="fl"><%=dto.getStar() %>급</div>
			     			<div style="clear:both;"></div>
			     		</div>
			     		<div class="fl"><%=dto.getCityName() %></div>
			     		<div class="fl">
			     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/ic_star_solid.png" alt="보라색별" />
			     			<div class="fl"><b><%=dto.getReviewAvg() %></b></div>
			     			<div class="fl">(<%=dto.getReviewNum() %>)</div>
			     			<div style="clear:both;"></div>
			     		</div>
			     		<div class="fl"><span><strong><%=dto.getMinPrice() %></strong></span>원~</div>
			     		<div style="clear:both;"></div>
			     	</button>
		     	</form>
		     	<% } %>
	     	</div><!-- 호텔 끝 -->
	     	
	     	<div id="ticket"><!-- 투어입장권 시작 -->
	     		<div class="border-bottom fl">
		     		<div class="big_font fl"><strong>투어/입장권</strong></div>
		     		<button type="submit" class="fr button">
		     			<div class="fl">투어/입장권 더보기</div>
		     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/icon_arrowright_32_black@3x.png">
		     		</button>
		     	</div>
		     	
		     	<% for(RecommendTicketDto dto : recommendTicket) { %>
			     	<button type="submit" class="ticket_content_box fl border ticket_margin-right">
			     		<img src="<%=dto.getMinImgUrl() %>" alt="투어/입장권 이미지"/>
			     		<div><strong><%=dto.getGoodsName() %></strong></div>
			     		<div class="fl"><%=dto.getGoodsTicketType() %></div>
			     		<div class="fl"><%=dto.getCityName() %></div>
			     		<div class="fl">
			     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/ic_star_solid.png" alt="보라색별" />
			     			<div class="fl"><b><%=dto.getAvgRating() %></b></div>
			     			<div class="fl">(<%=dto.getReviewCount() %>)</div>
			     			<div style="clear:both;"></div>
			     		</div>
			     		<div class="fl"><span><strong><%=dto.getMinTypePrice() %></strong></span>원</div>
			     		<input type="hidden" name="ticketIdx" value="<%=dto.getGoodsIdx()%>">
			     		<div style="clear:both;"></div>
			     	</button>
		     	<% } %>
		     	
		     	
		     	<div style="clear:both;"></div>
		     	
	     	</div><!-- 투어입장권 종료 -->
	     	
	     	
	     	<div id="attraction"><!-- 추천여행지 시작 -->
	     		<div class="border-bottom">
		     		<div class="big_font fl"><strong>추천여행지</strong></div>
		     		<div style="clear:both;"></div>
		     	</div>
		     	<div class="attraction_content_box">
		     	
		     		<div id="recommend_top">
		     			<% 
		     				int cnt = 0;
		     				for(RecommendAttractionTopDto dto : recommendAttractionTop) {
		     					cnt++;
		     			%>
			     			<div class="recommend_circle fl ">
			     				<img src="<%=dto.getImgUrl() %>" alt="동그라미 이미지"/>
			     				<div> <%=dto.getAttractionKor() %> </div>
			     			</div>
		     			<%
		     				}
		     			
		     			%>
		     			<div style="clear:both;"></div>
		     		</div> 
		     		<div id="recommend_middle">
		     		<% 
		     			for(RecommendAttractionTopDto dto : recommendAttractionTop) {
		     		%>
			     		<div class="attraction_ex">
				     		 <img class="fl" src=" <%=dto.getImgUrl() %>" alt="네모난 이미지" />
				     		 <div class="fl">
				     		 	<div><strong><%=dto.getAttractionKor() %></strong></div>
				     		 	<div><%=dto.getDetailedEx() %></div>
				     		 </div>
				     		 <div style="clear:both;"></div>
			     		 </div>
			     	<%
		     			}
			     	%>
			     	</div>
		     	</div>
		     	<div style="clear:both;"></div>
		     	
		    
		     	
		     </div><!-- 추천여행지 종료 -->
		    
		    <div id="FAQ"><!-- 자주 찾는 질문 시작 -->
		    	<div class="border-bottom fl">
		     		<div class="big_font fl"><strong>자주 찾는 질문</strong></div>
		     		<button type="submit" class="fr button">
		     			<div class="fl">자주 찾는 질문 더보기</div>
		     			<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/its/icon_arrowright_32_black@3x.png">
		     			<div style="clear:both;"></div>
		     		</button>
		     		<div style="clear:both;"></div>
		     	</div>
		     	<div class="faq_content_box">
		     		<div class="fl">Q</div>
		     		<div class="fl">
		     			<details>
		     				<summary>
		     					<div>[트레킹.레포츠.크루즈 < 크루즈]</div>
		     					<div>[크루즈] 지역 별 주요 운항시즌은 언제인가요?</div>
		     				</summary>
		     				<div>
		     					<div>지역 별 크루즈 운항 시즌은 아래와 같습니다.</div>
		     					<div>■ 동남 아시아 – 11월3월 싱가폴, 말레이시아, 태국 운항</div>
		     					<div>■ 동북 아시아 – 4월~10월 한국, 중국, 일본 운항</div>
		     					<div>■ 서부 지중해 - 연중가능 (이탈리아/스페인/프랑스/몰타)</div>
		     					<div>■ 동부 지중해 – 5월~10월 (그리스/터키/이탈리아/크로아티아)</div>
		     					<div>■ 알래스카 - 5월~9월 / 빙하체험과 피오르드 등 대자연 경관을 감상하는 일정 운항</div>
		     					<div>■ 카리브해 - 연중 가능 / 다양한 수중 액티비티와 선사의 사유섬에서 휴양하는 일정</div>
		     					<div>■ 북유럽 - 5월~8월 / 산과 피요르드의 대자연 경관 감상 및 덴마크, 스웨덴, 핀란드 등 북유럽의 도시 운항</div>
		     				</div>
		     			</details>
		     		</div>
		     		<div class="fl">
		     			<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/down_grey.png" alt="하단화살표" />
		     		</div>
		     		<div style="clear:both;"></div>
		     	</div>
		     	
		     	<div class="faq_content_box">
		     		<div class="fl">Q</div>
		     		<div class="fl">
		     			<details>
		     				<summary>
		     					<div>[트레킹.레포츠.크루즈 < 크루즈]</div>
		     					<div>[트레킹] 계절별 해외 추천지역은 어디인가요?</div>
		     				</summary>
		     				<div>
		     					<div>계절별 해외 트레킹 추천지역은 다음과 같습니다.</div>
		     					<div>봄 - 치앙마이 도이인타논, 베트남 판시판, 대만(옥산, 설산, 아리산, 양명산)</div>
		     					<div>여름 - 일본 (후지산, 북알프스, 중앙알프스, 남알프스, 북해도 대설산), 유럽, 캐나다, 몽골, 러시아</div>
		     					<div>가을 - 일본 다테야마, 중앙아시아</div>
		     					<div>겨울 - 네팔 트레킹, 밀포드 트레킹</div>
		     				</div>
		     			</details>
		     		</div>
		     		<div class="fl">
		     			<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/down_grey.png" alt="하단화살표" />
		     		</div>
		     		<div style="clear:both;"></div>
		     	</div>
		     	
		     	<div class="faq_content_box">
		     		<div class="fl">Q</div>
		     		<div class="fl">
		     			<details>
		     				<summary>
		     					<div>[해외항공권 < 예약.대기]</div>
		     					<div>여권정보가 확실하지 않습니다.</div>
		     				</summary>
		     				<div >
		     					여권 발급 완료 후 결제하시길 권장하나 여권 발급 예정자이신 경우, 결제 시 정확한 탑승객 영문 이름으로 예약하시고 여권 정보는 임의로 입력하시면 결제가 가능합니다.
		     					<br/><br/>
		     					<div class="purple_font">여권 발급 완료 후 결제하시길 권장하나 여권 발급 예정자이신 경우, 결제 시 정확한 탑승객 영문 이름으로 예약하시고 여권 정보는 임의로 입력하시면 결제가 가능합니다.
		     					하문항공, 중국국제항공, 중국동방항공, 우즈베키스탄항공, 아마조나스항공, 아르헨티나항공, 사천항공, 일본 항공, 에어아스타나항공, 라탐항공, 시베리아항공, 홍콩항공, 러시아항공(러시아 지역 출/도착시에만 해당)의 경우 여권정보 수정이 불가하오니 반드시 정확한 여권 정보 입력 후 결제 진행하셔야 합니다.</div>
		     				</div>
		     			</details>
		     		</div>
		     		<div class="fl">
		     			<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/down_grey.png" alt="하단화살표" />
		     		</div>
		     		<div style="clear:both;"></div>
		     	</div>
		     	
		     	<div class="faq_content_box">
		     		<div class="fl">Q</div>
		     		<div class="fl">
		     			<details>
		     				<summary>
		     					<div>[해외호텔 < 요금.객실]</div>
		     					<div>"세미룸"이란 무엇인가요?</div>
		     				</summary>
		     				<div>
		     				<span class="purple_font">일본</span>지역 호텔에 많은 '세미룸'이란 경제적으로 객실을 이용하고자 일반룸보다 작은 사이즈의 객실 크기와 침대를 지닌 룸으로 세미더블룸의 경우 남/여 고객분이나 여/여 고객분들이 대부분 이용하며 남자 두 분이 이용하실 경우 불편할 수 있습니다.
		     				</div>
		     			</details>
		     		</div>
		     		<div class="fl">
		     			<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/down_grey.png" alt="하단화살표" />
		     		</div>
		     		<div style="clear:both;"></div>
		     	</div>
		     	<div style="clear:both;"></div>
		    </div>
		    <!-- 자주 찾는 질문 종료 -->
	  
	     	<div style="clear:both;"></div>
	     </div>
     </form>
    
 
    
   <!-- footer 시작 -->
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
    <!-- footer 종료 -->
</body>
<script src="<%=request.getContextPath()%>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath()%>/hanatour/script/main_search.js"></script>
<script src="<%=request.getContextPath()%>/hanatour/script/footer.js"></script>
</html>