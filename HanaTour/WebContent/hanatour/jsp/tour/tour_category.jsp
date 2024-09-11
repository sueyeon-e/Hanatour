<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// MVC 
  	String tour = (String)request.getAttribute("tour");
	ArrayList<ShowCategoryOneLineInfoDto> categoryOneLine = (ArrayList<ShowCategoryOneLineInfoDto>)request.getAttribute("categoryOneLine"); //카테고리 한줄정보
	ArrayList<CategoryTagDto> categoryTag = (ArrayList<CategoryTagDto>)request.getAttribute("categoryTag");	// 카테고리 태그
	ArrayList<CategoryBottomTagDto> categoryBottomTag = (ArrayList<CategoryBottomTagDto>)request.getAttribute("categoryBottomTag");	// 카테고리 하단 태그
	ArrayList<CategoryPackageInfoDto> categoryPackage = (ArrayList<CategoryPackageInfoDto>)request.getAttribute("categoryPackage");	// 카테고리 패키지 정보
	ArrayList<CategoryPackageFlightInfoDto> categoryPackageFlight = (ArrayList<CategoryPackageFlightInfoDto>)request.getAttribute("categoryPackageFlight");	// 카테고리 항공정보
	ArrayList<CategoryFlagDto> categoryFlag = (ArrayList<CategoryFlagDto>)request.getAttribute("categoryFlag");	// 나라정보와 국기
