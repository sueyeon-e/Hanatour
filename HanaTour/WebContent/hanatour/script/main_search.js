$(function() {	

//	관광지와 관광지 설명 선택 
	// 기본적으로 숨기기
	$(".attraction_ex").hide();
	$(".attraction_ex").eq(0).show(); // eq() : 숫자의 요소를 가져옴
	$(".recommend_circle").click(function() {
		let index = $(this).index(); // index() : 인덱스 찾기
		$(".attraction_ex").hide();
		$(".attraction_ex").eq(index).show();
	});





});