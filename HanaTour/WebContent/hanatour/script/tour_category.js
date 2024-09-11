$(function() {
	$("#compare_box").click(function() {
		$("#compare_wrap").toggleClass("hide");
	});
	
	//투어조건 열고 닫기 
	$(".black_v").click(function() {
    // 현재 회전 상태를 클래스에 저장
    if ($(this).hasClass('rotated')) {
        $(this).css('transform', 'rotate(0deg)');
        $(this).removeClass('rotated');
    } else {
        $(this).css('transform', 'rotate(180deg)');
        $(this).addClass('rotated');
    }

    // 회전 애니메이션 적용
    $(this).css('transition', 'transform 0.7s');
	});
	
	
	// 투어조건 클릭변화 
	$("#div-tour > details > div > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	// 프로모션 클릭변화 
	$("#div_promotion > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	//호텔 성급 클릭 변화
	$("#div_hotel > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	//항공사 클릭 변화 
	$("#div_flight > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	//출발항공 시간대 클릭 변화
	$("#div_departure_time > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	// 출발요일 클릭 변화 
	$("#div_departure_date > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	// 어떤 여행을 원하세요 클릭 변화 
	$("#div_type > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});	
	
	// 누구와 떠나세요 클릭 변화
	$("#div_who > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
	// 상품 브랜드 클릭 변화 
	$("#div_brand > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	
// 1인 예산 클릭 변화
	$("#div_money > details > div > button").click(function() {
	    if($(this).css('border-color') === 'rgb(94, 43, 184)') { 
	        $(this).css('border', '1px solid black');
			$(this).css('color', 'black');
	    } else {
	        $(this).css('border', '1px solid #5e2bb8'); 
			$(this).css('color', '#5e2bb8'); 
	    }
	});
	

	
// 클릭시 팝업 더블시 검색창
	$("#where_hide").hide();
	$("#doubleclick_search").hide();
	
	$("#double_click").click(function() {
		$("#where_hide").show();
	});
	
	$("#double_click").dblclick(function() {
		$("#doubleclick_search").show();
		$("double_click").hide();
	});
	
	$(document).click(function(event) {
   // 클릭한 요소가 #doubleclick_search 요소나 그 자식 요소가 아닌 경우
    if (!$(event.target).closest("#doubleclick_search").length && !$(event.target).is("#double_click")) {
        $("#doubleclick_search").hide();
		$("#where_hide").hide();
    }
	});
	
	$("#doubleclick_search").click(function(event) {
		event.stopPropagation();
	});
	
	$("#where_hide").click(function(event) {
		event.stopPropagation();
	});
	
// 여행일 선택창 숨기고 보이기
	$("#tour_date_hide").hide();
	let myPicker = null;
	$("#tour_date").click(function() {
		$("#tour_date_hide").toggle();
		if (!myPicker) {
	        myPicker = new Lightpick({
	            field: document.getElementById('input_start_date'),
	            secondField: document.getElementById('input_end_date'),
	            singleDate: false,
	            numberOfMonths: 2,
	            format: 'YYYYMMDD',
	            inline: true
	        });
    	}
	});
	

	//상품비교함 3개짜리
	$('#compare_content > div:nth-child(3) > button:nth-child(2)').click(function() {
		$('#compare_in').show();  // This will show the element with id compare_in
		$('#div_fullscreen_grey').show();  // This will ...
    }); 
});

	
	
/*	$("#div_fullscreen_grey").scroll(function(event) {
		console.log("스크롤을 막...");
		event.stopPropagation(); ------- NOT WORKING
	});
*/	
/*	$("body").on('scroll', function() {
		alert("야 되잖아");
	}); 
	
	$("body").click(function() {
		alert("이건...?");
	});*/

	//상품함 숨기고 보이기 작업하는 동안 잠깐 걸어놔서 풀어야 한다
	$(".product_hide").hide();
	$(".product_show").click(function() {
		$(this).parent().parent().parent().find(".product_hide").toggle();
	});
	

// 날짜 정보 가져오기
    let date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    let utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    let kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    let today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    let thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    let currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    let currentMonth = thisMonth.getMonth()+1; // 달력에서 표기하는 월
    let currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

 
$(function() {
    // 이전달로 이동
    $('.big_black_left_arrow').on('click', function() {
		currentMonth--;	
		if(currentMonth==0) { 
			currentYear--;
			currentMonth = 12;
		}
		$(this).parent().find(".show_date").text(currentYear + "년 " + currentMonth + "월");
//        thisMonth = new Date(currentYear, currentMonth - 1, 1);
//        currentMonth = thisMonth.getMonth(); 
//		alert(thisMonth);
//        renderCalender(thisMonth);
		makeCalenders();
    });

    // 다음달로 이동
    $('.big_black_right_arrow').on('click', function() {
		currentMonth++;
		if(currentMonth==13)  {
			currentYear++;
			currentMonth = 1;
		}
		$(this).parent().find(".show_date").text(currentYear + "년 " + currentMonth + "월");
//        thisMonth = new Date(currentYear, currentMonth + 1, 1);
//        currentMonth = thisMonth.getMonth();   // 0~11
//		alert(thisMonth);
//        renderCalender(thisMonth); 
		makeCalenders();
    });
/* } */
	
//상품비교함 배열
	$("#compare_in > div:nth-child(1) >div:nth-child(2) > button:nth-child(1)").click(function() {
		$("#compare_in").hide();
		$("#div_fullscreen_grey").hide();
	});
	
	const btn = document.querySelector('.btn-select');
	const list = document.querySelector('.list-member');
	btn.addEventListener('click', () => {
	  btn.classList.toggle('on');
	});
	list.addEventListener('click', (event) => {
	  if (event.target.nodeName === "BUTTON") {
	    btn.innerText = event.target.innerText;
	    btn.classList.remove('on');
	  }
	});
	
// 가격 단위에 쉼표 찍어주기
	$(".price_comma").each(function() {
    let text = $(this).text();
    let formattedText = text.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    $(this).text(formattedText);
	});
	
// 상품비교함 추가하기
 	let compareButtonToggle = false;
	$(".compare_button").click(function() {
	    if (compareButtonToggle) {
	        $(this).css('border', '');
	        $(this).css('color', '');
	    } else {
	        $(this).css('border', 'solid 1px #5e2bb8');
	        $(this).css('color', '#5e2bb8');
	        
	       	let comparePackageName = $(this).parent().parent().find(".comparePackageName").text();
	       	let comparePrice = $(this).parent().parent().find(".comparePrice").text();
			let compareFlightLogo = $(".compareFLightLogo").attr("src");			
	       	let compareFlightName = $(this).parent().parent().find(".compareFlightName").text();
	       	let compareDepartureTime = $(this).parent().parent().find(".compareDepartureTime").text();
	       	let compareArrivalTime = $(this).parent().parent().find(".compareArrivalTime").text();
	        alert(comparePackageName);
	        alert(comparePrice);
	        alert(compareFlightLogo);
	        alert(compareFlightName);
	        alert(compareDepartureTime);
	        alert(compareArrivalTime);
	    }
	    compareButtonToggle = !compareButtonToggle;
	});

// 일자형 캘린더 만들기
function makeCalenders() {
		let lastDay = new Date(currentYear, currentMonth, 0).getDate();    // month 는 1~12 라는 것 확인 완료.
		$("#row_calender1 > .days .day").remove();
		$("#row_calender1 > .dates .date").remove();
		$("#row_calender2 > .days .day").remove();
		$("#row_calender2 > .dates .date").remove();   
		let arr = ['일', '월', '화', '수', '목', '금', '토'];
		for(let i=1; i<=16; i++) {
			let idx = new Date(currentYear + "-" + currentMonth + "-" + i).getDay();
			let yoil = arr[idx];
			let sunsat = "";   // 요일에 따라서 "sun" 또는 "sat" 또는 ""를 대입.
			if(idx==0) sunsat = "sun";
			else if(idx==6) sunsat = "sat";
			
			let y = new Date().getFullYear();
			let m = new Date().getMonth() + 1; //month는 0~11까지기 때문에 +1을 해줘야 한다
			let d = new Date().getDate();
			if(currentYear==y && currentMonth==m && d==i) {
				sunsat += " today";
			}
			$("#row_calender1 > .days > div:last-child").before('<div class="fl day ' + sunsat + '">' + yoil + '</div>'); //★ 이거 뭐지 before이 날짜 계산해서 이전이면 true 반환해주는 코드
			$("#row_calender1 > .dates > div:last-child").before('<div class="fl date ' + sunsat + '">' + i + '</div>');
		}
		for(let i=17; i<=lastDay; i++) {
			let idx = new Date(currentYear + "-" + currentMonth + "-" + i).getDay();
			let yoil = arr[idx];
			let sunsat = "";   // 요일에 따라서 "sun" 또는 "sat" 또는 ""를 대입.
			if(idx==0) sunsat = "sun";
			else if(idx==6) sunsat = "sat";
			$("#row_calender2 > .days > div:last-child").before('<div class="fl day ' + sunsat + '">' + yoil + '</div>');
			$("#row_calender2 > .dates > div:last-child").before('<div class="fl date ' + sunsat + '">' + i + '</div>');
		}
		
		// 1일부터16일까지로 이동.
		$("#row_calender1").css('display', 'block');
		$("#row_calender2").css('display', 'none');
	}
	
	$(function() {
		$(".small_right_arrow").click(function() {
			$("#row_calender1").css('display', 'none');
			$("#row_calender2").css('display', 'block');
		});
		$(".small_left_arrow").click(function() {
			$("#row_calender1").css('display', 'block');
			$("#row_calender2").css('display', 'none');
		});
		
		makeCalenders();
		
		리스트가져와서그려();
	});	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});