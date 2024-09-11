


$(function() {
	
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;


    $(".main1_join3_inner1 > div:nth-child(1) > div:nth-child(1").click(function() {
        window.history.back();
    });

    $(".main1_join3_inner1 > div:nth-child(2)").click(function() {
        window.location.href = contextPath + "/FlightController?command=main1";
    })


    let joinNameInput = $("input[name='join_name']");
    let joinGenderInput = $("input[name='join_gender']");
    let joinBirthInput = $("input[name='join_birth']");


    

    // 이름
    function nameValidation(name) {
        // let nameRegex = /^(?!^[ㄱ-ㅎㅏ-ㅣ]+$)[가-힣]+$/;
        let nameRegex = /^(?!^[ㄱ-ㅎㅏ-ㅣ]+$)[가-힣]{2,}$/;
        return nameRegex.test(name);
    }


    joinNameInput.on("input", function() {
       

        if( nameValidation( $(this).val() )   ) {
           $(".main1_join3_inner3_name").addClass("main1_join3_inner3_name_pass");
           $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_fail");
        } else {
            $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_pass");
            $(".main1_join3_inner3_name").addClass("main1_join3_inner3_name_fail");
        }
    });


    joinNameInput.on("focus", function() {
        $(".main1_join3_inner3_name_validation2").css("display", "none");
        if( $(".main1_join3_inner3_name").hasClass("main1_join3_inner3_name_fail") ) {
            $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_fail");
            $(".main1_join3_inner3_name_validation1").css("display", "none");
        } 
    });


    joinNameInput.on("blur", function() {
        if( !nameValidation ( $(joinNameInput).val() ) ) {
            $(".main1_join3_inner3_name").addClass("main1_join3_inner3_name_fail");
        } else {
            $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_fail");
        }

        if( $(".main1_join3_inner3_name").hasClass("main1_join3_inner3_name_fail") ) {
            $(".main1_join3_inner3_name_validation1").css("display", "block");
        } else {
        }
        
        if( joinNameInput.val() == "" ) {
            $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_pass");
            $(".main1_join3_inner3_name").removeClass("main1_join3_inner3_name_fail");
            $(".main1_join3_inner3_name_validation1").css("display", "none");
        }
    });




    // 성별
    // function genderValidation() {
    //    if( joinGenderInput.is(":checked") ) {
    //     return true;
    //    } else {
    //     return false;
    //    }
    // }

    $(".main1_join3_inner3_gender > div").click(function(e) {

        if( $("input[name='join_gender']").prop("disabled")  ==  true ) {
            e.preventDefault();
        } else {
            
        	$(".main1_join3_inner3_gender_validation").css("display", "none");
            $(this).parent().find(".main1_join3_inner3_gender_active").removeClass("main1_join3_inner3_gender_active");
            $(this).addClass("main1_join3_inner3_gender_active");
            $(this).find("input").prop("checked", true);
        }
    })





    // 생년월일
    function birthValidation(birth) {
        let birthRegex = /^(19\d{2}|20\d{2})(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
        return birthRegex.test(birth);
    }
  

    joinBirthInput.on("input", function() {
        
        if( birthValidation( $(this).val() ) ) {
            $(".main1_join3_inner3_birth").addClass("main1_join3_inner3_birth_pass");
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_fail");
        } else {
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_pass");
            $(".main1_join3_inner3_birth").addClass("main1_join3_inner3_birth_fail");


        }
    })

    joinBirthInput.on("focus", function() {
        $(".mai1_join3_inner3_birth_validation2").css("display", "none");
        if( $(".main1_join3_inner3_birth").hasClass("main1_join3_inner3_birth_fail") ) {
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_fail");
            $(".main1_join3_inner3_birth_validation1").css("display", "none");
        } 

    });


    joinBirthInput.on("blur", function() {

        if( !birthValidation ( $(joinBirthInput).val() ) ) {
            $(".main1_join3_inner3_birth").addClass("main1_join3_inner3_birth_fail");
        } else {
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_fail");
        }

        if( $(".main1_join3_inner3_birth").hasClass("main1_join3_inner3_birth_fail") ) {
            $(".main1_join3_inner3_birth_validation1").css("display", "block");
        } else {
        }
        
        if( joinBirthInput.val() == "" ) {
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_pass");
            $(".main1_join3_inner3_birth").removeClass("main1_join3_inner3_birth_fail");
            $(".main1_join3_inner3_birth_validation1").css("display", "none");
        }


    });






    let currentDate = new Date();
    let currentYear = currentDate.getFullYear();
    // 실명인증 요청 버튼
    $(".main1_join3_inner3_birth_btn").on("click", function(e) {

        e.preventDefault();


        if( $("input[name='join_birth']").val() == "" 
            || ( currentYear - $("input[name='join_birth']").val().substring(0,4) ) < 15) {
                
                alert("만 14세 이상만 회원 가입 가능합니다.")


        } else if( $(".main1_join3_inner3_name").hasClass("main1_join3_inner3_name_pass")
                && ( $(".main1_join3_inner3_gender").find(".main1_join3_inner3_gender_active").length > 0)
                && $(".main1_join3_inner3_birth").hasClass("main1_join3_inner3_birth_pass") ) {
                
                alert("실명확인 되었습니다.")

                $("input[name='join_mail']").prop("disabled", false);
                $(".main1_join3_inner3_mail_btn").prop("disabled", false);


                $("input[name='join_verification_code']").prop("disabled", false);
                $(".verification_code_btn").prop("disabled", false);

                $("input[name='join_name']").prop("disabled", true);
                $("input[name='join_gender']").prop("disabled", true);
                $("input[name='join_birth']").prop("disabled", true);

        } else {


            if( $("input[name='join_name']").val() == "" ) {
                $(".main1_join3_inner3_name").addClass("main1_join3_inner3_name_fail")
                $(".main1_join3_inner3_name_validation2").css("display", "block");
            } 

            if( !$("input[name='join_gender']").is(":checked")  ) {
                $(".main1_join3_inner3_gender_validation").css("display", "block");
            }

            if( $("input[name='join_birth']").val() == "" ) {
                $(".main1_join3_inner3_birth").addClass("main1_join3_inner3_birth_fail")
                $(".mai1_join3_inner3_birth_validation2").css("display", "block");
            } 



        }

    

    })




    // 이메일로 인증번호가 전송되었습니다.
    // $(".main1_join3_inner3_mail_btn").



    // 이메일 입력 체크
    $("input[name='join_mail']").on("input", function() {
        if( emailValidation($(this).val())  ) {
            $(".main1_join3_inner3_mail").addClass("main1_join3_inner3_mail_pass");
        } else {
            $(".main1_join3_inner3_mail").removeClass("main1_join3_inner3_mail_pass");
        }
    });


    // 이메일 유효성 검사
    function emailValidation(id) {
        let userIdRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        return userIdRegex.test(id);
    }

    let randomNumber = Math.floor(Math.random() * 1000000);
    let paddedRandomNumber = randomNumber.toString().padStart(6, '0'); // 인증번호

    $(".main1_join3_inner3_mail_btn").click(function(e) {
        e.preventDefault();
        console.log(paddedRandomNumber);
        if( $(".main1_join3_inner3_mail").hasClass("main1_join3_inner3_mail_pass") ) {
            alert("인증번호 메일 보내기(콘솔창 확인)");
            $(this).text("재요청");
        }

    })


    $(".verification_code_btn").click(function(e) {
        e.preventDefault();
        if( $("input[name='join_verification_code']").val() == paddedRandomNumber)  {
            alert("이메일 인증이 완료되었습니다.");
            $(".main1_join3_inner3_verification_code").addClass("main1_join3_inner3_verification_code_pass");
            $("input[name='main1_join3_inner3_mail']").prop("disabled", true);
            $("input[name='join_verification_code']").prop("disabled", true);

            $(".main1_join3_inner4").addClass("main1_join3_inner4_active");
        } else {
            alert("인증번호를 확인해주세요.");
        }
        

    });



    $(".main1_join3_inner4").click(function() {

        if( $(this).hasClass("main1_join3_inner4_active") ) {
			$("input[name='join_name']").prop("disabled", false);
            $("input[name='join_gender']").prop("disabled", false);
            $("input[name='join_birth']").prop("disabled", false);
            $("form").submit();
        } 
    });







})