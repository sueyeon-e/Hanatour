$(function() {


    let airline_reservation_agreements_checkAll = $(".airline_reservation_agreements_checkAll"); // 모든 약관에 동의합니다. 버튼

    let airline_reservation_agreements_btn_left = // 동의합니다 버튼
    $(".airline_reservation_agreements_body_list > .airline_reservation_agreements_body_outer > .airline_reservation_agreements_btn > .airline_reservation_agreements_btn_left");

    let airline_reservation_agreements_btn_right = // 동의하지 않습니다 버튼
    $(".airline_reservation_agreements_body_list > .airline_reservation_agreements_body_outer .airline_reservation_agreements_btn > .airline_reservation_agreements_btn_right") ;



    // 약관동의 전체 동의 체크 버튼
    $(".airline_reservation_agreements_header > div:nth-child(2)").on("click", function() {
        if( !(airline_reservation_agreements_checkAll.hasClass("airline_reservation_agreements_checkAll_active") ) ) {
            // 모든 약관에 동의합니다. off일때
            airline_reservation_agreements_checkAll.addClass("airline_reservation_agreements_checkAll_active");
            
            airline_reservation_agreements_btn_right.removeClass("airline_reservation_agreements_btn_active");
            airline_reservation_agreements_btn_left.addClass("airline_reservation_agreements_btn_active");

            $(".airline_reservation_agreements_submit_inner").addClass("airline_reservation_agreements_submit_active");

        } else {
            // 모든 약관에 동의합니다. on일때
            airline_reservation_agreements_checkAll.removeClass("airline_reservation_agreements_checkAll_active");

            airline_reservation_agreements_btn_left.removeClass("airline_reservation_agreements_btn_active");
            airline_reservation_agreements_btn_right.addClass("airline_reservation_agreements_btn_active");

            $(".airline_reservation_agreements_submit_inner").removeClass("airline_reservation_agreements_submit_active");
        }

    })







    // 동의합니다
    // 해결못함 : 개별 클릭으로 모두 동의할 시, 모든 약관 동의 버튼과 다음단계 버튼 활성화
    $(airline_reservation_agreements_btn_left).on("click", function() {
        $(this).parent().find(".airline_reservation_agreements_btn_right").removeClass("airline_reservation_agreements_btn_active");
        $(this).addClass("airline_reservation_agreements_btn_active");
    })



    

    // 동의하지 않습니다
    $(airline_reservation_agreements_btn_right).on("click", function() {
        $(this).parent().find(".airline_reservation_agreements_btn_left").removeClass("airline_reservation_agreements_btn_active");
        $(this).addClass("airline_reservation_agreements_btn_active");

        airline_reservation_agreements_checkAll.removeClass("airline_reservation_agreements_checkAll_active");
        $(".airline_reservation_agreements_submit_inner").removeClass("airline_reservation_agreements_submit_active");
    })

   



    
    // airline_reservation_agreements_submit_active이 없으면 submit 버튼 작동 안되게
    // if( !( $(".airline_reservation_agreements_submit_inner").hasClass("airline_reservation_agreements_submit_active") ) ) {

    //     $(".airline_reservation_agreements_submit_inner > label > input").click(function(e) {
    //         e.preventDefault();
    //         alert("click");
    //     });

    // } 


    $(".airline_reservation_agreements_submit_inner > label").on("click", function(e) {
        if( !( $(".airline_reservation_agreements_submit_inner").hasClass("airline_reservation_agreements_submit_active") ) ) {
            e.preventDefault();
            // alert("click");
        }
    })
    









    
})