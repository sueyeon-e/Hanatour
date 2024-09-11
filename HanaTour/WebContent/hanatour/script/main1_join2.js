$(function() {
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

    $(".main1_join2_inner1 > div:nth-child(1) > div:nth-child(1)").click(function() {
        window.history.back();
    });


	$(".main1_join2_inner1 > div:nth-child(2)").click(function() {
        window.location.href = contextPath + "/FlightController?command=main1";
    })

    // 윗쪽 체크박스
    $(".main1_join2_inner3_header").click(function() {
        if( $(".main1_join2_inner3_header_img").hasClass("main1_join2_inner3_all_agreement")  ) {

            $(".main1_join2_inner3_header_img").removeClass("main1_join2_inner3_all_agreement");
            $(".main1_join2_inner3_body > div > label > input").prop("checked", false);
            $(".main1_join2_inner3_body > div").removeClass("main1_join2_agreement_active");

         } else {

            $(".main1_join2_inner3_header_img").addClass("main1_join2_inner3_all_agreement");
            $(".main1_join2_inner3_body > div > label > input").prop("checked", true);
            $(".main1_join2_inner3_body > div").addClass("main1_join2_agreement_active");
        }
    });



    // 아래쪽 체크박스
    $(".main1_join2_inner3_body > div > label").click(function() {

        if ( $(this).find("input[type='checkbox']").is(":checked") ) {

            $(this).parent().addClass("main1_join2_agreement_active");
            
            let checkAllAgreements = true;
            $(".main1_join2_inner3_body > div").each(function() {
                if( ! ($(this).hasClass("main1_join2_agreement_active") ) ) {
                    checkAllAgreements = false;
                }
            });

            if(checkAllAgreements) {
                $(".main1_join2_inner3_header_img").addClass("main1_join2_inner3_all_agreement");
            }

        } else {
            $(this).parent().removeClass("main1_join2_agreement_active");
            $(".main1_join2_inner3_header_img").removeClass("main1_join2_inner3_all_agreement");
        }   

    });





    // 다음 버튼
    $(".main1_join2_submit_btn").click(function() {
        
        if( 
            $("input[name='main1_join2_agreement1']").is(":checked")
            && $("input[name='main1_join2_agreement2']").is(":checked")
            && $("input[name='main1_join2_agreement3']").is(":checked") ) {
                
            $("form").submit();

        } else {
            alert("필수약관에 동의해 주세요.");
        }


    })


  

})