%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/tour-category.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/header.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/hanatour/css/lightpick.css">
	
	
</head>
<body>
	<%@ include file="header.jsp" %>    
	<div id="div_top" class="center">
		<div class="fl">	
			<div id="double_click">${requestScope.countryCity}<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/arrow.png"></div>
			<form action="<%= request.getContextPath() %>/hanatour/jsp/tour/tour_category.jsp?start_date=${requestScope.starDate }&end_date=${requestScope.endDate }">
				<div><input id="doubleclick_search" type="text" name="country_city"></div>
			</form>
			<div id="where_hide">
       			<div>
       				<div class="fl"><strong>최근검색지역</strong></div>
       				<div class="fr grey_font">전체삭제</div>
       				<div style="clear:both;"></div>
       			</div>
       			<div>
       				<div class="fl">
       					<div class="fl">도쿄</div>
       					<div class="fr grey_x_img"></div>
       					<div style="clear:both;"></div>
       				</div>
       				<div class="fl">
       					<div class="fl">도쿄</div>
       					<div class="fr grey_x_img"></div>
       					<div style="clear:both;"></div>
       				</div>
       				<div class="fl">
       					<div class="fl">도쿄</div>
       					<div class="fr grey_x_img"></div>
       					<div style="clear:both;"></div>
       				</div>
       				<div style="clear:both;"></div>
       			</div>
       			<div>
       				<div><strong>주요도시</strong></div>
       			</div>
       			<div>
       				
       			</div>
       			
       		</div>
		</div>
		<div class="fr">
			<form class="fr">
				<div id="tour_date" class="fr"><img src="<%=request.getContextPath() %>/hanatour/img/tour_img/calender.png" alt="캘린더">2024.07.01(월) ~ 2024.07.31(수), 전체</div>
				<div id="tour_date_hide">
			  		<div>
				  		<input type="text" id="input_start_date" name="start_date"/>
				  		<input type="text" id="input_end_date" name="end_date"/>
			  		</div>
			  		<div>  
			  			<div>                   
				  			<div class="grey_font">여행 시작일</div>
				  			<div><strong>캘린더에서 여행 시작일을 선택해주세요</strong></div>
				  			<button class="fr">선택완료</button>
				  			<div style="clear:both;"></div>
			  			</div>
	  				</div>
	  			</div>	
	  			<div style="clear:both;"></div>
			</form>
			<div class="fr">
				<img src="<%=request.getContextPath() %>/hanatour/img/tour_img/location-dot.png" alt="점"/>
				<select>
			  		<option value="" disabled selected>출발지 전체</option>
			  		<option value="전체">전체</option>
			  		<option value="인천/김포">인천/김포</option>
			  		<option value="부산">부산</option>
			  		<option value="대구">대구</option>
			  		<option value="청주">청주</option>
			  		<option value="광주">광주(무안)</option> 
			  		<option value="제주">제주</option>
			  		<option value="양양">양양</option>
			  	</select>
			</div>
			<div style="clear:both;"></div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<!-- 콘텐츠 시작 -->
	<div id="div_content" class = "center">
		<form action = "<%=request.getContextPath()%>/TourCategoryFormAction">
			<div id="div_filter" class = "fl">
				<div id="filter_box">
			        <div class="fl">
			            <button type="submit">
			                <img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_airin_on.png" />
			            </button>
			            <div>항공포함</div>
			        </div>
			        <div class="fl">
			            <button type="button">
			                <img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_airout_on.png" />
			            </button>
			            <div>항공<br>불포함</div>
			        </div>
			        <div class="fl">
			            <button type="button">
			                <img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_group_on.png" />
			            </button>
			            <div>단체여행</div>
			            
			        </div>
			        <div class="fl">
			            <button type="submit">
			                <img src="https://image.hanatour.com/usr/static/img2/pc/com/ic_single_on.png" />
			            </button>
			            <div>우리끼리<br>여행</div>
			        </div>
			        <div style="clear:both;"></div>
			    </div>
				<div>
					<div>항공 포함 여부와 행사 종류 선택에 따라<br>다양한 패키지를 검색할 수 있습니다.</div>
				</div>
				<div id="div-tour">
					<details open>
						<summary>
							<div>
								<div class="fl">투어조건</div>
								<div class="black_v"></div>
								<div style="clear:both;"></div>
							</div>
						</summary>
						<div>
							<div>
								<button type="submit" name="tour" value = "free_schedule"class="fl div_tour_filter filter">자유일정 포함</button>
								<button type="submit" name="tour" value = "no_guiede_fee" class="fl div_tour_filter filter">가이드기사경비없음</button>
								<button type="submit" name="tour" value = "no_optional_tour" class="fl div_tour_filter filter">선택관광없음</button>
								<button type="submit" name="tour" value = "no_shopping" class="fl div_tour_filter filter">쇼핑없음</button>
								<button type="submit" name="tour" value = "with_guide" class="fl div_tour_filter filter">가이드동행</button>
								<div style="clear:both;"></div>
							</div>
						</div>
					</details>
				</div>
				<!-- 
				<div id="div_hotel">
					<details open>
						<summary>
							<div>
								<div>호텔 성급</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" class="fl">5성급</button>
							<button type="button" class="fl">4성급</button>
							<button type="button" class="fl">3성급</button>
							<button type="button" class="fl">기타</button>
							<div style="clear:both;"></div>
						</div>
					</details>	
				</div>
				 -->
				<div id="div_flight">
					<details open>
						<summary>
							<div>
								<div>항공사</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="submit" name="flight" value= "대한항공" class="fl">대한항공</button>
							<button type="submit" name="flight" value="아시아나항공" class="fl">아시아나항공</button>
							<button type="submit" name="flight" value="에어부산" class="fl">에어부산</button>
							<button tyep="submit" name="flight" value="에어로케이" name="flight" class="fl">에어로케이</button>
							<button type="submit" name="flight" value="에어프레미아" class="fl">에어프레미아</button>
							<button type="submit" name="flight" value="에어서울" class="fl">에어서울</button>
							<button type="submit" name="flight" value="이스타항공" class="fl">이스타항공</button>
							<button type="submit" name="flight" value="제주항공" class="fl">제주항공</button>
							<button type="submit" name="flight" value="진에어" class="fl">진에어</button>
							<button type="submit" name="flight" value="티웨이항공" class="fl">티웨이항공</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				<div id="div_departure_time">
					<details open>
						<summary>
							<div>
								<div>출발 항공 시간대</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" name="departure_time" class="fl">아침(05~12시)</button>
							<button type="button" name="departure_time" class="fl">점심(12~18시)</button>
							<button type="button" name="departure_time" class="fl">저녁(18~24시)</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				<div id="div_departure_date">
					<details open>
						<summary>
							<div>
								<div>출발요일</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" name="day" class="fl">월</button>
							<button tyep="button" name="day" class="fl">화</button>
							<button type="button" name="day" class="fl">수</button>
							<button type="button" name="day" class="fl">목</button>
							<button type="button" name="day" class="fl">금</button>
							<button type="button" name="day" class="fl">토</button>
							<button type="button" name="day" class="fl">일</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				<div id="div_type">
					<details open>
						<summary>
							<div>
								<div>어떤 여행을 원하세요?</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" name="type" class="fl">관광</button>
							<button type="button" name="type" class="fl">관광+자유</button>
							<button type="button" name="type" class="fl">골프</button>
							<button type="button" name="type" class="fl">힐링휴양</button>
							<button type="button" name="type" class="fl">아트/문화</button>
							<button type="button" name="type" class="fl">체험/클래스</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				<!-- 
				<div id="div_who">
					<details open>
						<summary>
							<div>
								<div>누구와 떠나세요?</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" class="fl">친구모임</button>
							<button type="button" class="fl">부부연인</button>
							<button type="button" class="fl">가족여행</button>
							<button type="button" class="fl">나홀로</button>
							<button type="button" class="fl">아동동반</button>
							<button type="button" class="fl">허니문</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				 -->
				<div id="div_brand">
					<details open>
						<summary>
							<div>
								<div>상품브랜드</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" name="brand" class="fl">세이브</button>
							<button type="button" name="brand" class="fl">스탠다드</button>
							<button type="button" name="brand" class="fl">ZEUS</button>
							<button type="button" name="brand" class="fl">골프</button>
							<button type="button" name="brand" class="fl">우리끼리</button>
							<button type="button" name="brand" class="fl">프리미엄</button>
							<button type="button" name="brand" class="fl">투어텔</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>
				<div id="div_money">
					<details open>
						<summary>
							<div>
								<div>여행 1인 예산을 어떻게 잡으세요?</div>
								<div class="black_v"></div>
							</div>
						</summary>
						<div>
							<button type="button" class="fl">15~98만원</button>
							<button type="button" class="fl">98~150만원</button>
							<button type="button" class="fl">150~207만원</button>
							<button type="button" class="fl">207~920만원</button>
							<button type="button" class="fl">직접 입력</button>
							<div style="clear:both;"></div>
						</div>
					</details>
				</div>	
				<div id="div_search_in_search">
					<div>
						<div>결과 내 결과</div>
					</div>
					<div>
						<input type="text" placeholder="상품명을 입력해주세요" />
						<div class=fr><img src="<%=request.getContextPath() %>/hanatour/img/tour_img/reading_glasses.png" alt="돋보기"/></div>
						<div style="clear:both;"></div>
					</div>
				</div>	
			</div>
			<input type="hidden" name="countryCity" value="${requestScope.countryCity}">
			<input type="hidden" name="startDate" value="${requestScope.startDate}">
			<input type="hidden" name="sortOrder" value="${requestScope.sortOrder}">
		</form>
		</div>
		<div id="div_category" class="fl">
			<div id="div_country_check">
					<div class="fl"><img src="<%=categoryFlag.get(0).getFlagImg() %>" alt="국기"/></div>
					<div class="fl"><strong><%=categoryFlag.get(0).getCountryName() %></strong> : 여행 전 입국 규정을 확인해 주세요</div>
					<div style="clear:both;"></div>
			</div>
			<div id="div_filter_four">
				<div class="fl"><img src="<%=request.getContextPath() %>/hanatour/img/tour_img/filter.png"></div>
				<div class="fl">필터</div>
				<div class="fl">4</div>
				<div class="fl">항공포함</div>
				<div class="fl">항공불포함</div>
				<div class="fl">단체여행</div>
				<div class="fl">우리끼리 여행</div>
				<div class="fl">
					<div class="fl"><img src="<%=request.getContextPath() %>/hanatour/img/tour_img/small_circle.png"></div>
					<div class="fl">필터 초기화</div>
					<div style="clear:both;"></div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div id="div_filter_wrap">
				<div class="fl">${requestScope.countryCity } 패키지 <span></span> </div>
				<form action="TourController">
					<input type="hidden" name="command" value="category_form">
					<input type= "hidden" name="startDate" value="${requestScope.startDate }">
					<input type= "hidden" name="endDate" value="${requestScopte.endDate }">
					<input type="hidden" name="sortOrder" value="lowPrice">
					<input type="hidden" name="countryCity" value="${requestScope.countryCity }">
					<button class="fr">낮은 가격순</button>
				</form>
				<form  action="TourController">
					<input type="hidden" name="command" value="category_form">
					<input type= "hidden" name="startDate" value="${requestScope.startDate }">
					<input type= "hidden" name="endDate" value="${requestScopte.endDate }">
					<input type="hidden" name="sortOrder" value="highPrice">
					<input type="hidden" name="countryCity" value="${requestScope.countryCity }">
					<button class="fr">높은가격순</button>
				</form>
				<form action="TourController">
					<input type="hidden" name="command" value="category_form">
					<input type= "hidden" name="startDate" value="${requestScope.startDate }">
					<input type= "hidden" name="endDate" value="${requestScopte.endDate }">
					<input type="hidden" name="sortOrder" value="review">
					<input type="hidden" name="countryCity" value="${requestScope.countryCity }">
					<button class="fr">평점순</button>
				</form>
				<!-- 
				<button onclick="" class="fr">예약순</button>
				<button onclick="" class="fr">추천순</button>
				 -->
				<div style="clear:both;"></div>
			</div>
			<% 
				for(ShowCategoryOneLineInfoDto oneLineDto : categoryOneLine) {
			%>
				<div>
					<div class="div_small_category">
						<div class="fl">
							<div><img src=" <%= oneLineDto.getImgUrl() %> "/></div>
						</div>
						<div class="fl">
							<div>
								<%
									if(oneLineDto.getPackageTag().equals("T")) {
								%>
									<div class="fl package_tag">패키지</div>
								<%
									} else {
								%>
									
								<%
									}
								%>
								<%
									if(oneLineDto.getLocalDepartureTag().equals("T")) {
								%>
									<div class="fl departure_tag">지방 출발</div> 
								<%
									} else {
								%>
									
								<%
									}
								%>
								<%
									if(oneLineDto.getHanapack().equals("T")) {
								%>
									<div class="fl hannapack_tag">하나팩2.0</div>
								<%
									} else {
								%>
									
								<%
									}
								%>
								<div style="clear:both;"></div>
							</div>	
							<div>
								<div><strong><%=oneLineDto.getCategoryName() %></strong></div>
								<div><%=oneLineDto.getCategoryEx() %></div>
								<div>
									<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/com/ic_location_line_12.png"/>
									<%
									if (categoryTag != null) {
									    for (CategoryTagDto tag : categoryTag) {
									        if (tag.getCategoryIdx() == oneLineDto.getCategoryIdx()) {

									%>	
									        <div class="fl">
									            <%= tag.getCityName() %>
									        </div>
									<%
										        }
										    }
										}
									%>

									<div style="clear:both;"></div>
								</div>
								<div>
									<img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/com/ic_calendar_line_12.png" />
									<div class="fl"><%=oneLineDto.getTravelPeriod() %></div><br/>
									<div style="clear:both;"></div>
								</div>
								<div>
									<div><img class="fl" src="https://image.hanatour.com/usr/static/img2/pc/com/ic_star_solid_12.png"/></div>
									<div class="fl"><strong><%=oneLineDto.getReviewStar() %></strong></div>
									<div class="fl">( <%=oneLineDto.getCommentAmount() %> )</div>
									<% 
										for(CategoryBottomTagDto dto :categoryBottomTag) {
											if(dto.getCategoryIdx() == oneLineDto.getCategoryIdx()) {
									%>
									<div class="fl bottom_tag"><%=dto.getTag() %></div>
									<%
											}
										}
									%>
									<div style="clear:both;"></div>
								</div>
							</div>	
						</div>	
						<div class="fl">
							<div><span class="price_comma"><strong><%=oneLineDto.getPrice() %></strong></span>원~</div>
							<div class="product_show">
								<div class=" fl">판매상품보기</div>
								<img class="fr" src="<%=request.getContextPath() %>/hanatour/img/tour_img/purple_down.png"/>
								<div style="clear:both;"></div>
							</div>
						</div>
						<div style="clear: both;"></div>
					</div>
					<div class="product_hide">
						<div>
							<div class="calender_nav">
								<span class="big_black_left_arrow"></span>
								<span class="show_date">${requestScope.nowYear}년 ${requestScope.nowMonth}월</span>
								<span class="big_black_right_arrow"></span>
							</div>
							<div class="row_calender" id="row_calender1">
								<div class="days">
									<div style="clear:both;"></div>
								</div>
								<div class="dates">
									<span class="fr small_right_arrow"></span>
									<div style="clear:both;"></div>
								</div>
							</div>
							<div class="row_calender" id="row_calender2">
								<div class="days">
									<div style="clear:both;"></div>
								</div>
								<div class="dates">
									<span class="fl small_left_arrow"></span>
									<div style="clear:both;"></div>
								</div>
							</div>
						</div>
						<div>
							<div>
								<div class="fl"><strong> <span class="purple_font"></span> </strong></div>
								<article class=" fr cont-select">
								  <button class="btn-select">출발확정순</button>
								  <ul class="list-member">
								    <li><button type="button">출발확정순</button></li>
								    <li><button type="button">출발시간 빠른순</button></li>
								    <li><button type="button">출발시간 늦은순</button></li>
								    <li><button type="button">낮은 가격순</button></li>
								    <li><button type="button">높은 가격순</button></li>
								  </ul>
								</article>
								<div style="clear:both;"></div>
								<div class="small_product_box">
									<%
										for(CategoryPackageInfoDto dto : categoryPackage) {
											if(dto.getCategoryIdx() == oneLineDto.getCategoryIdx()) {
									%>
									<div>
										<div>
											<div class="fl comparePackageName"><%=dto.getPacakgeName() %></div>
											<div class="fr"><span><strong class="price_comma comparePrice"><%=dto.getAdult() %></strong></span> 원</div>
											<div style="clear:both;"></div>
										</div>
										<div>
											<img class="fl compareFLightLogo" src="<%=dto.getLogo() %>"/>
											<div><span class="fl compareFlightName"><%=dto.getName() %></span>, 잔여 6석</div>
											<div style="clear:both;"></div>
										</div>
										<div>
										<%
											for(CategoryPackageFlightInfoDto cpfiDto : categoryPackageFlight) {
												if(cpfiDto.getPackageIdx() == dto.getPackageIdx()) {
										%>
												<span class="small_calender_logo"></span>
												<span class="compareDepartureTime"><%=cpfiDto.getDepartureTime() %></span>   
												<span class="one_arrow_img"></span>
												<span class="compareArrivalTime"><%=cpfiDto.getArrivalTime() %></span>
										<%
												}
											} 
										%>	
											<span><%=dto.getTravelPeriod() %></span>
										</div>
										<div>
											<span class="write_img"></span>
											 
											<%
												if (dto != null && dto.getInn() == null) {
											%>
											        	호텔 <%= dto.getMaxStar() %> 성급
											<%
											   	 } else {
											%>
											        호텔없음	
											<%
												    }
											%>
											, 
											<%
												if(dto.getShopping().equals("T")) {
											%>
												<%=dto.getShoppingTimes() %>
											<%
												} else {
											%>
												쇼핑없음
											<%
												}
											%>
											, 
											<%
												if(dto.getGuide().equals("T")) {
											%>
												가이드 있음
											<%
												} else {
											%>
												가이드 없음
											<%
												}
											%>
										</div>
										<div class="fr">
											<button class="grey_font compare_button fl" type="button">상품비교하기</button>
											<form class="fl" action="TourController">	
												<button class="white_font" type="submit">상세일정보기</button>
												<input type="hidden" name="packageIdx" value="<%= dto.getPackageIdx()%>"/>
												<input type="hidden" name="countryCity" value="${requestScope.countryCity}"/>
												<input type="hidden" name="command" value="package_form"/>
											</form>
											<div style="clear:both;"></div>
										</div>
										<div style="clear:both;"></div>
									</div>
									<%
											}
										}		
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			<%
				}
			%>
			
		</div>
		<div style="clear:both;"></div>
	</div>
	
	<!-- 상품비교함 시작 -->

	<div id="compare_wrap" class="hide">
		<div id="compare_box" class="fixed-box">
			<div>
				<button type="button">
					<div class="white_font">상품비교함<span class="blue_font">(3)</span><div class="v"></div></div>
				</button>
			</div>
		</div>
		
		<div id="compare_content">
			<div><strong>다양한 상품을 한 번에 비교하고 선택해보세요!</strong></div>
			<div class="grey_font">비교함에는 최대 3개까지 담을 수 있으며, 최대 3개의 상품을 비교할 수 있습니다.</div>
			<div class="fr">
				<button type="button"><span></span>선택초기화</button>
				<button>상품비교하기</button>
			</div>
			<div id="compare_item_area">
				<div class="fl compare_item">
					<button type="button" class="fr"></button>
					<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
					<div>
						<div class="fl grey_font">07/01 (월)</div>
						<div class="fl right-arrow"></div>
						<div class="fl grey_font">07/04 (목)</div>
						<img class="fl" src="https://image.hanatour.com/usr/static/img/airline/ZE.png" alt="항공마크" />
						<div>이스타 항공</div>
						<div style="clear:both;"></div>
					</div>
					<div class="grey_font"><span class="purple_font">예약가능</span>/잔여 20석</div>
					<div><span><strong>639,000</strong></span>원</div>
				</div>
				
				<div class="fl compare_item">
					<button type="button" class="fr"></button>
					<div>도쿄/오다이바 3일 #1일 자유 #도쿄 시내 숙박</div>
					<div>
						<div class="fl grey_font">07/01 (월)</div>
						<div class="fl right-arrow"></div>
						<div class="fl grey_font">07/03 (수)</div>
						<img class="fl" src="https://image.hanatour.com/usr/static/img/airline/YP.png" alt="항공마크" />
						<div>에어프레미아</div>
						<div style="clear:both;"></div>
					</div>
					<div class="grey_font"><span class="purple_font">예약가능</span>/잔여 20석</div>
					<div><span><strong>639,900</strong></span>원</div>
					
				</div>
				
				<div class="fl no_compare_item">
					<div>상품에서 '상품비교함 담기'<br/>버튼을 클릭해보세요.</div>
				</div>

				<div style="clear:both;"></div>
			</div>
			
			<div style="clear:both;"></div>
		</div>
	</div>
	<!-- 상품 비교함 종료 -->
	
	<!-- 3개짜리 상품 비교함 내부 시작 -->
	<div id="div_fullscreen_grey" style="display: none;">
		<div id="compare_in" style="display: none;">
			<div>
				<div class="fl"><strong>상품비교하기</strong></div>
				<div class="fr">
					<button type="button" class="fr"></button>
					<button type="button" class="fr"><span class="print"></span>인쇄하기</button>
					<div style="clear:both;"></div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div id="compare_in_content">
				<table class="compare3">
					<tr>
						<th id="grey_blank">빈칸</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
						</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
						</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
							<div style="clear:both"></div>
						</th>
					</tr>
					<tr id="compare_schedule">
						<th>일정요약</th>
						<td>
							<div class="compare_day">
								<div class="purple_font"><strong>1일차</strong></div>
								<div class="grey_font">오다이바와 아사쿠사, 그리고 나카미세도리를 즐겨보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">오다이바, 오다이바 해상공원 & 자유의 여신상, 다이바시티, 도쿄(Tokyo / 東京), 아사쿠사, 나카미세도리</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>2일차</strong></div>
								<div class="grey_font">도쿄타워와 시부야 스카이 전망대를 방문해보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">도쿄타워, 시부야 스카이 전망대</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>3일차</strong></div>
								<div class="grey_font">여행중</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>4일차</strong></div>
								<div class="grey_font">도착</div>
							</div>
							<div class="compare_schedule_notice">※ 자유 일정이 있는 상품인 경우, 상품 담당자의 추천 일정도 포함하여 요약합니다.</div>
							<button type="button">접기</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr id="review_content">
						<th>후기 요약</th>
						<td>도쿄 여행에서 즐거운 관광지와 편안한 일정으로 여행을 즐겼습니다. 가이드의 설명과 배려로 편안한 여행을 만들어주셨고, 호텔과 식사도 만족스러웠습니다. 다음에도 다른 지역으로 패키지 여행을 떠나보고 싶은 마음이 드는 좋은 경험이었습니다.</td>
						<td></td>
						<td></td>
					</tr>
					<tr id="reservation_content">
						<th>예약현황</th>
						<td><span class="purple_font">예약가능</span> / 잔여20석</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">일정</th>
					</tr>
					<tr id="departure_content">
						<th>출발일</th>
						<td>2024.07.01(월)</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>여행기간</th>
						<td class="schedule_td">3박4일</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>방문도시</th>
						<td class="schedule_td">	나리타-도쿄(1)-도쿄(1)-도쿄(1)-나리타</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>이용항공</th>
						<td class="schedule_td">저비용항공사</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>출발</th>
						<td class="schedule_td">2024.07.01(월) 08:00 - ZE0601</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>도착</th>
						<td class="schedule_td">2024.07.04(목) 14:35 - ZE0602</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">선택관광/쇼핑</th>
					</tr>
					<tr>
						<th>선택관광</th>
						<td class="schedule_td"> - </td>
						<td class="schedule_td"> - </td>
						<td class="schedule_td"> - </td>
					</tr>
					<tr id="shopping_times">
						<th>쇼핑횟수</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>1회</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="guide_tf">
						<th>가이드</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>현지 도착시 가이드와 미팅이 이루어집니다</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="leader_tf">
						<th>인솔자</th>
						<td class="schedule_td">
							<div><span class="purple_x_img"></span>인솔자가 동행하지 않습니다.</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">부가정보</th>
					</tr>
					<tr>
						<th>
							<div class="blue_o_img"></div>
							<div>포함내역</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>왕복항공권, 전용 차량비 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[저세금]</strong></div>
								<div><span><b>국내공항세, 현지공항세, 관광진흥개발기금, 전쟁보험료</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>숙박비</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[식사]</strong></div>
								<div><span><b>식사비 :</b></span> 전일정 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[관광]</strong></div>
								<div><span><b>관광지 입장료 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[여행자보험]</strong></div>
								<div><span><b>1억원 여행자보험</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[인솔자]</strong></div>
								<div><span><b>인솔자 경비(현지 기타경비외) :</b></span> 자유일정 시 불포함</div>
							</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="no_contain">
						<th>
							<div class="purple_no_img"></div>
							<div>불포함내역</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[가이드/기사]</strong></div>
								<div><span><b>가이드/기사 경비 : </b></span>인당 JPY 4,000 (인당 총 ￥4,000의 경비를 현지에서 지불 (성인/아동 동일))</div>
								<div>
									개인 여행경비(물값,자유시간시 개인비용 등)
									<br/>
									각종 매너팁 (테이블팁, 객실팁, 포터비, 마사지팁)
									<br/>
									※ 매너팁은 소비자의 자율적 선택으로 지불여부에 따른 불이익은 없습니다.
								</div>
							</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>
							<div class="green_check_img"></div>
							<div>선택경비</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>항공리턴변경(불가)</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>객실 1인 사용료 : 150,000원</b></span></div>
							</div>
						</td>
						<td class="schedule_td"></td>
						<td class="schedule_td"></td>
					</tr>

				</table>
			</div>
			
		</div>
	</div>
	<!-- 상품 비교함 내부 종료 -->
	
	
