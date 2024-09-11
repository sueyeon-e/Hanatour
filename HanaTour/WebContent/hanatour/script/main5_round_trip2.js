$(function() {
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;


    // 항공권 조회 페이지 변경 버튼
    $(".airline_info_change_btn").click(function() {    

        if( $(".airline_search_page_header_inner2").hasClass("airline_info_change_active") ) {
            $(".airline_search_page_header_inner2").removeClass("airline_info_change_active");
            $(".airline_search_page_header").css("height", "150px");
        } else {
            $(".airline_search_page_header_inner2").addClass("airline_info_change_active");
            $(".airline_search_page_header").css("height", "464px");
        }
    });




	// 항공 검색창 시작
	
	
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
	
	// 항공 검색창 종료





    // 항공권 조회 페이지 필터링 열고 닫기
    $(".airline_filter > div:nth-child(1)").click(function() {

        let airline_filter_2nd_child = $(this).parent().children("div:nth-child(2)");

        if( airline_filter_2nd_child.hasClass("airline_filter_display_block") ) {
            airline_filter_2nd_child.removeClass("airline_filter_display_block");
        } else {
            airline_filter_2nd_child.addClass("airline_filter_display_block");
        }

    });

    
    // 모두펼침, 모두닫힘
    $(".airline_filter_open_all").click(function() {

        let airline_filter = $(".airline_filter").children("div:nth-child(2)");
        // console.log(airline_filter);

        if( $(this).text() == "모두펼침" ) { // 텍스트가 "모두펼침" 일때
            $(this).text("모두닫힘");
            airline_filter.addClass("airline_filter_display_block");
        } else { // 텍스트가 "모두닫힘" 일때
            $(this).text("모두펼침");
            airline_filter.removeClass("airline_filter_display_block");
        }

    });


    // 필터 개수
    let numberOfFilter = $(".airline_filter_list2").children().length;
    $(".airline_filter_list1 > span:nth-child(3)").text(numberOfFilter);


    // 필터 개별 삭제
    $(".airline_filter_list2 > span").click(function() {
        $(this).remove();
        let numberOfFilter = $(".airline_filter_list2").children().length;
        $(".airline_filter_list1 > span:nth-child(3)").text(numberOfFilter);
    });

    // 필터 전체 삭제
    $(".airline_filter_list3").click(function() {
        $(".airline_filter_list2").children().remove();
        let numberOfFilter = $(".airline_filter_list2").children().length;
        $(".airline_filter_list1 > span:nth-child(3)").text(numberOfFilter);
    });


    




    // 항공권 정렬 
    $(".airline_ticket_order > span").click(function() {
        $(this).parent().find(".airline_ticket_order_active").removeClass("airline_ticket_order_active");
        $(this).addClass("airline_ticket_order_active");

		// 버튼순서 0~3
		let sortBtnIdx = $(this).index();
		
		// 현재 출력된 티켓 idx 배열
		let ticketIdx = $("input[name='airline_ticket_id']").map(function() {
				return $(this).val();
		}).get();
		
		
		if(sortBtnIdx == 0) { // 추천순
			alert("준비중입니다.")
		} else if(sortBtnIdx == 1) { // 가격낮은순
		 	
		} else if(sortBtnIdx == 2) { // 소요시간적은순
			
		} else { // 출발시간빠른순
			airlineTicketSortDate(sortBtnIdx, ticketIdx);
			
		}
    })
 
	
	// 4. 출발시간빠른순
	function airlineTicketSortDate(sortBtnIdx, ticketIdx) {
		$.ajax({
			type: "GET",
			async: true,
			url: contextPath + "/AirlineTicketSortServlet",
			data: {
				sortBtnIdx: sortBtnIdx,
				ticketIdx: ticketIdx
			},
			traditional: true,
			dataType: "json",
			success: function() {
				console.log("빠른날짜순 success");
			}, error: function() {
				console.log("빠른날짜순error");
			}, complete: function() {
				console.log("빠른날짜순 complete");
			}
		})
	}
	





    // 공동운항 아이콘 없애기 
	$(".airline_ticket_codeshare > span:nth-child(1)").each(function(){
		if( $(this).text().trim() == "" ) {
			$(this).parent().remove();
		}   	
	}) 
	
	
	// 직항 아닐시 빨간색
	$(".airline_ticket_stop > div:nth-child(3)").each(function() {
		if( $(this).text().trim() == "직항" ) {
			$(this).css("color", "#666");
		} else {
			$(this).css("color", "red");
		}
	});
	


    // 항공권 선택
    $(".airline_ticket_select_btn").click(function(e) {
		e.preventDefault();
		
		let ticketIdx = $(this).closest(".airline_ticket").find("input[name='airline_ticket_id']").val();
		$("input[name='roundtrip_airline_ticket2']").val(ticketIdx);
		/*		
			console.log("출발IATA : " + $("input[name='roundtrip_departure_iata']").val());
			console.log("출발도시 : " + $("input[name='roundtrip_departure_city']").val());
			console.log("출발날짜 : " + $("input[name='roundtrip_departure_date']").val());
			
			console.log("도착IATA : " + $("input[name='roundtrip_arrival_iata']").val());
			console.log("도착도시 : " + $("input[name='roundtrip_arrival_city']").val());
			console.log("도착날짜: " + $("input[name='roundtrip_arrival_date']").val());
			
			console.log("좌석등급 : " + $("input[name='roundtrip_seat_class']").val());
			console.log("성인수 : " + $("input[name='roundtrip_adult']").val());
			console.log("소아수 : " + $("input[name='roundtrip_child']").val());
			console.log("유아수 : " + $("input[name='roundtrip_infant']").val());
			
			console.log("티켓idx : " + $("input[name='roundtrip_airline_ticket1']").val());
		*/
		
		$(".round_trip_select1").submit();
		
	});
    




    // 상세일정 보기 팝업
    $(".airline_ticket_detail_schedule").click(function() {
        console.log("click");
        $(".airline_ticket_detail_schedule_popup").addClass("airline_ticket_detail_schedule_popup_active");

    });

    // 상세일정 끄기
    $(".airline_ticket_detail_schedule_popup1 > div:nth-child(2)").click(function() {
        $(".airline_ticket_detail_schedule_popup").removeClass("airline_ticket_detail_schedule_popup_active");
    });



	

	






});