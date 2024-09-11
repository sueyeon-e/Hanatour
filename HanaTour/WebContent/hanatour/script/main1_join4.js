$(function() {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

    $(".main1_join4_inner1 > div:nth-child(1) > div:nth-child(1)").click(function() {
        window.history.back();
    });

    $(".main1_join4_inner1 > div:nth-child(2").click(function() {
		window.location.href = contextPath + "/FlightController?command=main1";
    });


	// 아이디 유효성 검사
	function idValidation(id) {
		let idRegex = /^[a-z0-9]+$/;
		return idRegex.test(id);
	}



	$(".main1_join4_inner4_id_btn").click(function() {
		
		let inputJoinId = $("input[name='join_id']").val();
		
		$.ajax({
			type: "POST",
			async: true,
			url: contextPath + "/Join4IdDuplicateCheckServlet",
			data: {
				key : inputJoinId
			},
			dataType: "json",
			success: function(response) {
				
				if( response.key 
					|| !idValidation(inputJoinId) ) { // 중복아이디가 있거나 유효성검사 실패
					$(".main1_join4_inner4_id").removeClass("main1_join4_inner4_id_pass");
					$(".main1_join4_inner4_id").addClass("main1_join4_inner4_id_fail");
					sumbitActiveCheck();
				} else {
					$(".main1_join4_inner4_id").addClass("main1_join4_inner4_id_pass");
					$(".main1_join4_inner4_id").removeClass("main1_join4_inner4_id_fail");
					sumbitActiveCheck();
				}
				
			}, error: function() {
				console.log("아이디 중복체크 에러");
			}, complete: function() {
				console.log("아이디 중복체크 성공");
			}
			
		})
		
    });



    let inputPhoneNumber = $("input[name='join_phone']");

    // 휴대폰 번호 유효성 검사
    function phoneValidation(phoneNumber) {
        let phoneRegex = /^010\d{8}$/;
        return phoneRegex.test(phoneNumber);
    }


    inputPhoneNumber.on("input", function() {

        if( phoneValidation(inputPhoneNumber.val() ) ) {
            $(".main1_join4_inner4_phone").addClass("main1_join4_inner4_phone_pass");
            sumbitActiveCheck();
        } else {
            $(".main1_join4_inner4_phone").removeClass("main1_join4_inner4_phone_pass");
            sumbitActiveCheck();
        }
    });


    inputPhoneNumber.on("focus", function() {
        $(".main1_join4_inner4_phone").removeClass("main1_join4_inner4_phone_fail");
        $(".main1_join4_inner4_phone_validation").removeClass("main1_join4_inner4_phone_validation_fail");
    })


    inputPhoneNumber.on("blur", function() {

        if( inputPhoneNumber.val() == "" ) {
            $(".main1_join4_inner4_phone").removeClass("main1_join4_inner4_phone_pass");
            $(".main1_join4_inner4_phone").removeClass("main1_join4_inner4_phone_fail");
            $(".main1_join4_inner4_phone_validation").removeClass("main1_join4_inner4_phone_validation_fail");
        } else if( !phoneValidation(inputPhoneNumber.val() ) ) {
            $(".main1_join4_inner4_phone").addClass("main1_join4_inner4_phone_fail");
            $(".main1_join4_inner4_phone_validation").addClass("main1_join4_inner4_phone_validation_fail");

        } else {
            $(".main1_join4_inner4_phone").removeClass("main1_join4_inner4_phone_fail");
            $(".main1_join4_inner4_phone").addClass("main1_join4_inner4_phone_pass");
            $(".main1_join4_inner4_phone_validation").removeClass("main1_join4_inner4_phone_validation_fail");

        }

    })




    // 외국인 버튼
    $(".main1_join4_inner4_foreigner > label").click(function() {

        if( $(this).children().eq(0).hasClass("main1_join4_inner4_foreigner_checked") ) {
            $(this).children().eq(0).removeClass("main1_join4_inner4_foreigner_checked");
            $(this).children().eq(0).find("input").prop("checked", false);
        } else {
            $(this).children().eq(0).addClass("main1_join4_inner4_foreigner_checked");
            $(this).children().eq(0).find("input").prop("checked", true);
        }
    });


    // 비밀번호 유효성 검사
    function passwordValidation(pw) {
        let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d-!@#$%^*?_~]{8,16}$/;

        return pwRegex.test(pw);
    }


    let inputPw = $("input[name='join_pw']");

    inputPw.on("input", function() {
        if( passwordValidation( $(this).val() ) ) {
            $(".main1_join4_inner4_pw").addClass("main1_join4_inner4_pw_pass");
            sumbitActiveCheck();
        } else {
            $(".main1_join4_inner4_pw").removeClass("main1_join4_inner4_pw_pass");
            sumbitActiveCheck();
        }
    });


    inputPw.on("focus", function() {
        $(".main1_join4_inner4_pw").removeClass("main1_join4_inner4_pw_fail");
        $(".main1_join4_inner4_pw_validation").removeClass("main1_join4_inner4_pw_validation_fail");
    });

    inputPw.on("blur", function() {
        if(  inputPw.val() == "" ) {
            $(".main1_join4_inner4_pw").removeClass("main1_join4_inner4_pw_pass");
            $(".main1_join4_inner4_pw").removeClass("main1_join4_inner4_pw_fail");
            $(".main1_join4_inner4_pw_validation").removeClass("main1_join4_inner4_pw_validation_fail");
        } else if( !passwordValidation( inputPw.val() ) ) {
            $(".main1_join4_inner4_pw").addClass("main1_join4_inner4_pw_fail");
            $(".main1_join4_inner4_pw_validation").addClass("main1_join4_inner4_pw_validation_fail");
        } else {
            $(".main1_join4_inner4_pw").removeClass("main1_join4_inner4_pw_fail");
            $(".main1_join4_inner4_pw").addClass("main1_join4_inner4_pw_pass");
            $(".main1_join4_inner4_pw_validation").removeClass("main1_join4_inner4_pw_validation_fail");
        }
    })


    let inputPwConfirm = $("input[name='join_pw_confirm']");


    function passwordConfirmValidation(inputPw, inputPwConfirm) {
        if( inputPw.val() == inputPwConfirm.val() ) {
            return true;
        } else {
            return false;
        }
    }


    inputPwConfirm.on("input", function() {
        if( passwordConfirmValidation(inputPw, inputPwConfirm) ) {
            $(".main1_join4_inner4_pw_confirm").addClass("main1_join4_inner4_pw_confirm_pass");
            sumbitActiveCheck();
        } else {
            $(".main1_join4_inner4_pw_confirm").removeClass("main1_join4_inner4_pw_confirm_pass");
            sumbitActiveCheck();
        }
    });



    inputPwConfirm.on("focus", function() {
        $(".main1_join4_inner4_pw_confirm").removeClass(".main1_join4_inner4_pw_confirm_fail");
        $(".main1_join4_inner4_pw_confirm_validation").removeClass("main1_join4_inner4_pw_confirm_validation_fail");
    })



    inputPwConfirm.on("blur", function() {
        if ( inputPwConfirm.val() == "" ) {
            $(".main1_join4_inner4_pw_confirm").removeClass("main1_join4_inner4_pw_confirm_pass");
            $(".main1_join4_inner4_pw_confirm").removeClass("main1_join4_inner4_pw_confirm_fail");
            $(".main1_join4_inner4_pw_confirm_validation").removeClass("main1_join4_inner4_pw_confirm_validation_fail");
        } else if( !passwordConfirmValidation(inputPw, inputPwConfirm) ) {
            $(".main1_join4_inner4_pw_confirm").addClass("main1_join4_inner4_pw_confirm_fail");
            $(".main1_join4_inner4_pw_confirm_validation").addClass("main1_join4_inner4_pw_confirm_validation_fail");
        } else {
            $(".main1_join4_inner4_pw_confirm").removeClass("main1_join4_inner4_pw_confirm_fail");
            $(".main1_join4_inner4_pw_confirm_validation").removeClass("main1_join4_inner4_pw_confirm_validation_fail");
        }
    });






    $(".main1_join4_inner5").click(function() {
        if( $(this).hasClass("main1_join4_inner5_active") ) {
			$("input[name='join_id2']").val( $("input[name='join_id']").val() );
            $(".main1_join4_form2").submit();
        } 
    });



    function sumbitActiveCheck() {
        if( $(".main1_join4_inner4_id").hasClass("main1_join4_inner4_id_pass")
			&& $(".main1_join4_inner4_phone").hasClass("main1_join4_inner4_phone_pass")  
            && $(".main1_join4_inner4_pw").hasClass("main1_join4_inner4_pw_pass") 
            && $(".main1_join4_inner4_pw_confirm").hasClass("main1_join4_inner4_pw_confirm_pass") ) {

            $(".main1_join4_inner5").addClass("main1_join4_inner5_active");
        } else {
            $(".main1_join4_inner5").removeClass("main1_join4_inner5_active");
        }
    }









})