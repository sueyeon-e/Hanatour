$(function() {


	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;




	
    $(".basic_info_id_btn1").click(function() {
        $(this).css("display", "none");
        $(".basic_info_id_right2 > ul").css("display", "none");


        $(".basic_info_id_btn2").css("display", "block");
        $("input[name='user_change_id']").css("display", "block");
    });

	
	
	
	// 아이디 중복 체크 버튼
    $(".basic_info_id_btn2").on("click", function() {

        let changeId = $("input[name='user_change_id']").val();
		if(changeId == "") {
			alert("아이디를 입력해주세요.")
		} else {
			$.ajax({
				method: "POST",
				async: true,
				url: contextPath + "/MypageEditPersonalInfoIdDuplicateCheckServlet",
				data: {
					key : changeId
				}, // 파라미터
				dataType: "json", // json, xml, text....
				success: function(response) {
					if(response.key) {
						alert("사용할 수 없는 아이디입니다.");
					} else {
				        $(".basic_info_id_btn2").css("display", "none");
				        $(".basic_info_id_btn3").css("display", "block");
				        $("input[name='user_change_id']").prop("readonly", true);
	
						alert("사용 가능한 아이디입니다");
					}
					
				}, error: function() {
					// 오류 발생시
					console.log("아이디 중복 체크 에러");
					
				}, complete: function() {
					// 작업 완료후
					console.log("아이디 중복 체크 완료");
				}
				
			})
		}
    });
	
	
	
	
	$(".basic_info_id_btn3").on("click", function() {
		alert("아이디 변경이 완료되었습니다.");
		$("input[name='user_change_id']").closest("form").submit();
	});
	
	
	

	
	
	
	
	$(".basic_info_phone_btn1").click(function() {
		$(this).css("display", "none");
		$(".basic_info_phone_input").css("display", "block");
		$(".basic_info_phone_btn2").css("display", "block");
	});
	
	
	// 휴대폰 번호 유효성 검사
    function phoneValidation(phoneNumber) {
        let phoneRegex = /^010\d{8}$/;
        return phoneRegex.test(phoneNumber);
    }


	$(".basic_info_phone_btn2").on("click", function() {
		let changePhone = $("input[name='user_change_phone']").val();
		
		if(changePhone == "") {
			alert("휴대폰 번호를 입력해주세요.");
		} else if( !phoneValidation(changePhone) ) {
			alert("알맞은 형식으로 입력해주세요 ('-'제외)");
		} else {
			alert("변경이 완료되었습니다.")
			$("input[name='user_change_phone']").closest("form").submit();
		}
	});










	$(".basic_info_email_btn1").click(function() {
		
		$(this).css("display", "none");
		$(".basic_info_email_btn2").css("display", "block");
		
		let userEmailValue =  $("input[name='user_email']").val();
		$("input[name='user_email']")
			.prop("disabled", false)
			.val("")
			.focus()
			.attr("placeholder", userEmailValue)
			.css({
				"background-color": "white",
				"color": "#333",
				"cursor": "text"
				
			});
			
	});
	
	
	
	
	
	 // 이메일 유효성 검사
    function emailValidation(id) {
        let userIdRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return userIdRegex.test(id);
    }
	
	
	
	$(".basic_info_email_btn2").on("click", function() {
		
		let changeEmail = $("input[name='user_email']").val();
		
		if( changeEmail == "") {
			alert("이메일을 입력해주세요.")
		} else if( !emailValidation(changeEmail) ) {
			alert("이메일 형식을 확인해주세요.")	
		} else {
		
			$.ajax({
				method: "POST",
				async: true,
				url: contextPath + "/MypageEditPersonalInfoEmailDuplicateCheckServlet",
				data: {
					key: changeEmail
				},
				dataType: "json",
				success: function(response) {
					if(response.key) {
						alert("사용할 수 없는 이메일입니다.");
					} else {
						
						$(".basic_info_email_btn2").css("display", "none");
						$(".basic_info_email_btn3").css("display", "block");
						$("input[name='user_email']").prop("readonly", true);
						
						alert("사용 가능한 이메일입니다.")
					}
				}, error: function() {
					console.log("이메일 중복 체크 에러");
				}, complete: function() {
					console.log("이메일 중복 체크 완료");
				}
				
			})
		
		}
		
	});
	
	
	
	
	$(".basic_info_email_btn3").on("click", function() {
		alert("이메일이 변경이 완료되었습니다.")
		$("input[name='user_email']").parent().submit();
	});
	
	
	
	
	
	
	$(".delete_passport_info_active").click(function() {
		alert("여권정보가 삭제되었습니다.");
		$(".container_right_header3").parent().submit();	
		
	});	
	
	
	if( $(".delete_passport_info").hasClass("delete_passport_info_active") ) {
		$(".container_right_body3 input").prop("disabled", true);
		$(".container_right_body3 select").prop("disabled", true);
		$(".container_right_body3_agreements").css("display", "none");
	}
	
	
	

	
	
	// 여권정보 저장
	$(".passport_info_save_inner").on("click", function() {
		
		 if( $(this).hasClass("passport_info_save_active") ) {
			
			let lastName = $("input[name='user_last_name']");
			let firstName = $("input[name='user_first_name']");
			let passportNumber = $("input[name='user_passport_number']");
			let expirationDate = $("input[name='user_expiration_date']");
			let nationality = $("select[name='user_nationality']");
			let authority = $("select[name='user_authority']");
	
			let validationPass = true;
			
			
			// lastName
			if( lastName.val() == "" ) {
				lastName.attr("placeholder", "영문 성을 입력해주세요.");
				lastName.addClass("container_right_body3_red");
				passportSaveValidationPass = false;
			} else if( !englishNameValidation(lastName.val()) ) {
				lastName.val("");
				lastName.attr("placeholder", "영문 대문자만 입력가능");
				lastName.addClass("container_right_body3_red");
				validationPass = false;
			} 
			
			
			// firstName
			if( firstName.val() == "" ) {
				firstName.attr("placeholder", "영문 이름을 입력해주세요.");
				firstName.addClass("container_right_body3_red");
				passportSaveValidationPass = false;
			} else if( !englishNameValidation(firstName.val()) ) {
				firstName.val("");
				firstName.attr("placeholder", "영문 대문자만 입력가능");
				firstName.addClass("container_right_body3_red");
				validationPass = false;
			} 
			
			
			// passportNumber
			if( passportNumber.val() == "" ) {
				passportNumber.attr("placeholder", "여권번호를 입력해주세요.");
				passportNumber.addClass("container_right_body3_red");
				validationPass = false;
			} else if( !passportNumberValidation(passportNumber.val()) ) {
				passportNumber.val("");
				passportNumber.attr("placeholder", "여권번호 형식을 확인해주세요.");
				passtpassportNumber.addClass("container_right_body3_red");
				validationPass = false;
			}
			
			
			// expirationDate
			if( expirationDate.val() == "" ) {
				expirationDate.attr("placeholder", "여권 만료일을 입력해주세요.");
				expirationDate.addClass("container_right_body3_red");
				validationPass = false;
			} else if ( !expirationDateValidation(expirationDate.val()) ) {
				expirationDate.val("");
				expirationDate.attr("placeholder", "여권 만료일 형식을 확인해주세요.");
				expirationDate.addClass("container_right_body3_red");
				validationPass = false; 
			}
			
			
			// nationality
			if( nationality.val() == "default" ){
				nationality.addClass("container_right_body3_red");
				nationality.css("color", "red");
				validationPass = false;
			}
			
			// authority
			if( authority.val() == "default" ){
				authority.addClass("container_right_body3_red");
				authority.css("color", "red");
				valdationPass = false;
			}
			
			
			
			if(validationPass) {
				  $(this).closest("form").submit();
				alert("여권정보가 저장되었습니다.");
			} else {
				alert("입력정보를 확인해주세요.")
			}
			
			
        } // if( $(this).hasClass("passport_info_save_active")
	}) // on.click
	
	

	// 영문이름 validation
	function englishNameValidation(name) {
		let englishNameRegex = /^[A-Z]+$/;
		return englishNameRegex.test(name);
	}


	// 여권번호 validation
	function passportNumberValidation(passportNumber) {
		let passportNumberRegex = /^(M\d{3}[A-Z]\d{4}|\s*M\d{3}[A-Z]\d{4}|\b(M|S|R|O|D)\d{8}\b)$/;
		return passportNumberRegex.test(passportNumber);
	}
	
	// 여권만료일 validation
	function expirationDateValidation(date) {
		let expirationDateRegex = /^20\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
		return expirationDateRegex.test(date);
	}
	
	
	


		
	
	$("select").on("change", function() {
		$(this).css("color", "#333");		
	})





    $(".container_right_body3_agree1 > label").click(function() {

        if( ! ( $(this).hasClass("container_right_body3_agree1_active") ) ) {
            $(this).parent().find(".container_right_body3_agree1_active").removeClass("container_right_body3_agree1_active");
            $(this).addClass("container_right_body3_agree1_active");
            checkAgreeRadioCheck();
            passportSaveActive();
        }
    })


    $(".container_right_body3_agree2 > label").click(function() {

        if( ! ( $(this).hasClass("container_right_body3_agree2_active") ) ) {
            $(this).parent().find(".container_right_body3_agree2_active").removeClass("container_right_body3_agree2_active");
            $(this).addClass("container_right_body3_agree2_active");
            checkAgreeRadioCheck();
            passportSaveActive();
        } 
    })

    
    function checkAgreeRadioCheck() {
        $(".container_right_body3_agree1").find(".container_right_body3_agree1_active").find("input[type='radio']").prop("checked", true);
        $(".container_right_body3_agree2").find(".container_right_body3_agree2_active").find("input[type='radio']").prop("checked", true);
    }


    function passportSaveActive() {
        if( $("input[name='container_right_body3_agree1']:checked").val() == "Y"
            && $("input[name='container_right_body3_agree2']:checked").val() == "Y" ) {
            $(".passport_info_save_inner").addClass("passport_info_save_active");
        } else {
             $(".passport_info_save_inner").removeClass("passport_info_save_active");

        }
    }

    
    













    $(".container_right_body4 > div > div > label").click(function() {
        if( !( $(this).hasClass("container_right_body4_agree_active") ) ) {
            $(this).parent().find(".container_right_body4_agree_active").removeClass("container_right_body4_agree_active");
            $(this).addClass("container_right_body4_agree_active");
            checkAgreeRadioCheck2();
        }

    });




    function checkAgreeRadioCheck2() {
        $(".container_right_body4_agree_active").find("input[type='radio']").prop("checked", true);
    }



    $(".container_right_body4_btn > a:nth-child(1)").click(function() {
        window.history.back();
    });


    $(".container_right_body4_btn > a:nth-child(2)").click(function(e) {
        e.preventDefault();
        $(this).closest("form").submit();
    });





});