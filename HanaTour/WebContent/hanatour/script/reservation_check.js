$(function() {
	
// 클릭한 내용 나오게 하기 (기본내용 패키지)
	// 기본
	$(".detail").hide();
	$("#package_detail").show();
	$("#package").css("color", "#5e2bb8");
	
	// 탭 누르면 detail 페이지 보여주기
	$("#package").click(function() {
		$(".detail").hide();
		$("#package_detail").show();
		resetTabs();
		$("#package").css("color", "#5e2bb8");
	});
	
	$("#hotel").click(function() {
		$(".detail").hide();
		$("#hotel_detail").show();
		resetTabs();
		$("#hotel").css("color", "#5e2bb8");
	});
	
	$("#oversea_flight").click(function() {
		$(".detail").hide();
		$("#oversea_flight_detail").show();
		resetTabs();
		$("#oversea_flight").css("color", "#5e2bb8");
	});
	
	$("#domestic_flight").click(function() {
		$(".detail").hide();
		$("#domestic_flight_detail").show();
		resetTabs();
		$("#domestic_flight").css("color", "#5e2bb8");
	});
	
	$("#flight_hotel").click(function() {
		$(".detail").hide();
		$("#flight_hotel_detail").show();
		resetTabs();
		$("#flight_hotel").css("color", "#5e2bb8");
	});
	
	$("#tour").click(function() {
		$(".detail").hide();
		$("#tour_detail").show();
		resetTabs();
		$("#tour").css("color", "#5e2bb8");
	});
	
	// 탭들의 css를 초기화하는 메소드
	function resetTabs() {
    $("#package").css("color", "");
    $("#hotel").css("color", "");
    $("#oversea_flight").css("color", "");
    $("#domestic_flight").css("color", "");
    $("#flight_hotel").css("color", "");
    $("#tour").css("color", "");
	}
	
// 예약내역/ 취소내역/ 지난내역 창 띄우기 
	// 기본 : 예약내역
	$(".tab_detail").hide();
	$(".reservation_tab_detail").show();
	$(".reservation_tab").css("color", "#5e2bb8");
	
	//tab 누르면 각 내용 보여주기	
	$(".reservation_tab").click(function() {
		$(".tab_detail").hide();
		$(".reservation_tab_detail").show();
		resetTab();
		$(".reservation_tab").css("color", "#5e2bb8");
	});
	
	$(".cancel_tab").click(function() {
		$(".tab_detail").hide();
		$(".cancel_tab_detail").show();
		resetTab();
		$(".cancel_tab").css("color", "#5e2bb8");
	});
	
	$(".last_tab").click(function() {
		$(".tab_detail").hide();
		$(".last_tab_detail").show();
		resetTab();
		$(".last_tab").css("color", "#5e2bb8");
	});
	
	// 탭들의 css를 초기화하는 메소드
	function resetTab() {
    $(".reservation_tab").css("color", "");
    $(".cancel_tab").css("color", "");
    $(".last_tab").css("color", "");
	}
	
	
	
});