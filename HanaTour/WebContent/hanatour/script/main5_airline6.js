
$(function() {

    let airlineAdultNumber = 3;
    let airlineChildNumber =  2;
    let airlineInfantNumber =  1;
    $(".airplane_seat_select_header1 > div:nth-child(2) > span:nth-child(2)").text(airlineAdultNumber);
    $(".airplane_seat_select_header1 > div:nth-child(3) > span:nth-child(2)").text(airlineChildNumber);
    $(".airplane_seat_select_header1 > div:nth-child(4) > span:nth-child(2)").text(airlineInfantNumber);
    $(".airline_airplane_container_header_passenger_info > div:nth-child(2) > span:nth-child(2)").text(airlineAdultNumber);
    $(".airline_airplane_container_header_passenger_info > div:nth-child(3) > span:nth-child(2)").text(airlineChildNumber);
    $(".airline_airplane_container_header_passenger_info > div:nth-child(4) > span:nth-child(2)").text(airlineInfantNumber);


    let airlineSeatClass = "일반석";
    // let airlineSeatClass = "프레스티지석";


    let airplaneModel = "airplane1";
    // let airplaneModel = "airplane2";


    // 비행기 유형
    $(".airplane_seat_select_header4").click(function() {
        $(".airline_airplane").addClass("airline_airplane_active");

        if(airplaneModel == "airplane1") {
            $(".airline_airplane_model1").addClass("airline_airplane_model_active");
        } else {
            $(".airline_airplane_model2").addClass("airline_airplane_model_active");
        }
    })


    // 좌석선택창 닫기 버튼
    $(".airline_airplane_container_close_btn").click(function() {
        $(".airline_airplane").removeClass("airline_airplane_active");
    })


    


 
    $(".airline_airplane_container_header_passenger_info > div:last-child() > span").text(airlineSeatClass);

    let seatsSelectedInfo = $(".airline_airplane_container_body_right_selected_info");

    // 프레스티지석
    
    $(document).on("click", ".airline_prestige_container > div", function(e) {  
        if(airlineSeatClass == "일반석") {
            alert("일반석을 선택해주세요.")
            return false;
        }

        e.stopPropagation();
        let prestigeSeatId = $(this).attr("id").substring($(this).attr("id").length - 2).toUpperCase();

        if(airlineLeftSelectNumber >= 1) {
    
            if( $(this).hasClass("model1_prestige_reserved") ) {
                alert("이미 예약된 좌석입니다.");
    
            } else if( $(this).hasClass("model1_prestige_selected") ) {
                $(this).removeClass("model1_prestige_selected");
    
                seatsSelectedInfo.find("div").filter(function() {
                    return ( $(this).text() == prestigeSeatId );
                }).remove();
    
            } else {
                $(this).addClass("model1_prestige_selected");
                seatsSelectedInfo.append(
                        "<div>" + prestigeSeatId + "</div>"
                )
            }
            updateAirlineLeftSelectNumber();
        } else {
            if( $(this).hasClass("model1_prestige_selected") ) {
                $(this).removeClass("model1_prestige_selected");
                seatsSelectedInfo.find("div").filter(function() {
                    return ( $(this).text() == prestigeSeatId );
                }).remove();
                updateAirlineLeftSelectNumber();
            } else {
                alert("더 이상 선택할 수 없습니다.")
            }
        } 

       
    });
    





    // 이코노미석
    $(document).on("click", ".airline_economy_container > div", function(e) {
        if(airlineSeatClass == "프레스티지석") {
            alert("프레스티지석을 선택해주세요.")
            return false;
        }

        e.stopPropagation();
        let economySeatId = $(this).attr("id").substring($(this).attr("id").length- 3).toUpperCase();

        if(airlineLeftSelectNumber >=1) {
    
            if( $(this).hasClass("model1_economy_reserved") ) {
                alert("이미 예약된 좌석입니다.");
    
            } else if( $(this).hasClass("model1_economy_selected") ) {
                $(this).removeClass("model1_economy_selected");
    
                seatsSelectedInfo.find("div").filter(function() {
                    return ( $(this).text() == economySeatId );
                }).remove();
    
            } else {
                $(this).addClass("model1_economy_selected");
                seatsSelectedInfo.append(
                    "<div>" + economySeatId + "</div>"
                )
            }
            updateAirlineLeftSelectNumber();
        } else {
            if( $(this).hasClass("model1_economy_selected") ) {
                $(this).removeClass("model1_economy_selected");
                seatsSelectedInfo.find("div").filter(function() {
                    return ( $(this).text() == economySeatId );
                }).remove();
                updateAirlineLeftSelectNumber();
            } else {
                alert("더 이상 선택할 수 없습니다.")
            }
        }

       
    });

   
   

    function updateAirlineLeftSelectNumber() {
    
        
        let airlineMemberNumber = airlineAdultNumber + airlineChildNumber + airlineInfantNumber;
    
    
        let airlineSelectedNumber = parseInt( $(".airline_airplane_container_body_right_selected_info").children().length );
        airlineLeftSelectNumber = airlineMemberNumber - airlineSelectedNumber - airlineInfantNumber;
    
        // 남은 선택 가능한 좌석수
        $(".airline_airplane_container_body_right > div:nth-child(3) > div").text(airlineLeftSelectNumber);
    
    }

    let airlineLeftSelectNumber = 0;

    updateAirlineLeftSelectNumber();

})






