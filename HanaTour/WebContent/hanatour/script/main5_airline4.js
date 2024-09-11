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











    // 탑승객 n명 추가
    let passengerNumber = 4;

    for(let i = 2; i <= passengerNumber; i++) {
        $(".airline_passenger_container").append(

            '<div class="' +
                'airline_passenger_info ' +
                'airline_passenger_info' + i +
            '">' +
                '<div class="airline_passenger_info_header">' +
                    '<div class="airline_passenger_info_header_left">' +
    '                    <span>탑승자 정보</span>' +
    '                    <span>' + i + '</span>' +
    '                    <span>(' + "성인" + ')</span>' +
                    '</div>' + 
                    '<div class="airline_passenger_info_header_right">' +
    '                    <div class="' +
                            'airline_passenger_info_header_right_reservation' +
    '                        ' +
    '                    ">' +
                            '<span></span>' +
                            '<span>예약자와 동일</span>' +
    '                    </div>' +
    '                    <div class="' +
                            'airline_passenger_info_header_right_passport' +
    '                        ' +
    '                    ">' +
                            '<span></span>' +
                            '<span>여권정보 나중에 등록</span>' +
    '                    </div>' +
                    '</div>' +
                '</div>' +
                '<div class="airline_passenger_info_body">' +
                    '<div class="airline_passenger_info_body1">' +
    '                    <div>성명(한글)</div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_name_kr" placeholder="ex.홍길동 (한글만 입렵가능)"/>' +
    '                    </div>' +
    '                    <div>여권 이미지 업로드</div>' +
    '                    <div>' +
                            '<div class="passport_ocr">' +
    '                            <input ' +
    '                                type="file" ' +
    '                                onchange="recognizeFile(window.lastFile=this.files[0])" ' +
    '                                id="passport_ocr_id' + i + '"' +
    '                            />' +
                                '<select id="langsel" onchange="window.lastFile && recognizeFile(window.lastFile)">' +
                                    '<option value="eng"selected>English </option>' +
                                '</select>' +
                                '<div id="log"></div>' +
                            '</div>' +
    '                    </div>' +
                    '</div>' +
                    '<div class="airline_passenger_info_body2">' +
    '                    <div>생년월일</div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_birth" placeholder="ex.19991231 (숫자만 입력가능)"/>' +
    '                    </div>' +
    '                    <div>' +
                            '성별' +
    '                    </div>' +
    '                    <div>' +
                            '<input type="radio" name="passenger' + i + '_gender" value="male"/> 남성' +
                            '<input type="radio" name="passenger' + i + '_gender" value="female"/> 여성' +
    '                    </div>' +
                    '</div>' +
                    '<div class="airline_passenger_info_body3">' +
    '                    <div>' +
                            '영문 성 ' +
    '                    </div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_name_en_last" placeholder="ex.HONG (영문만 입력가능)"/>' +
    '                    </div>' +
    '                    <div>' +
                            '영문 이름 ' +
    '                    </div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_name_en_first" placeholder="ex.GILDING (영문만 입력가능)"/>' +
    '                    </div>' +
                    '</div>' +
                    '<div class="airline_passenger_info_body4">' +
    '                    <div>휴대폰 번호</div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_phone" placeholder="ex.01012345678 (숫자만 입력가능)"/>' +
    '                    </div>' +
    '                    <div>' +
                            '이메일' +
    '                    </div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_email" placeholder="ex.sample@hanatour.com"/>' +
    '                    </div>' +
                    '</div>' +
                    '<div class="airline_passenger_info_body5">' +
    '                    <div>여권번호</div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_passport_number" placeholder="여권번호(ex.M12345678)" id="passport_number1"/>' +
    '                    </div>' +
    '                    <div>' +
                            '여권 만료일' +
    '                    </div>' +
    '                    <div>' +
                            '<input type="text" name="passenger' + i + '_passport_expiration_date" placeholder="여권 만료일(ex.20300101)"/>' +
    '                    </div>' +
                    '</div>' +
                    '<div class="airline_passenger_info_body6">' +
    '                    <div>국적</div>' +
    '                    <div>' +
                            '<select name="" id="">' +
                                '<option value="">대한민국</option>' +
                            '</select>' +
    '                    </div>' +
    '                    <div>' +
                            '발행 국가' +
    '                    </div>' +
    '                    <div>' +
                            '<select name="" id="">' +
                                '<option value="">대한민국</option>' +
                            '</select>' +
    '                    </div>' +
                    '</div>' +
                '</div>' +
            '</div>' 
    
        );
    
    }


    // 결제하기 누르면 submit버튼 작동
    $(document).on("click", ".airline_payment_right_submit_btn", function() {
        alert("submit 버튼 클릭")
        $("input[type='submit']").click();
    })




})  