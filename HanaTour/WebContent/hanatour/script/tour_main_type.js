$(function() {

// 유형1 재생 <-> 클릭
    $(".type1_img_slider_btn > div:nth-child(3) > a").click(function(e) {
        if(  $(this).children("img").attr("src")  == "../../img/main5_airline/type1_button_play.png" ) {
            $(this).children("img").attr("src", "../../img/main5_airline/type1_button_stop.png");
        } else {
            $(this).children("img").attr("src", "../../img/main5_airline/type1_button_play.png");
        }

        e.preventDefault();
    });

// 캘린더 넘김 방지 
	 $("#button_stop").click(function(e) {
	    let departureDate = $("#input_start_date").val(); 
	    let arrivalDate = $("#input_end_date").val();  
		$("#start_date_result").val(departureDate);
		$("#end_date_result").val(arrivalDate);  
	    $("#tour_date_hide").hide(); 
	    e.preventDefault(); // 기본 동작 방지
	    e.stopPropagation(); // 이벤트 전파 방지
	});

// 캘린더 문자 받아오기
	
	
	
 // 유형2 재생 <-> 클릭
    $(".type2_control_bottom > div:nth-child(4) > a").click(function(e) {

        if ( $(this).find("img").attr("src") ==  "../../img/main5_airline/type2_stop.png") {
            $(this).find("img").attr("src", "../../img/main5_airline/type2_play.png");
        } else {
            $(this).find("img").attr("src", "../../img/main5_airline/type2_stop.png");
        }

        e.preventDefault();
    });



    // 유형3 탭변경
    $(".type3_tab > div").click(function() {

        $(".type3_tab > div").removeClass("type3_tab_active");

        $(this).addClass("type3_tab_active");
    });

    // 유헝9 탭변경
    $(".type9_tab > div").click(function() {
        let index = $(this).index();
        console.log(index);

        $(this).parent().find(".type9_tab_active").removeClass("type9_tab_active");
        $(this).addClass("type9_tab_active");

        let type9_type8_container = $(".type9_type8_container");

        type9_type8_container.find(".type9_tab_active").removeClass("type9_tab_active"); 
        type9_type8_container.children().eq(index).addClass("type9_tab_active");

    });


//where hide 숨기고 보여주기 
	$("#where_hide").hide();
	$("#where").click(function(e) {
		$("#where_hide").toggle();
		
		
	});
	
// 여행일 선택창 숨기고 보이기
	$("#tour_date_hide").hide();
	let myPicker = null;
	$("#tour_date").click(function() {
		$("#tour_date_hide").show();
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
	

	
// 슬라이드 	
	new Swiper('.swiper', {
	    slidesPerView : 'auto',
	    spaceBetween : 2, 
	    autoplay: {
        	delay: 2000, // 시작시간 설정
      	},
	});
	
	



});