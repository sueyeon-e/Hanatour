




    

$(function() {

    // 메인1_유형1 이미지 슬라이더 bx slider
    $('.bxslider2').bxSlider({
        auto: true,
        autoControls: true,
        stopAutoOnClick: true,
        pager: true,
        slideWidth: 600
    });
    


    // 메인1_유형1 검색창 탭
    $(".main1_type1_search_tab > div").click(function() {
        $(this).parent().find(".main1_type1_search_tab_active").removeClass("main1_type1_search_tab_active");
        $(this).addClass("main1_type1_search_tab_active");
        searchTabChange();
    });


    function searchTabChange() {
        $(".main1_type1_search_setting").find(".main1_type1_search_tab_active").removeClass("main1_type1_search_tab_active");

        if( $(".main1_type1_search_tab > div:nth-child(1)").hasClass("main1_type1_search_tab_active") ) {
            $(".main1_type1_search_tour").addClass("main1_type1_search_tab_active");
        } else if( $(".main1_type1_search_tab > div:nth-child(2)").hasClass("main1_type1_search_tab_active")  ) {
            $(".main1_type1_search_airline").addClass("main1_type1_search_tab_active");
        } else {
            $(".main1_type1_search_inn").addClass("main1_type1_search_tab_active");
        }
    }




    // 패키지 항공권은 있어요, 우리끼리만 여행할래요
    $(".main1_type1_search_tour4 > label").click(function() {
        if( $(this).hasClass("main1_type1_search_tour4_active")  ) {
            $(this).removeClass("main1_type1_search_tour4_active");
            $(this).find("input").prop("checked", false);
            
        } else {
            $(this).addClass("main1_type1_search_tour4_active");
            $(this).find("input").prop("checked", true);
        }
    });
    

    // 어디로 떠나세요 foucus
    $("input[name='search_tour_arrival']").focus(function() {
        $(".main1_type1_search_tour1").removeClass("main1_type1_search_tour1_input_empty");
        $("input[name='search_tour_arrival']").attr("placeholder", "어디로 떠나세요?");
    });


   // 패키지 검색
    $(".main1_type1_search_tour5").click(function() {
        if( $("input[name='search_tour_arrival']").val() == "" ) {
            $(".main1_type1_search_tour1").addClass("main1_type1_search_tour1_input_empty");
            $("input[name='search_tour_arrival']").attr("placeholder", "목적지를 검색해주세요.");
        } else {
            $(this).closest("form").submit();
        }
    })


   
  





    // 항공탭 변경
    $(".main1_type1_search_airline_tab > div").click(function() {
        let index = $(this).index();
        $(this).parent().find(".main1_type1_search_airline_active").removeClass("main1_type1_search_airline_active");
        $(this).addClass("main1_type1_search_airline_active");


        $(".main1_type1_search_airline_search_setting").find(".main1_type1_search_airline_active").removeClass("main1_type1_search_airline_active");
        $(".main1_type1_search_airline_search_setting").children().eq(index).addClass("main1_type1_search_airline_active");


    });



    let currentDate = new Date();
    
    // 항공 기본 출발 시간 - 시스템시간 + 1일
    let defaultDepartureTime = new Date(currentDate); 
    defaultDepartureTime.setDate(currentDate.getDate() + 1); 
    // 항공 기본 도착 시간 - 시스템시간 + 5일
    let defaultArrivalTime = new Date(currentDate);
    defaultArrivalTime.setDate(currentDate.getDate() + 5);

    // 호텔 기본 도착시간 - 시스템시간 + 6일
    defaultInnArrival = new Date(currentDate);
    defaultInnArrival.setDate(currentDate.getDate() + 6);

    // 출발년
    let defaultDepartureYear = defaultDepartureTime.getFullYear();

    // 도착년
    let defaultArrivalYear = defaultArrivalTime.getFullYear();
    let defaultInnArrivalYear = defaultInnArrival.getFullYear();

    // 출발월
    let defaultDepartureMonth = defaultDepartureTime.getMonth() + 1;
    if(defaultDepartureMonth < 10) {
        defaultDepartureMonth = "0" + defaultDepartureMonth;
    }

    // 도착월
    let defaultArrivalMonth = defaultArrivalTime.getMonth() + 1;
    if(defaultArrivalMonth < 10) {
        defaultArrivalMonth = "0" + defaultArrivalMonth;
    }

    let defaultInnArrivalMonth = defaultInnArrival.getMonth() + 1;
    if(defaultInnArrivalMonth < 10) {
        defaultInnArrivalMonth = "0" + defaultInnArrivalMonth;
    }


    // 출발일
    let defaultDepartureDate = defaultDepartureTime.getDate();
    if(defaultDepartureDate < 10) {
        defaultDepartureDate = "0" + defaultDepartureDate;
    }

    // 도착일
    let defaultArrivalDate = defaultArrivalTime.getDate();
    if(defaultArrivalDate < 10) {
        defaultArrivalDate = "0" + defaultArrivalDate;
    }

    let defaultInnArrivalDate = defaultInnArrival.getDate();
    if(defaultInnArrivalDate < 10) {
        defaultInnArrivalDate = "0" + defaultInnArrivalDate;
    }


    // 요일리스트
    let listOfDay = ["일", "월", "화", "수", "목", "금", "토"];

    // 출발 요일
    let defaultDepartureDayNumber = defaultDepartureTime.getDay();
    let defaultDepartureDay = listOfDay[defaultDepartureDayNumber];

    // 도착 요일
    let defaultArrivalDayNumber = defaultArrivalTime.getDay();
    let defaultArrivalDay = listOfDay[defaultArrivalDayNumber];

    // 날짜 문자열로 정리
    let defaultDepartureTimeInput = defaultDepartureYear + "." + defaultDepartureMonth + "." + defaultDepartureDate + "(" + defaultDepartureDay + ")";
    let defaultArrivalTimeInput = defaultArrivalYear + "." + defaultArrivalMonth + "." + defaultArrivalDate + "(" + defaultArrivalDay + ")";










    // 왕복 직항 버튼
    $(".main1_type1_search_airline_round_trip3 > div:nth-child(2)").click(function() {
        if( $(this).hasClass("round_trip_direct_active") ) {
            $(this).removeClass("round_trip_direct_active");
            $("input[name='search_airline_round_trip_direct']").prop("checked", false);
        } else {
            $(this).addClass("round_trip_direct_active");
            $("input[name='search_airline_round_trip_direct']").prop("checked", true);
        }
    });

    // 왕복 인원수 = 전체
    let searchAirlineRoundTripAdultNumber = 1;
    let searchAirlineRoundTripChildNumber = 0;
    let searchAirlineRoundTripInfantNumber = 0;
    let searchAirlineRoundTripMemberNumber = searchAirlineRoundTripAdultNumber + searchAirlineRoundTripChildNumber + searchAirlineRoundTripInfantNumber;
 
    // 왕복 인원수 - 성인
    function roundTripMemberAdultNumberText() {
        searchAirlineRoundTripMemberNumber = searchAirlineRoundTripAdultNumber + searchAirlineRoundTripChildNumber + searchAirlineRoundTripInfantNumber;
        $(".search_airline_round_trip_member_adult_number").text(searchAirlineRoundTripAdultNumber); 
    }
 
    // 왕복 인원수 - 성인 감소
    $(".search_airline_round_trip_member_adult > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineRoundTripAdultNumber >= 2 ) {
            searchAirlineRoundTripAdultNumber--;
            roundTripMemberAdultNumberText();
        }

    });
 
 
    // 왕복 인원수 - 성인 증가
    $(".search_airline_round_trip_member_adult > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( searchAirlineRoundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineRoundTripAdultNumber++;
            roundTripMemberAdultNumberText();
        }
    });
 
     
 
   
    // 왕복 인원수 - 소아
    function roundTripMemberChildNumberText() {
        searchAirlineRoundTripMemberNumber = searchAirlineRoundTripAdultNumber + searchAirlineRoundTripChildNumber + searchAirlineRoundTripInfantNumber;
        $(".search_airline_round_trip_member_child_number").text(searchAirlineRoundTripChildNumber); 
    }
 
 
    // 왕복 인원수 - 소아 감소
    $(".search_airline_round_trip_member_child > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineRoundTripChildNumber >= 1 ) {
            searchAirlineRoundTripChildNumber--;
            roundTripMemberChildNumberText();
        }
    });
 
 
    // 왕복 인원수 - 소아 증가
    $(".search_airline_round_trip_member_child > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( searchAirlineRoundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineRoundTripChildNumber++;
            roundTripMemberChildNumberText();
        }
    });
 
 
 
 
    // 왕복 인원수 - 유아
    function roundTripMemberInfantNumberText() {
        searchAirlineRoundTripMemberNumber = searchAirlineRoundTripAdultNumber + searchAirlineRoundTripChildNumber + searchAirlineRoundTripInfantNumber;
        $(".search_airline_round_trip_member_infant_number").text(searchAirlineRoundTripInfantNumber); 
    }
 
 
    // 왕복 인원수 - 유아 감소
    $(".search_airline_round_trip_member_infant > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineRoundTripInfantNumber >= 1 ) {
            searchAirlineRoundTripInfantNumber--;
            roundTripMemberInfantNumberText();
        }
    });
 
 
    // 왕복 인원수 - 유아 증가
    $(".search_airline_round_trip_member_infant > div:nth-child(2) > div:nth-child(3)").click(function() {
        if(searchAirlineRoundTripInfantNumber == searchAirlineRoundTripAdultNumber) {
            alert("성인1명에 유아1명만을 예약하실수 있으며, 나머지 유아는 소아로 예약하셔야 합니다");
        } else if( searchAirlineRoundTripMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineRoundTripInfantNumber++;
            roundTripMemberInfantNumberText();
        }
    });
 
 
    // 왕복 좌석등급
    $(".search_airline_round_trip_member4 > div > label").click(function() {

        if( !$(this).hasClass("search_airline_round_trip_seat_class_active") ) {
            $(this).parent().parent().find(".search_airline_round_trip_seat_class_active").removeClass("search_airline_round_trip_seat_class_active");
            $(this).addClass("search_airline_round_trip_seat_class_active");
            $(this).find("input[name='search_airline_round_trip_seat_class']").prop("checked", true);
        }

    });
 


    function roundTripMemberSeatClassSelect() {

        let searchAirlineRoundTripAdultInput = "성인 " + searchAirlineRoundTripAdultNumber + "명";
        let searchAirlineRoundTripChildInput = "";
        let searchAirlineRoundTripInfantInput = "";
        let searchAirlineRoundTripSeatClassInput = "  ' 일반석";
    
        if(searchAirlineRoundTripChildNumber != 0) {
            searchAirlineRoundTripChildInput = ",소아 " + searchAirlineRoundTripChildNumber + "명";
        } 
        
        
        if(searchAirlineRoundTripInfantNumber != 0) {
           searchAirlineRoundTripInfantInput = ",유아 " + searchAirlineRoundTripInfantNumber + "명";
        } 
        
        
        if( $("input[name='search_airline_round_trip_seat_class']:checked").val() == "prestige" ) {
            searchAirlineRoundTripSeatClassInput = "  '  프레스티지석";
        } 
    
        let searchAirlineRoundTripMemberInput = searchAirlineRoundTripAdultInput 
                                                + searchAirlineRoundTripChildInput 
                                                + searchAirlineRoundTripInfantInput 
                                                + searchAirlineRoundTripSeatClassInput;

        return searchAirlineRoundTripMemberInput;
    }

 
 
    $(".main1_type1_search_airline_round_trip3 > div:nth-child(1)").click(function() {
        $(".search_airline_round_trip_member").css("display", "block");
    });

 
    // 왕복 인원수, 좌석 선택완료
    $(".search_airline_round_trip_member_select").click(function() {
        $("input[name='search_airline_round_trip_member']").val( roundTripMemberSeatClassSelect() );
        $(".search_airline_round_trip_member").css("display", "none");
    });
 
 


    // 왕복 input defualt
    $("input[name='search_airline_round_trip_departure']").val("SEL 인천/김포");
    $("input[name='search_airline_round_trip_departure_date']").val(defaultDepartureTimeInput);
    $("input[name='search_airline_round_trip_arrival_date']").val(defaultArrivalTimeInput)
    $("input[name='search_airline_round_trip_member']").val("성인 1명  '  일반석")

   



      
    // 왕복 submit
    $(".main1_type1_search_airline_round_trip4").click(function() {
        if( $("input[name='search_airline_round_trip_arrival']").val() == "" ) {
            $(".main1_type1_search_airline_round_trip_submit_fail").css("display", "block");
        } else {
            $(this).closest("form").submit();
        }
    });













    // 편도 직항 버튼
    $(".main1_type1_search_airline_one_way3 > div:nth-child(2)").click(function() {
    if( $(this).hasClass("one_way_direct_active") ) {
        $(this).removeClass("one_way_direct_active");
        $("input[name='search_airline_one_way_direct']").prop("checked", false);
    } else {
    $(this).addClass("one_way_direct_active");
        $("input[name='search_airline_one_way_direct']").prop("checked", true);
    }
    });




    // 편도 인원수 = 전체
    let searchAirlineOneWayAdultNumber = 1;
    let searchAirlineOneWayChildNumber = 0;
    let searchAirlineOneWayInfantNumber = 0;
    let searchAirlineOneWayMemberNumber = searchAirlineOneWayAdultNumber + searchAirlineOneWayChildNumber + searchAirlineOneWayInfantNumber;
 
    // 편도 인원수 - 성인
    function OneWayMemberAdultNumberText() {
        searchAirlineOneWayMemberNumber = searchAirlineOneWayAdultNumber + searchAirlineOneWayChildNumber + searchAirlineOneWayInfantNumber;
        $(".search_airline_one_way_member_adult_number").text(searchAirlineOneWayAdultNumber); 
    }
 
    // 편도 인원수 - 성인 감소
    $(".search_airline_one_way_member_adult > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineOneWayAdultNumber >= 2 ) {
            searchAirlineOneWayAdultNumber--;
            OneWayMemberAdultNumberText();
        }

    });
 
 
    // 편도 인원수 - 성인 증가
    $(".search_airline_one_way_member_adult > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( searchAirlineOneWayMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineOneWayAdultNumber++;
            OneWayMemberAdultNumberText();
        }
    });
 
     
 
   
    // 편도 인원수 - 소아
    function OneWayMemberChildNumberText() {
        searchAirlineOneWayMemberNumber = searchAirlineOneWayAdultNumber + searchAirlineOneWayChildNumber + searchAirlineOneWayInfantNumber;
        $(".search_airline_one_way_member_child_number").text(searchAirlineOneWayChildNumber); 
    }
 
 
    // 편도 인원수 - 소아 감소
    $(".search_airline_one_way_member_child > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineOneWayChildNumber >= 1 ) {
            searchAirlineOneWayChildNumber--;
            OneWayMemberChildNumberText();
        }
    });
 
 
    // 편도 인원수 - 소아 증가
    $(".search_airline_one_way_member_child > div:nth-child(2) > div:nth-child(3)").click(function() {
        if( searchAirlineOneWayMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineOneWayChildNumber++;
            OneWayMemberChildNumberText();
        }
    });
 
 
 
 
    // 편도 인원수 - 유아
    function OneWayMemberInfantNumberText() {
        searchAirlineOneWayMemberNumber = searchAirlineOneWayAdultNumber + searchAirlineOneWayChildNumber + searchAirlineOneWayInfantNumber;
        $(".search_airline_one_way_member_infant_number").text(searchAirlineOneWayInfantNumber); 
    }
 
 
    // 편도 인원수 - 유아 감소
    $(".search_airline_one_way_member_infant > div:nth-child(2) > div:nth-child(1)").click(function() {
        if(searchAirlineOneWayInfantNumber >= 1 ) {
            searchAirlineOneWayInfantNumber--;
            OneWayMemberInfantNumberText();
        }
    });
 
 
    // 편도 인원수 - 유아 증가
    $(".search_airline_one_way_member_infant > div:nth-child(2) > div:nth-child(3)").click(function() {
        if(searchAirlineOneWayInfantNumber == searchAirlineOneWayAdultNumber) {
            alert("성인1명에 유아1명만을 예약하실수 있으며, 나머지 유아는 소아로 예약하셔야 합니다");
        } else if( searchAirlineOneWayMemberNumber >= 9) {
            alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
        } else {
            searchAirlineOneWayInfantNumber++;
            OneWayMemberInfantNumberText();
        }
    });
 
 
    // 편도 좌석등급
    $(".search_airline_one_way_member4 > div > label").click(function() {

        if( !$(this).hasClass("search_airline_one_way_seat_class_active") ) {
            $(this).parent().parent().find(".search_airline_one_way_seat_class_active").removeClass("search_airline_one_way_seat_class_active");
            $(this).addClass("search_airline_one_way_seat_class_active");
            $(this).find("input[name='search_airline_one_way_seat_class']").prop("checked", true);
        }

    });
 


    function OneWayMemberSeatClassSelect() {

        let searchAirlineOneWayAdultInput = "성인 " + searchAirlineOneWayAdultNumber + "명";
        let searchAirlineOneWayChildInput = "";
        let searchAirlineOneWayInfantInput = "";
        let searchAirlineOneWaySeatClassInput = "  ' 일반석";
    
        if(searchAirlineOneWayChildNumber != 0) {
            searchAirlineOneWayChildInput = ",소아 " + searchAirlineOneWayChildNumber + "명";
        } 
        
        
        if(searchAirlineOneWayInfantNumber != 0) {
           searchAirlineOneWayInfantInput = ",유아 " + searchAirlineOneWayInfantNumber + "명";
        } 
        
        
        if( $("input[name='search_airline_one_way_seat_class']:checked").val() == "prestige" ) {
            searchAirlineOneWaySeatClassInput = "  '  프레스티지석";
        } 
    
        let searchAirlineOneWayMemberInput = searchAirlineOneWayAdultInput 
                                                + searchAirlineOneWayChildInput 
                                                + searchAirlineOneWayInfantInput 
                                                + searchAirlineOneWaySeatClassInput;

        return searchAirlineOneWayMemberInput;
    }

 
    $(".main1_type1_search_airline_one_way3 > div:nth-child(1)").click(function() {
        $(".search_airline_one_way_member").css("display", "block");
    });

 
     // 편도 인원수, 좌석 선택완료
    $(".search_airline_one_way_member_select").click(function() {
        $("input[name='search_airline_one_way_member']").val( OneWayMemberSeatClassSelect() );
        $(".search_airline_one_way_member").css("display", "none");
    });


    // 편도 input defualt
    $("input[name='search_airline_one_way_departure']").val("SEL 인천/김포");
    $("input[name='search_airline_one_way_departure_date']").val(defaultDepartureTimeInput);
    $("input[name='search_airline_one_way_member']").val("성인 1명  '  일반석")


    // 편도 submit
    $(".main1_type1_search_airline_one_way4").click(function() {
        if( $("input[name='search_airline_one_way_arrival']").val() == "" ) {
            $(".main1_type1_search_airline_one_way_submit_fail").css("display", "block");
        } else {
            $(this).closest("form").submit();
        }
    });
     
    





    // 호텔

    // default 검색 설정 날짜
    let searchInnDateDeparture = defaultArrivalYear + "." + defaultArrivalMonth + "." + defaultArrivalDate;
    let searchInnDateArrival = defaultInnArrivalYear + "." + defaultInnArrivalMonth + "." + defaultInnArrivalDate;
    $("input[name='search_inn_date_departure']").val(searchInnDateDeparture);
    $("input[name='search_inn_date_arrival']").val(searchInnDateArrival);


    // 객실.인원 선택창 켜기
    $("input[name='search_inn_member']").click(function() {
        $(".search_inn_room_member").css("display", "block");
    });


    // 객실.인원 선택창 선택 완료
    $(".search_inn_room_member5 > div:nth-child(2)").click(function() {

        if(searchInnChildrenNumber == 0) { // 아동이 0명일때
            $("input[name='search_inn_member']").val(
                    "객실" + searchInnRoomNumber 
                    + " ' 성인 " + searchInnAdultNumber + "명"
            );
        } else {
            $("input[name='search_inn_member']").val(
                    "객실" + searchInnRoomNumber 
                    + " ' 성인 " + searchInnAdultNumber + "명"
                    + " ' 아동 " + searchInnChildrenNumber + "명"
            );

        }

        $(".search_inn_room_member").css("display", "none");
    });


    let searchInnRoomNumber = 1;
    let searchInnAdultNumber = 2;
    let searchInnChildrenNumber = 0;


    // 객실 감소
    $(".search_inn_room_member2 > div:nth-child(2) > div:nth-child(1)").on("click", function() {
        if(searchInnRoomNumber >= 2) {
            searchInnRoomNumber--;
            $(".search_inn_room_member_room_number").text(searchInnRoomNumber);
        }
    });

    // 객실 증가
    $(".search_inn_room_member2 > div:nth-child(2) > div:nth-child(3)").on("click", function() {
        if(searchInnRoomNumber <= 7) {
            searchInnRoomNumber++;
            $(".search_inn_room_member_room_number").text(searchInnRoomNumber);
        }
    });


    // 성인 감소
    $(".search_inn_room_member_adult > div:nth-child(2) > div:nth-child(1)").on("click", function() {
        if(searchInnAdultNumber >= 2) {
            searchInnAdultNumber--;
            $(".search_inn_room_member_adult_number").text(searchInnAdultNumber);
        }
    });

    // 성인 증가
    $(".search_inn_room_member_adult > div:nth-child(2) > div:nth-child(3)").on("click", function() {
        if(searchInnAdultNumber <= 15) {
            searchInnAdultNumber++;
            $(".search_inn_room_member_adult_number").text(searchInnAdultNumber);
        }
    });


    // 아동 감소
    $(".search_inn_room_member_children > div:nth-child(2) > div:nth-child(1)").on("click", function() {
        if(searchInnChildrenNumber >= 1) {
            searchInnChildrenNumber--;
            if(searchInnChildrenNumber == 0) {
                $(".search_inn_room_member_children_text").text("");
                $(".search_inn_room_member_children_number").text("");
            } else {
                $(".search_inn_room_member_children_number").text(searchInnChildrenNumber);
            }
        }
    });


    // 아동 증가
    $(".search_inn_room_member_children > div:nth-child(2) > div:nth-child(3)").on("click", function() {
        if(searchInnChildrenNumber <= 5) {
            searchInnChildrenNumber++;
            $(".search_inn_room_member_children_text").text(" ' 아동");
            $(".search_inn_room_member_children_number").text(searchInnChildrenNumber);
        }
    });


     // 어디로 떠나세요 foucus
     $("input[name='search_inn_arrival']").focus(function() {
        $(".main1_type1_search_inn1").removeClass("main1_type1_search_inn1_input_empty");
        $("input[name='search_inn_arrival']").attr("placeholder", "어디로 떠나세요?");
    });



    // 숙소 검색
    $(".main1_type1_search_inn4").click(function() {
        if( $("input[name='search_inn_arrival']").val() == "" ) {
            $(".main1_type1_search_inn1").addClass("main1_type1_search_inn1_input_empty");
            $($("input[name='search_inn_arrival']")).attr("placeholder", "목적지를 검색해 주세요.");
        } else {
            $(this).closest("form").submit();
        }
    });




    let index = $(this).index();

    $(this).parent().find(".main1_type1_search_tab_active").removeClass("main1_type1_search_tab_active");
    $(this).addClass("main1_type1_search_tab_active");


    $(".main1_type1_search_setting").find(".main1_type1_search_tab_active").removeClass("main1_type1_search_tab_active");
    $(".main1_type1_search_setting").children().eq(index).addClass("main1_type1_search_tab_active");





    // 메인1_유형1 항공탭 변경
    $(".main1_type1_search_airline_tab > div").click(function() {
        let index = $(this).index();
        console.log(index);
        $(this).parent().find(".main1_type1_search_airline_active").removeClass("main1_type1_search_airline_active");
        $(this).addClass("main1_type1_search_airline_active");


        $(".main1_type1_search_airline_search_setting").find(".main1_type1_search_airline_active").removeClass("main1_type1_search_airline_active");
        $(".main1_type1_search_airline_search_setting").children().eq(index).addClass("main1_type1_search_airline_active");


    });


    // 메인1_유형1 항공 왕복 날짜 border 색
    $(".main1_type1_round_trip2 > div").click(function(e) {
        $(this).parent().find("div").css("border", "none");
        $(this).css("border", "1px solid rgb(94, 43, 184)");
        e.stopPropagation();
    });

    $(document).click(function(e) {
        $(".main1_type1_round_trip2 > div").css("border", "none");
    });


    // 메인1_유형1 항공 왕복 직항 버튼 
    $(".direct_flight_btn").click(function() {
        if( $(this).hasClass("direct_flight_active") ) {
            $(this).removeClass("direct_flight_active");
        } else {
            $(this).addClass("direct_flight_active");
        }
    });



});