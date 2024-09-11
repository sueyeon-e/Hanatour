 

$(function() {
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	

	$(".main1_find_id_header > div:nth-child(1) > div:nth-child(1)").click(function() {
        window.history.back();
    })

    $(".main1_find_id_header > div:nth-child(2)").click(function() {
        window.location.href = contextPath + "/hanatour/jsp/main1_home/main1_1.jsp";
    });


    $(".main1_find_id_tab_select > div:nth-child(1)").click(function() {
        window.location.href = contextPath + "/FlightController?command=findIdEntrance";
    });

    $(".main1_find_id_tab_select > div:nth-child(2)").click(function() {
        window.location.href = contextPath + "/FlightController?command=findPwEntrance";
    });



    let findPwNameInput = $("input[name='find_pw_name']");
    let findPwGenderInput = $("input[name='find_pw_gender']");
    let findPwBirthInput = $("input[name='find_pw_birth']");

    
    // 이름
    function nameValidation(name) {
        let nameRegex = /^(?!^[ㄱ-ㅎㅏ-ㅣ]+$)[가-힣]+$/;
        return nameRegex.test(name);
    }


    findPwNameInput.on("input", function() {
       

        if( nameValidation( $(this).val() )   ) {
           $(".main1_find_pw3_inner3_name").addClass("main1_find_pw3_inner3_name_pass");
           $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_fail");
        } else {
            $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_pass");
            $(".main1_find_pw3_inner3_name").addClass("main1_find_pw3_inner3_name_fail");
        }
    });


    findPwNameInput.on("focus", function() {
        $(".main1_find_pw3_inner3_name_validation2").css("display", "none");
        if( $(".main1_find_pw3_inner3_name").hasClass("main1_find_pw3_inner3_name_fail") ) {
            $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_fail");
            $(".main1_find_pw3_inner3_name_validation1").css("display", "none");
        } 
    });


    findPwNameInput.on("blur", function() {
        if( !nameValidation ( $(findPwNameInput).val() ) ) {
            $(".main1_find_pw3_inner3_name").addClass("main1_find_pw3_inner3_name_fail");
        } else {
            $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_fail");
        }

        if( $(".main1_find_pw3_inner3_name").hasClass("main1_find_pw3_inner3_name_fail") ) {
            $(".main1_find_pw3_inner3_name_validation1").css("display", "block");
        } else {
        }
        
        if( findPwNameInput.val() == "" ) {
            $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_pass");
            $(".main1_find_pw3_inner3_name").removeClass("main1_find_pw3_inner3_name_fail");
            $(".main1_find_pw3_inner3_name_validation1").css("display", "none");
        }
    });




    // 성별
    // function genderValidation() {
    //    if( findPwGenderInput.is(":checked") ) {
    //     return true;
    //    } else {
    //     return false;
    //    }
    // }

    $(".main1_find_pw3_inner3_gender > div").click(function(e) {

        if( $("input[name='find_pw_gender']").prop("disabled")  ==  true ) {
            e.preventDefault();
        } else {
            
        $(".main1_find_pw3_inner3_gender_validation").css("display", "none");
            $(this).parent().find(".main1_find_pw3_inner3_gender_active").removeClass("main1_find_pw3_inner3_gender_active");
            $(this).addClass("main1_find_pw3_inner3_gender_active");
            $(this).find("input").prop("checked", true);
            }
    })





    // 생년월일
    function birthValidation(birth) {
        let birthRegex = /^(19\d{2}|20\d{2})(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
        return birthRegex.test(birth);
    }
  

    findPwBirthInput.on("input", function() {
        
        if( birthValidation( $(this).val() ) ) {
            $(".main1_find_pw3_inner3_birth").addClass("main1_find_pw3_inner3_birth_pass");
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_fail");
        } else {
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_pass");
            $(".main1_find_pw3_inner3_birth").addClass("main1_find_pw3_inner3_birth_fail");


        }
    })

    findPwBirthInput.on("focus", function() {
        $(".mai1_find_pw3_inner3_birth_validation2").css("display", "none");
        if( $(".main1_find_pw3_inner3_birth").hasClass("main1_find_pw3_inner3_birth_fail") ) {
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_fail");
            $(".main1_find_pw3_inner3_birth_validation1").css("display", "none");
        } 

    });


    findPwBirthInput.on("blur", function() {

        if( !birthValidation ( $(findPwBirthInput).val() ) ) {
            $(".main1_find_pw3_inner3_birth").addClass("main1_find_pw3_inner3_birth_fail");
        } else {
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_fail");
        }

        if( $(".main1_find_pw3_inner3_birth").hasClass("main1_find_pw3_inner3_birth_fail") ) {
            $(".main1_find_pw3_inner3_birth_validation1").css("display", "block");
        } else {
        }
        
        if( findPwBirthInput.val() == "" ) {
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_pass");
            $(".main1_find_pw3_inner3_birth").removeClass("main1_find_pw3_inner3_birth_fail");
            $(".main1_find_pw3_inner3_birth_validation1").css("display", "none");
        }


    });






    let currentDate = new Date();
    let currentYear = currentDate.getFullYear();
    // 실명인증 요청 버튼
    $(".main1_find_pw3_inner3_birth_btn").on("click", function(e) {

        e.preventDefault();


        if( $("input[name='find_pw_birth']").val() == "" 
            || ( currentYear - $("input[name='find_pw_birth']").val().substring(0,4) ) < 15) {
                
                alert("만 14세 이상만 회원 가입 가능합니다.")


        } else if( $(".main1_find_pw3_inner3_name").hasClass("main1_find_pw3_inner3_name_pass")
                && ( $(".main1_find_pw3_inner3_gender").find(".main1_find_pw3_inner3_gender_active").length > 0)
                && $(".main1_find_pw3_inner3_birth").hasClass("main1_find_pw3_inner3_birth_pass") ) {
                
                alert("실명확인 되었습니다.")

                $("input[name='find_pw_mail']").prop("disabled", false);
                $(".main1_find_pw3_inner3_mail_btn").prop("disabled", false);


                $("input[name='find_pw_verification_code']").prop("disabled", false);
                $(".verification_code_btn").prop("disabled", false);

                
                $("input[name='find_pw_id']").prop("disabled", true);
                $("input[name='find_pw_name']").prop("disabled", true);
                $("input[name='find_pw_gender']").prop("disabled", true);
                $("input[name='find_pw_birth']").prop("disabled", true);

        } else {


            if( $("input[name='find_pw_name']").val() == "" ) {
                $(".main1_find_pw3_inner3_name").addClass("main1_find_pw3_inner3_name_fail")
                $(".main1_find_pw3_inner3_name_validation2").css("display", "block");
            } 

            if( !$("input[name='find_pw_gender']").is(":checked")  ) {
                $(".main1_find_pw3_inner3_gender_validation").css("display", "block");
            }

            if( $("input[name='find_pw_birth']").val() == "" ) {
                $(".main1_find_pw3_inner3_birth").addClass("main1_find_pw3_inner3_birth_fail")
                $(".mai1_find_pw3_inner3_birth_validation2").css("display", "block");
            } 



        }

    

    })




    // 이메일로 인증번호가 전송되었습니다.
    // $(".main1_find_pw3_inner3_mail_btn").



    // 이메일 입력 체크
    $("input[name='find_pw_mail']").on("input", function() {
        if( emailValidation($(this).val())  ) {
            $(".main1_find_pw3_inner3_mail").addClass("main1_find_pw3_inner3_mail_pass");
        } else {
            $(".main1_find_pw3_inner3_mail").removeClass("main1_find_pw3_inner3_mail_pass");
        }
    });


    // 이메일 유효성 검사
    function emailValidation(id) {
        let userIdRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return userIdRegex.test(id);
    }

    let randomNumber = Math.floor(Math.random() * 1000000);
    let paddedRandomNumber = randomNumber.toString().padStart(6, '0'); // 인증번호

    $(".main1_find_pw3_inner3_mail_btn").click(function(e) {
        e.preventDefault();
        console.log(paddedRandomNumber);
        if( $(".main1_find_pw3_inner3_mail").hasClass("main1_find_pw3_inner3_mail_pass") ) {
            alert("인증번호 메일 보내기(콘솔창 확인)");
            $(this).text("재요청");
        }

    })


    $(".verification_code_btn").click(function(e) {
        e.preventDefault();
        if( $("input[name='find_pw_verification_code']").val() == paddedRandomNumber)  {
            alert("이메일 인증이 완료되었습니다.");
            $(".main1_find_pw3_inner3_verification_code").addClass("main1_find_pw3_inner3_verification_code_pass");
            $("input[name='main1_find_pw3_inner3_mail']").prop("disabled", true);
            $("input[name='find_pw_verification_code']").prop("disabled", true);

            $(".main1_find_pw3_inner4").addClass("main1_find_pw3_inner4_active");
        } else {
            alert("인증번호를 확인해주세요.");
        }
        

    });


    $(".main1_find_pw3_inner4").click(function() {

        if( $(this).hasClass("main1_find_pw3_inner4_active") ) {
			$("input[name='find_pw_id']").prop("disabled", false);
			$("input[name='find_pw_name']").prop("disabled", false);
            $("input[name='find_pw_gender']").prop("disabled", false);
            $("input[name='find_pw_birth']").prop("disabled", false);
            $("form").submit();
        } 
    });









})