<!-- <!-- 	상품 비교함 2개짜리 내부 시작
	<div id="div_fullscreen_grey" style="display: none;">
		<div id="compare_in" style="display: none;">
			<div>
				<div class="fl"><strong>상품비교하기</strong></div>
				<div class="fr">
					<button type="button" class="fr"></button>
					<button type="button" class="fr"><span class="print"></span>인쇄하기</button>
					<div style="clear:both;"></div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div id="compare_in_content">
				<table class="compare2">
					<tr>
						<th id="grey_blank">빈칸</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
						</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
						</th>
					</tr>
					<tr id="compare_schedule">
						<th>일정요약</th>
						<td>
							<div class="compare_day">
								<div class="purple_font"><strong>1일차</strong></div>
								<div class="grey_font">오다이바와 아사쿠사, 그리고 나카미세도리를 즐겨보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">오다이바, 오다이바 해상공원 & 자유의 여신상, 다이바시티, 도쿄(Tokyo / 東京), 아사쿠사, 나카미세도리</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>2일차</strong></div>
								<div class="grey_font">도쿄타워와 시부야 스카이 전망대를 방문해보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">도쿄타워, 시부야 스카이 전망대</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>3일차</strong></div>
								<div class="grey_font">여행중</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>4일차</strong></div>
								<div class="grey_font">도착</div>
							</div>
							<div class="compare_schedule_notice">※ 자유 일정이 있는 상품인 경우, 상품 담당자의 추천 일정도 포함하여 요약합니다.</div>
							<button type="button">접기</button>
						</td>
						<td>
							<div class="compare_day">
								<div class="purple_font"><strong>1일차</strong></div>
								<div class="grey_font">오다이바와 아사쿠사, 그리고 나카미세도리를 즐겨보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">오다이바, 오다이바 해상공원 & 자유의 여신상, 다이바시티, 도쿄(Tokyo / 東京), 아사쿠사, 나카미세도리</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>2일차</strong></div>
								<div class="grey_font">도쿄타워와 시부야 스카이 전망대를 방문해보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">도쿄타워, 시부야 스카이 전망대</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>3일차</strong></div>
								<div class="grey_font">여행중</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>4일차</strong></div>
								<div class="grey_font">도착</div>
							</div>
							<div class="compare_schedule_notice">※ 자유 일정이 있는 상품인 경우, 상품 담당자의 추천 일정도 포함하여 요약합니다.</div>
							<button type="button">접기</button>
						</td>
					</tr>
					<tr id="review_content">
						<th>후기 요약</th>
						<td>도쿄 여행에서 즐거운 관광지와 편안한 일정으로 여행을 즐겼습니다. 가이드의 설명과 배려로 편안한 여행을 만들어주셨고, 호텔과 식사도 만족스러웠습니다. 다음에도 다른 지역으로 패키지 여행을 떠나보고 싶은 마음이 드는 좋은 경험이었습니다.</td>
						<td></td>
					</tr>
					<tr id="reservation_content">
						<th>예약현황</th>
						<td><span class="purple_font">예약가능</span> / 잔여20석</td>
						<td></td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">일정</th>
					</tr>
					<tr id="departure_content">
						<th>출발일</th>
						<td>2024.07.01(월)</td>
						<td></td>
					</tr>
					<tr>
						<th>여행기간</th>
						<td class="schedule_td">3박4일</td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>방문도시</th>
						<td class="schedule_td">	나리타-도쿄(1)-도쿄(1)-도쿄(1)-나리타</td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>이용항공</th>
						<td class="schedule_td">저비용항공사</td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>출발</th>
						<td class="schedule_td">2024.07.01(월) 08:00 - ZE0601</td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>도착</th>
						<td class="schedule_td">2024.07.04(목) 14:35 - ZE0602</td>
						<td class="schedule_td">2024.07.04(목) 14:35 - ZE0602</td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">선택관광/쇼핑</th>
					</tr>
					<tr>
						<th>선택관광</th>
						<td class="schedule_td"> - </td>
						<td class="schedule_td"> - </td>
					</tr>
					<tr id="shopping_times">
						<th>쇼핑횟수</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>1회</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="guide_tf">
						<th>가이드</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>현지 도착시 가이드와 미팅이 이루어집니다</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="leader_tf">
						<th>인솔자</th>
						<td class="schedule_td">
							<div><span class="purple_x_img"></span>인솔자가 동행하지 않습니다.</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">부가정보</th>
					</tr>
					<tr>
						<th>
							<div>
								<div class="blue_o_img"></div>
								<div>포함내역</div>
							</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>왕복항공권, 전용 차량비 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[저세금]</strong></div>
								<div><span><b>국내공항세, 현지공항세, 관광진흥개발기금, 전쟁보험료</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>숙박비</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[식사]</strong></div>
								<div><span><b>식사비 :</b></span> 전일정 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[관광]</strong></div>
								<div><span><b>관광지 입장료 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[여행자보험]</strong></div>
								<div><span><b>1억원 여행자보험</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[인솔자]</strong></div>
								<div><span><b>인솔자 경비(현지 기타경비외) :</b></span> 자유일정 시 불포함</div>
							</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
					<tr id="no_contain">
						<th>
							<div class="purple_no_img"></div>
							<div>불포함내역</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[가이드/기사]</strong></div>
								<div><span><b>가이드/기사 경비 : </b></span>인당 JPY 4,000 (인당 총 ￥4,000의 경비를 현지에서 지불 (성인/아동 동일))</div>
								<div>
									개인 여행경비(물값,자유시간시 개인비용 등)
									<br/>
									각종 매너팁 (테이블팁, 객실팁, 포터비, 마사지팁)
									<br/>
									※ 매너팁은 소비자의 자율적 선택으로 지불여부에 따른 불이익은 없습니다.
								</div>
							</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
					<tr>
						<th>
							<div class="green_check_img"></div>
							<div>선택경비</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>항공리턴변경(불가)</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>객실 1인 사용료 : 150,000원</b></span></div>
							</div>
						</td>
						<td class="schedule_td"></td>
					</tr>
	
				</table>
			</div>
			
		</div>
	</div>
	상품 비교함 내부 종료 --> -->
	
	<!-- 1개짜리 상품 비교함 내부 시작 
	<div id="div_fullscreen_grey" style="display: none;">
		<div id="compare_in" style="display: none;">
			<div>
				<div class="fl"><strong>상품비교하기</strong></div>
				<div class="fr">
					<button type="button" class="fr"></button>
					<button type="button" class="fr"><span class="print"></span>인쇄하기</button>
					<div style="clear:both;"></div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div id="compare_in_content">
				<table class="compare1">
					<tr>
						<th id="grey_blank">빈칸</th>
						<th class="compare_top">
							<img src="https://image.hanatour.com/usr/cms/resize/400_0/2021/09/01/10000/1db600f9-a998-4bf1-902d-8aed33fa0065.jpg" alt="관광지 사진"/>
							<div>[타임세일]도쿄 4일 #2일자유 #자유식사 #오다이바 #아사쿠사 #시내숙박</div>
							<div>성인 1인</div>
							<div><span><strong>639,900</strong></span>원</div>
							<div>
								<button type="button">찜</button>
								<button type="button">상세일정보기</button>
							</div>
						</th>
					</tr>
					<tr id="compare_schedule">
						<th>일정요약</th>
						<td>
							<div class="compare_day">
								<div class="purple_font"><strong>1일차</strong></div>
								<div class="grey_font">오다이바와 아사쿠사, 그리고 나카미세도리를 즐겨보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">오다이바, 오다이바 해상공원 & 자유의 여신상, 다이바시티, 도쿄(Tokyo / 東京), 아사쿠사, 나카미세도리</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>2일차</strong></div>
								<div class="grey_font">도쿄타워와 시부야 스카이 전망대를 방문해보세요 </div>
								<div>
									<div class="fl schedule_label">주요일정</div>
									<div class="fl schedule_content">도쿄타워, 시부야 스카이 전망대</div>
								</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>3일차</strong></div>
								<div class="grey_font">여행중</div>
							</div>
							<div class="compare_day">
								<div class="purple_font"><strong>4일차</strong></div>
								<div class="grey_font">도착</div>
							</div>
							<div class="compare_schedule_notice">※ 자유 일정이 있는 상품인 경우, 상품 담당자의 추천 일정도 포함하여 요약합니다.</div>
							<button type="button">접기</button>
						</td>
					</tr>
					<tr id="review_content">
						<th>후기 요약</th>
						<td>도쿄 여행에서 즐거운 관광지와 편안한 일정으로 여행을 즐겼습니다. 가이드의 설명과 배려로 편안한 여행을 만들어주셨고, 호텔과 식사도 만족스러웠습니다. 다음에도 다른 지역으로 패키지 여행을 떠나보고 싶은 마음이 드는 좋은 경험이었습니다.</td>
					</tr>
					<tr id="reservation_content">
						<th>예약현황</th>
						<td><span class="purple_font">예약가능</span> / 잔여20석</td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">일정</th>
					</tr>
					<tr id="departure_content">
						<th>출발일</th>
						<td>2024.07.01(월)</td>
					</tr>
					<tr>
						<th>여행기간</th>
						<td class="schedule_td">3박4일</td>
					</tr>
					<tr>
						<th>방문도시</th>
						<td class="schedule_td">	나리타-도쿄(1)-도쿄(1)-도쿄(1)-나리타</td>
					</tr>
					<tr>
						<th>이용항공</th>
						<td class="schedule_td">저비용항공사</td>
					</tr>
					<tr>
						<th>출발</th>
						<td class="schedule_td">2024.07.01(월) 08:00 - ZE0601</td>
					</tr>
					<tr>
						<th>도착</th>
						<td class="schedule_td">2024.07.04(목) 14:35 - ZE0602</td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">선택관광/쇼핑</th>
					</tr>
					<tr>
						<th>선택관광</th>
						<td class="schedule_td"> - </td>
					<tr id="shopping_times">
						<th>쇼핑횟수</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>1회</div>
						</td>
					</tr>
					<tr id="guide_tf">
						<th>가이드</th>
						<td class="schedule_td">
							<div><span class="blue_circle_img"></span>현지 도착시 가이드와 미팅이 이루어집니다</div>
						</td>
					</tr>
					<tr id="leader_tf">
						<th>인솔자</th>
						<td class="schedule_td">
							<div><span class="purple_x_img"></span>인솔자가 동행하지 않습니다.</div>
						</td>
					</tr>
					<tr class="colspan">
						<th colspan="4" align="left">부가정보</th>
					</tr>
					<tr>
						<th>
							<div class="blue_o_img"></div>
							<div>포함내역</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>왕복항공권, 전용 차량비 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[저세금]</strong></div>
								<div><span><b>국내공항세, 현지공항세, 관광진흥개발기금, 전쟁보험료</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>숙박비</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[식사]</strong></div>
								<div><span><b>식사비 :</b></span> 전일정 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[관광]</strong></div>
								<div><span><b>관광지 입장료 :</b></span> 자유일정 시 불포함</div>
							</div>
							<div class="additional_info">
								<div><strong>[여행자보험]</strong></div>
								<div><span><b>1억원 여행자보험</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[인솔자]</strong></div>
								<div><span><b>인솔자 경비(현지 기타경비외) :</b></span> 자유일정 시 불포함</div>
							</div>
						</td>
					</tr>
					<tr id="no_contain">
						<th>
							<div class="purple_no_img"></div>
							<div>불포함내역</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[가이드/기사]</strong></div>
								<div><span><b>가이드/기사 경비 : </b></span>인당 JPY 4,000 (인당 총 ￥4,000의 경비를 현지에서 지불 (성인/아동 동일))</div>
								<div>
									개인 여행경비(물값,자유시간시 개인비용 등)
									<br/>
									각종 매너팁 (테이블팁, 객실팁, 포터비, 마사지팁)
									<br/>
									※ 매너팁은 소비자의 자율적 선택으로 지불여부에 따른 불이익은 없습니다.
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<div class="green_check_img"></div>
							<div>선택경비</div>
						</th>
						<td class="schedule_td">
							<div class="additional_info">
								<div><strong>[교통]</strong></div>
								<div><span><b>항공리턴변경(불가)</b></span></div>
							</div>
							<div class="additional_info">
								<div><strong>[숙박]</strong></div>
								<div><span><b>객실 1인 사용료 : 150,000원</b></span></div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 상품 비교함 내부 종료 -->
	
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/lightpick.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/tour_category.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/header.js"></script>
<script src="<%=request.getContextPath() %>/hanatour/script/footer.js"></script>

</html>