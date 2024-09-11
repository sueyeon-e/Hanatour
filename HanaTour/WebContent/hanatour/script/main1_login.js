$(function() {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;


    $(".main1_login_form1 > div:nth-child(1)").click(function() {
        window.history.back();
    });



    let inputUserId = $("input[name='user_id']");
    let inputUserPw = $("input[name='user_pw']");


    // 아이디 입력 체크
    inputUserId.on("input", function() {
        if( inputUserIdValidation($(this).val())  ) {
            $(".main1_login_form3_id > span:nth-child(2)").addClass("main1_login_form3_id_confirm");
            if( $(".main1_login_form3_pw > span:nth-child(2").hasClass("main1_login_form3_pw_confirm")  ) {
                $(".main1_login_form3_login_btn").addClass("main1_login_form3_login_btn_active");
            }
        } else {
            $(".main1_login_form3_id > span:nth-child(2)").removeClass("main1_login_form3_id_confirm");
            $(".main1_login_form3_login_btn").removeClass("main1_login_form3_login_btn_active");
        }
    });


    // 아이디 유효성 검사
    function inputUserIdValidation(id) {
        // let userIdRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        let userIdRegex = /[a-z0-9]+/;

        
        return userIdRegex.test(id);
    }

    // 비밀번호 입력 체크
    inputUserPw.on("input", function() {
        if( $(this).val() != "" ) {
            $(".main1_login_form3_pw > span:nth-child(2)").addClass("main1_login_form3_pw_confirm");
            if( $(".main1_login_form3_id > span:nth-child(2)").hasClass("main1_login_form3_id_confirm") ) {
                $(".main1_login_form3_login_btn").addClass("main1_login_form3_login_btn_active");
            }
        } else {
            $(".main1_login_form3_pw > span:nth-child(2)").removeClass("main1_login_form3_pw_confirm");
            $(".main1_login_form3_login_btn").removeClass("main1_login_form3_login_btn_active");
        }
    })

    
    
    inputUserId.on("focus", function() {
        $(".main1_login_form3_after_click1").css("display", "none");
        $(".main1_login_form3_after_click2").css("display", "none");
        $(".main1_login_form3_id > input").css("border-color", " #ddd");
    })
    
    inputUserId.on("blur", function(){
        if( inputUserId.val() == "" ) {
            $(".main1_login_form3_id > input").css("border-color", " #ddd");
            $(".main1_login_form3_after_click2").css("display", "none");
        } else if(  !inputUserIdValidation(inputUserId.val()) ) {
            $(".main1_login_form3_after_click2").css("display", "block");
            $(".main1_login_form3_id > input").css("border-color", "red");
        } else {
            $(".main1_login_form3_after_click2").css("display", "none");
            $(".main1_login_form3_id > input").css("border-color", " #ddd");
        }
    });
        




    // 아이디 저장 버튼
    $(".main1_login_form4 > .main1_login_form4_left").click(function() {

         if( $(this).hasClass("main1_login_form4_save_id_active") ) {
            $(this).removeClass("main1_login_form4_save_id_active");
         } else {
            $(this).addClass("main1_login_form4_save_id_active");
         }
    });




    $("#main1_login_submit").click(function(e) {
        if( ! ( $(".main1_login_form3_login_btn").hasClass("main1_login_form3_login_btn_active") ) ) { 
            e.preventDefault();
        } 
    }) 
	
	// 간편로그인
   	$(".main1_login_form5_right > div").click(function() {
		alert("준비중입니다.");
	});

	// 회원가입
    $(".main1_login_form7").click(function() {
        window.location.href = contextPath + "/FlightController?command=joinEntrance";
    });





})