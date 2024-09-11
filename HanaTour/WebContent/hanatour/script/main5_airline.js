
$(function() {

    // 항공 탭 바꾸기
    $(".airline_search_tab > div").click(function() {
        let tabIndex = $(this).index();
        console.log(tabIndex);

        $(this).parent().find(".airline_search_tab_active").removeClass("airline_search_tab_active");
        $(this).addClass("airline_search_tab_active");

        $(".airline_search").find(".airline_search_tab_active").removeClass("airline_search_tab_active");
        $(".airline_search > div").eq(tabIndex).addClass("airline_search_tab_active");
    }); 




    // 왕복 출발 공항목록 창 켜기
    $(".round_trip_departure_airport").click(function() {
        $(".search_airport_list.search_airport_list_active").removeClass("search_airport_list_active");
        $(this).find(".search_airport_list").addClass("search_airport_list_active");
    });


    // 왕복 도착 공항목록 창 켜기
    $(".round_trip_arrival_airport").click(function() {
        $(".search_airport_list.search_airport_list_active").removeClass("search_airport_list_active");
        $(this).find(".search_airport_list").addClass("search_airport_list_active");
    });


    // 공항목록 창 끄기
    $(".search_airport_list_close").click(function(e) {
        e.stopPropagation();
        $(this).closest(".search_airport_list").removeClass("search_airport_list_active");
    })


    // 최근 검색 공항 선택
    $(".search_airport_recent > span:nth-child(1)").click(function(e) {
        e.stopPropagation();

        let selectAitportSplit = $(this).text().split("(");
        
        let cityName = selectAitportSplit[0].trim();
        let iata = selectAitportSplit[1].replace(")", " ");

        let iataCityName = iata + cityName;

        $(this).closest(".search_airport_list").siblings("input[type='text']").val(iataCityName);
        $(this).closest(".search_airport_list").removeClass("search_airport_list_active");
    });

 



    // 공항목록 - 최근 검색 개별 삭제
    $(".search_airport_recent > span:nth-child(2)").click(function() {
        $(this).parent().remove();
    });

    // 공항목록 - 최근 검색 기록 전체삭제
    $(".search_airport_recent_delete").click(function() {
        $(this).parent().find(".search_airport_recent").remove();
    });


    // 공항목록 - 탭 변경
    $(".search_airport_list4_left > div").click(function() {
        let tabIndex = $(this).index();

        $(this).parent().find(".search_airport_list4_active").removeClass("search_airport_list4_active");
        $(this).addClass("search_airport_list4_active");

        $(this).parent().parent().find(".search_airport_list4_right .search_airport_list4_active").removeClass("search_airport_list4_active");
        $(this).parent().siblings(".search_airport_list4_right").children().eq(tabIndex).addClass("search_airport_list4_active");
    })



    // 공항목록 - 공항선택(나중에 ajax로 iata 추가)
    $(".search_airport_list4_container > div").click(function(e) {
        e.stopPropagation();
        $(this).closest(".search_airport_list").siblings("input[type='text']").val($(this).text());
        $(this).closest(".search_airport_list").removeClass("search_airport_list_active");
    });



    // 왕복 출발지 <-> 도착지
    $(".round_trip_change").click(function() {
        let tempVal1 = $("input[name='round_trip_departure_airport']").val();
        $("input[name='round_trip_departure_airport']").val( $("input[name='round_trip_arrival_airport']").val() ) ;
        $("input[name='round_trip_arrival_airport']").val(tempVal1);
    })



    // 왕복 직항 버튼
    $(".round_trip_direct_flight").click(function() {

        if( $(this).hasClass("round_trip_direct_flight_active") ) {
            $(this).removeClass("round_trip_direct_flight_active");
            $("input[name='round_trip_direct']").prop("checked", false);
        } else {
            $(this).addClass("round_trip_direct_flight_active");
            $("input[name='round_trip_direct']").prop("checked", true);
        }

    });



    

    // 달력 시작

    // 출발일 클릭
    
    let myPicker = null;
    $(".round_trip_departure_date").click(function() {
        if (!myPicker) {
            $(".round_trip_calender_select").css("display", "block");
            myPicker = new Lightpick({
                field: document.querySelector("input[name='round_trip_departure_date_calender']"),
                secondField: document.querySelector("input[name='round_trip_arrival_date_calender']"),
                singleDate: false,
                numberOfMonths: 2,
                format: 'YYYY.MM.DD',
                inline: true
            });
        }
    });

    // 도착일 클릭
    $(".round_trip_arrival_date").click(function() {
        if (!myPicker) {
            $(".round_trip_calender_select").css("display", "block");
            myPicker = new Lightpick({
                field: document.querySelector("input[name='round_trip_departure_date_calender']"),
                secondField: document.querySelector("input[name='round_trip_arrival_date_calender']"),
                singleDate: false,
                numberOfMonths: 2,
                format: 'YYYY.MM.DD',
                inline: true
            });
        }
    });

    // 날짜 선택완료
    $(".round_trip_calender_select").on("click", function(e) {
        e.stopPropagation();
        if( $("input[name='round_trip_departure_date_calender']").val() != "" 
            && $("input[name='round_trip_arrival_date_calender']").val() != ""  ) { 
            $("section.lightpick").css("display", "none");
            $(this).css("display", "none"); 
        } else {
            alert("날짜를 선택해주세요.")
        }
    })
    
    // 달력 종료


    // 왕복 인원수 = 전체
    let roundTripAdultNumber = 1;
    let roundTripChildNumber = 0;
    let roundTripInfantNumber = 0;
    let roundTripMemberNumber = roundTripAdultNumber + roundTripChildNumber + roundTripInfantNumber;
 
    // 왕복 인원수 - 성인
    function roundTripMemberAdultNumberText() {
        roundTripMemberNumber = roundTripAdultNumber + roundTripChildNumber + roundTripInfantNumber;
        $(".round_trip_member_adult_number").text(roundTripAdultNumber); 
    }
 
    // 왕복 인원수 - 성인 감소
    $(".round_trip_member_adult > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(roundTripAdultNumber >= 2 ) {
            roundTripAdultNumber--;
            roundTripMemberAdultNumberText();
        }

    });
 
 
    // 왕복 인원수 - 성인 증가
    $(".round_trip_member_adult > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( roundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            roundTripAdultNumber++;
            roundTripMemberAdultNumberText();
        }
    });
 
     
 
   
    // 왕복 인원수 - 소아
    function roundTripMemberChildNumberText() {
        roundTripMemberNumber = roundTripAdultNumber + roundTripChildNumber + roundTripInfantNumber;
        $(".round_trip_member_child_number").text(roundTripChildNumber); 
    }
 
 
    // 왕복 인원수 - 소아 감소
    $(".round_trip_member_child > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(roundTripChildNumber >= 1 ) {
            roundTripChildNumber--;
            roundTripMemberChildNumberText();
        }
    });
 
 
    // 왕복 인원수 - 소아 증가
    $(".round_trip_member_child > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( roundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            roundTripChildNumber++;
            roundTripMemberChildNumberText();
        }
    });
 
 
 
 
    // 왕복 인원수 - 유아
    function roundTripMemberInfantNumberText() {
        roundTripMemberNumber = roundTripAdultNumber + roundTripChildNumber + roundTripInfantNumber;
        $(".round_trip_member_infant_number").text(roundTripInfantNumber); 
    }
 
 
    // 왕복 인원수 - 유아 감소
    $(".round_trip_member_infant > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(roundTripInfantNumber >= 1 ) {
            roundTripInfantNumber--;
            roundTripMemberInfantNumberText();
        }
    });
 
 
    // 왕복 인원수 - 유아 증가
    $(".round_trip_member_infant > div:nth-child(2) > div:nth-child(3)").click(function() {
        if(roundTripInfantNumber == roundTripAdultNumber) {
            alert("성인1명에 유아1명만을 예약하실수 있으며, 나머지 유아는 소아로 예약하셔야 합니다");
        } else if( roundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            roundTripInfantNumber++;
            roundTripMemberInfantNumberText();
        }
    });
 
 
    // 왕복 좌석등급
    $(".round_trip_member4 > div > label").click(function() {

        if( !$(this).hasClass("round_trip_seat_class_active") ) {
            $(this).parent().parent().find(".round_trip_seat_class_active").removeClass("round_trip_seat_class_active");
            $(this).addClass("round_trip_seat_class_active");
            $(this).find("input[name='round_trip_seat_class']").prop("checked", true);
        }

    });
 


    function roundTripMemberSeatClassSelect() {

        let roundTripAdultInput = "성인 " + roundTripAdultNumber + "명";
        let roundTripChildInput = "";
        let roundTripInfantInput = "";
        let roundTripSeatClassInput = "  ' 일반석";
    
        if(roundTripChildNumber != 0) {
            roundTripChildInput = ",소아 " + roundTripChildNumber + "명";
        } 
        
        
        if(roundTripInfantNumber != 0) {
           roundTripInfantInput = ",유아 " + roundTripInfantNumber + "명";
        } 
        
        
        if( $("input[name='round_trip_seat_class']:checked").val() == "prestige" ) {
            roundTripSeatClassInput = "  '  프레스티지석";
        } 
    
        let roundTripMemberInput = roundTripAdultInput 
                                                + roundTripChildInput 
                                                + roundTripInfantInput 
                                                + roundTripSeatClassInput;

        return roundTripMemberInput;
    }

 
 
    $(".round_trip2_right").click(function() {
        $(".round_trip_member").css("display", "block");
    });

 
    // 왕복 인원수, 좌석 선택완료
    $(".round_trip_member_select").click(function(e) {
        e.stopPropagation();
        $("input[name='round_trip_member']").val( roundTripMemberSeatClassSelect() );
        $(".round_trip_member").css("display", "none");
    });
 
 


    // 왕복 input defualt
    $("input[name='round_trip_departure']").val("SEL 인천/김포");
    $("input[name='round_trip_member']").val("성인 1명  '  일반석")

   
    // 왕복 - 항공권 검색(submit)
    $(".round_trip_submit").click(function() {
        if(
            $("input[name='round_trip_departure_airport']").val() != ""
            && $("input[name='round_trip_arrival_airport']").val() != ""
            && $("input[name='round_trip_departure_date_calender']").val() != ""
            && $("input[name='round_trip_arrival_date_calender']").val() != ""
            && $("input[name='round_trip_member']").val() != "" ) {
            
            $(this).closest("form").submit();
        } else {
            alert("입력항목을 확인해주세요.")
        }

    });






	// 날씨 정보창 켜기
	$(".weather_info").click(function() {
		$(".weather_info_list").css("display", "block");
	});
	
	// 날씨 정보창 끄기
	$(".weather_info_close").click(function(e) {
		e.stopPropagation();
		$(".weather_info_list").css("display", "none");		
	})
	
	// 날씨 검색
	$(".weather_iata").click(function() {
		let weatherIata = $("input[name='weather_iata']").val();
		$("input[name='weather_iata_real']").val(weatherIata);
		$("input[name='weather_iata_real']").closest("form").submit();
	});
	










  
});