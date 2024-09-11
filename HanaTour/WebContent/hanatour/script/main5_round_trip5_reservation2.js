$(function() {


    // 첫번째 탑승자 정보에만 예약자와 동일 버튼 나타나게



    // 예약자와 동일 버튼
    $(".airline_passenger_info_header_right_reservation").click(function() {

        if( ( $("input[name='reservation_name']").val() == "" ) &&
            ( $("input[name='reservation_birth']").val() == "" ) &&
            ( $("input[name='reservation_email']").val() == ""  ) ) {
            
            alert("예약자 정보 입력이 되지 않았습니다.");

        } else {
            if( $(this).hasClass("airline_passenger_info_header_right_reservation_active")  ) {
                $(this).removeClass("airline_passenger_info_header_right_reservation_active");

				$("input[name='passenger1_name_kr']")
                    .val("")
                    .removeAttr("readonly")
                    .css({
                        "background-color": "white",
                        "cursor" : "text",
                        "outline" : "1px solid #cdcdcd;"
                });

                $("input[name='passenger1_birth']")
                    .val("")
                    .removeAttr("readonly")
                    .css({
                        "background-color": "white",
                        "cursor" : "text",
                        "outline" : "1px solid #cdcdcd;"
                });

                $("input[name='passenger1_phone']")
                    .val("")
                    .removeAttr("readonly")
                    .css({
                        "background-color": "white",
                        "cursor" : "text",
                        "outline" : "1px solid #cdcdcd;"
                });

                $("input[name='passenger1_email']")
                    .val("")
                    .removeAttr("readonly")
                    .css({
                        "background-color": "white",
                        "cursor" : "text",
                        "outline" : "1px solid #cdcdcd;"
                });


            } else {
                $(this).addClass("airline_passenger_info_header_right_reservation_active");

                $("input[name='passenger1_name_kr']")
                    .val( $("input[name='reservation_name']").val() )
                    .attr("readonly", true)
                    .css({
                        "background-color": "#f2f3f7",
                        "cursor" : "not-allowed",
                        "outline" : "none"
                });

                $("input[name='passenger1_birth']")
                    .val( $("input[name='reservation_birth']").val() )
                    .attr("readonly", true)
                    .css({
                        "background-color": "#f2f3f7",
                        "cursor" : "not-allowed",
                        "outline" : "none"
                });

                $("input[name='passenger1_phone']")
                    .val( $("input[name='reservation_phone']").val() )
                    .attr("readonly", true)
                    .css({
                        "background-color": "#f2f3f7",
                        "cursor" : "not-allowed",
                        "outline" : "none"
                });

                $("input[name='passenger1_email']")
                    .val( $("input[name='reservation_email']").val() )
                    .attr("readonly", true)
                    .css({
                        "background-color": "#f2f3f7",
                        "cursor" : "not-allowed",
                        "outline" : "none"
                });

            }

        }
    });


    // 여권정보 나중에 등록 버튼
    $(document).on("click", ".airline_passenger_info_header_right_passport", function(){
        if( $(this).hasClass("airline_passenger_info_header_right_passport_active")  ) {
            $(this).removeClass("airline_passenger_info_header_right_passport_active");
            $(this).closest(".airline_passenger_info").find(".airline_passenger_info_body5").css("display", "flex");
            $(this).closest(".airline_passenger_info").find(".airline_passenger_info_body6").css("display", "flex");

        } else {
            $(this).addClass("airline_passenger_info_header_right_passport_active");
            $(this).closest(".airline_passenger_info").find(".airline_passenger_info_body5").css("display", "none");
            $(this).closest(".airline_passenger_info").find(".airline_passenger_info_body6").css("display", "none");
        }
    })






	
	// 파일 업로드중
	$("input[type='file']").on("change", function() {
		
		let passportNumberInput = $(this).closest(".airline_passenger_info_body").find(".passport_number_input");
		passportNumberInput.val("");
		passportNumberInput.attr("placeholder", "잠시만 기다려주세요.");
		
		let interval = setInterval(function() {
			if(passportNumberInput.val() !== "") {
				clearInterval(interval);
				passportNumberInput.removeClass("passport_number_input_uploading");
			} else {
				passportNumberInput.toggleClass("passport_number_input_uploading");
			}
		}, 1000);
		
		setTimeout(function() {
			if(passportNumberInput.val() === "") {
				clearInterval(interval);
				passportNumberInput.removeClass("passport_number_input_uploading");
				passportNumberInput.attr("placeholder", "파일읽기 실패");
			}
		}, 10000);
		
	});
 



    // 결제하기 누르면 submit버튼 작동
    $(document).on("click", ".airline_payment_right_submit_btn", function() {
        // alert("submit 버튼 클릭")
        $("input[type='submit']").click();
    })




})  